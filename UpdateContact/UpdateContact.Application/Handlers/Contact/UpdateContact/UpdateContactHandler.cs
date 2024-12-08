using FluentValidation;
using MediatR;
using Microsoft.Extensions.Logging;
using TechChallenge.Common.RabbitMQ;
using TechChallenge.Domain.Entities.Contact;
using TechChallenge.Domain.Enums;
using UpdateContact.Application.DTOs.Contact.UpdateContact;
using UpdateContact.Infrastructure.Services.Contact;
using UpdateContact.Infrastructure.Settings;
using UpdateContact.Worker.Messages;

namespace UpdateContact.Application.Handlers.Contact.UpdateContact
{
    public class UpdateContactHandler : IRequestHandler<UpdateContactRequest, UpdateContactResponse>
    {
        private readonly IContactService _contactService;
        private readonly ILogger<UpdateContactHandler> _logger;
        private readonly IValidator<UpdateContactRequest> _validator;
        private readonly IRabbitMQProducerSettings _rabbitMQProducerSettings;

        public UpdateContactHandler(
            IContactService contactService,
            ILogger<UpdateContactHandler> logger,
            IValidator<UpdateContactRequest> validator,
            IRabbitMQProducerSettings rabbitMQProducerSettings)
        {
            _logger = logger;
            _validator = validator;
            _contactService = contactService;
            _rabbitMQProducerSettings = rabbitMQProducerSettings;
        }

        public async Task<UpdateContactResponse> Handle(UpdateContactRequest requisicao, CancellationToken ct)
        {
            if (Validate(requisicao) is var validacao && !string.IsNullOrWhiteSpace(validacao.ErrorDescription))
                return validacao;

            var sucess = await _contactService.UpdateByIdAsync(Mapper(requisicao), requisicao.Id);

            await RabbitMQManager.Publish(
                new UpdateContactMessage
                {
                    Id = requisicao.Id,
                    UpdateSucess = sucess,
                },
                _rabbitMQProducerSettings.Host,
                _rabbitMQProducerSettings.Exchange,
                _rabbitMQProducerSettings.RoutingKey,
                ct);

            return new UpdateContactResponse();
        }

        public UpdateContactResponse Validate(UpdateContactRequest requisicao)
        {
            var retorno = new UpdateContactResponse();
            var result = _validator.Validate(requisicao);
            if (!result.IsValid)
            {
                var erroMensagem = "";
                foreach (var error in result.Errors)
                    erroMensagem += error.ErrorMessage + " ";

                retorno.ErrorDescription = erroMensagem;
            }

            return retorno;
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
