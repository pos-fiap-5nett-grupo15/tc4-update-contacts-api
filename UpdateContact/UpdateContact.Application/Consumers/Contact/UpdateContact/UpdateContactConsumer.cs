using Microsoft.Extensions.Logging;
using TechChallenge3.Common.RabbitMQ;
using TechChallenge3.Domain.Entities.Contact;
using TechChallenge3.Domain.Enums;
using UpdateContact.Application.DTOs.Contact.UpdateContact;
using UpdateContact.Infrastructure.Services.Contact;
using UpdateContact.Infrastructure.Settings;
using UpdateContact.Worker.Messages;

namespace UpdateContact.Application.Consumers.Contact.UpdateContact
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
            if (message != null && await _contactService.GetByIdAsync(message.Id) is var contact && contact is not null)
            {
                if (await _contactService.UpdateByIdAsync(Mapper(message.UpdateData), message.Id))
                    await _contactService.UpdateStatusByIdAsync(contact, ContactSituationEnum.ATUALIZADO);
                else
                    _logger.LogWarning($"Fail to update contact {message.Id}");

                return;
            }
            else
            {
                _logger.LogWarning($"An invalid message was received with contact id: {message.Id}.");

                await RabbitMQManager.PublishAsync(
                    new UpdateContactMessage { Id = message.Id },
                    hostName: _rabbitMQProducerSettings.Host,
                    port: _rabbitMQProducerSettings.Port,
                    userName: _rabbitMQProducerSettings.Username,
                    password: _rabbitMQProducerSettings.Password,
                    exchangeName: _rabbitMQProducerSettings.Exchange,
                    routingKeyName: _rabbitMQProducerSettings.RoutingKey,
                    ct);
                return;
            }
        }

        public static ContactEntity Mapper(UpdateContactRequest request) =>
            new(nome: request.Nome ?? string.Empty,
                email: request.Email ?? string.Empty,
                ddd: request.Ddd ?? 0,
                telefone: request.Telefone ?? 0,
                situacaoAnterior: null,
                situacaoAtual: ContactSituationEnum.PENDENTE_ATUALIZACAO);
    }
}