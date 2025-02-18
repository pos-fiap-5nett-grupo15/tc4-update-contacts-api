using RabbitMQ.Client;
using RabbitMQ.Client.Events;
using System.Text;
using System.Text.Json;
using UpdateContact.Application.Consumers.Contact.UpdateContact;
using UpdateContact.Infrastructure.RabbitMQ;
using UpdateContact.Worker.Messages;

namespace UpdateContract.Worker.Consumers
{
    public class RabbitMQConsumer : BackgroundService
    {
        private readonly IChannel _channel;
        private readonly IConnection _connection;
        private readonly IServiceProvider _serviceProvider;
        private readonly string _queueName;
        private readonly ILogger<RabbitMQConsumer> _logger;

        public RabbitMQConsumer(
            RabbitMQConnector rabbitMQService,
            IServiceProvider serviceProvider,
            ILogger<RabbitMQConsumer> logger)
        {
            try
            {
                _logger = logger;

                _logger.LogInformation("Configuring RabbitMQConsumer");
                _serviceProvider = serviceProvider ?? throw new ArgumentNullException(nameof(serviceProvider));
                rabbitMQService = rabbitMQService ?? throw new ArgumentNullException(nameof(rabbitMQService));

                _queueName = rabbitMQService.RabbitMQSettings.Queue;
                _connection = rabbitMQService.GetConnection().Result;
                _channel = _connection.CreateChannelAsync().Result;

                _logger.LogInformation("RabbitMQConsumer info");
                _logger.LogInformation($"queueName: {_queueName}\n" +
                                       $"connection: {_connection}\n" +
                                       $"channel: {_channel}");
            }
            catch (Exception ex)
            {
                _logger.LogError($"Error to configure RabbitMQConsumer: {ex.Message}", ex);
                throw;
            }
        }

        protected override async Task ExecuteAsync(CancellationToken ct)
        {
            var consumer = new AsyncEventingBasicConsumer(_channel);
            consumer.ReceivedAsync += async (_, eventArgs) =>
            {
                var body = eventArgs.Body.ToArray();
                var message = Encoding.UTF8.GetString(body);

                using (var scope = _serviceProvider.CreateScope())
                {
                    _logger.LogInformation("Event received");
                    var handler = scope.ServiceProvider.GetRequiredService<IUpdateContactConsumer>();
                    var exampleMessage = JsonSerializer.Deserialize<UpdateContactMessage>(message);
                    if (exampleMessage != null)
                    {
                        _logger.LogInformation("Handling event");
                        await handler.HandleAsync(exampleMessage, ct);
                    }
                }

                await _channel.BasicAckAsync(eventArgs.DeliveryTag, false, ct);
            };

            await _channel.BasicConsumeAsync(queue: _queueName, autoAck: false, consumer: consumer, ct);
        }

        public override void Dispose()
        {
            _channel.CloseAsync();
            _connection.CloseAsync();
            base.Dispose();
        }
    }
}