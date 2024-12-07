using CreateContact.Infrastructure.Settings;
using RabbitMQ.Client;

namespace CreateContact.Infrastructure.RabbitMQ
{
    public class RabbitMQConnector
    {
        public readonly IRabbitMQConsumerSettings RabbitMQSettings;

        public RabbitMQConnector(IRabbitMQConsumerSettings? rabbitMQSettings) =>
            RabbitMQSettings = rabbitMQSettings ?? throw new ArgumentNullException(nameof(rabbitMQSettings));

        public Task<IConnection> GetConnection()
        {
            var factory = new ConnectionFactory
            {
                HostName = RabbitMQSettings.Host,
                UserName = RabbitMQSettings.Username,
                Password = RabbitMQSettings.Password
            };
            return Task.Run(async () => await factory.CreateConnectionAsync());
        }
    }
}
