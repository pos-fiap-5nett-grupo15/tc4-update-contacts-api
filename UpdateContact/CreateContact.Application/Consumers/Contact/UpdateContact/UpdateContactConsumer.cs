using CreateContact.Infrastructure.Services.Contact;
using CreateContact.Infrastructure.Settings;
using CreateContact.Worker.Messages;
using Microsoft.Extensions.Logging;
using TechChallenge.Common.RabbitMQ;
using TechChallenge.Domain.Enums;

namespace CreateContact.Application.Consumers.Contact.UpdateContact
{
    public class UpdateContactConsumer : IUpdateContactConsumer
    {
        private readonly IContactService _contactService;
        private readonly ILogger<UpdateContactConsumer> _logger;
        private readonly IRabbitMQProducerSettings _rabbitMQProducerSettings;

        public UpdateContactConsumer(
            IContactService contactService,
            ILogger<UpdateContactConsumer> logger,
            IRabbitMQProducerSettings rabbitMQProducerSettings)
        {
            _logger = logger;
            _contactService = contactService;
            _rabbitMQProducerSettings = rabbitMQProducerSettings;
        }

        public async Task HandleAsync(UpdateContactMessage message, CancellationToken ct)
        {
            if (await _contactService.GetByIdAsync(message.Id) is var contact && contact is not null)
            {
                if (message.UpdateSucess)
                    await _contactService.UpdateStatusByIdAsync(contact, ContactSituationEnum.ATUALIZADO);
                else
                    _logger.LogWarning($"Fail to update contact {message.Id}");

                return;
            }
            else
            {
                _logger.LogWarning($"An invalid message was received with contact id: {message.Id}.");

                await RabbitMQManager.Publish(
                    new UpdateContactMessage { Id = message.Id },
                    _rabbitMQProducerSettings.Host,
                    _rabbitMQProducerSettings.Exchange,
                    _rabbitMQProducerSettings.RoutingKey,
                    ct);
                return;
            }
        }
    }
}