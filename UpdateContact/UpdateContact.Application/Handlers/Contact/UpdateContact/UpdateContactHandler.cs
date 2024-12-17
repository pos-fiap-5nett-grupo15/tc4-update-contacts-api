using FluentValidation;
using MediatR;
using Microsoft.Extensions.Logging;
using System.Net;
using TechChallenge3.Common.RabbitMQ;
using TechChallenge3.Domain.Entities.Contact;
using TechChallenge3.Domain.Enums;
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
            if (requisicao is null)
            {
                return new UpdateContactResponse()
                {
                    ErrorCode = (int)HttpStatusCode.BadRequest,
                    ErrorDescription = "Contact body cannot be null",
                };
            }
            else if (Validate(requisicao) is var validacao && !string.IsNullOrWhiteSpace(validacao.ErrorDescription))
            {
                validacao.ErrorCode = (int)HttpStatusCode.BadRequest;
                return validacao;
            }
            else if (await _contactService.GetByIdAsync(requisicao.Id) is null)
            {
                validacao.ErrorCode = (int)HttpStatusCode.NotFound;
                validacao.ErrorDescription = $"Contact {requisicao.Id} not found";
                return validacao;
            }

            var sucess = await _contactService.UpdateByIdAsync(Mapper(requisicao), requisicao.Id);

            await RabbitMQManager.PublishAsync(
                new UpdateContactMessage
                {
                    Id = requisicao.Id,
                    UpdateSucess = sucess,
                },
                hostName: _rabbitMQProducerSettings.Host,
                port: _rabbitMQProducerSettings.Port,
                userName: _rabbitMQProducerSettings.Username,
                password: _rabbitMQProducerSettings.Password,
                exchangeName: _rabbitMQProducerSettings.Exchange,
                routingKeyName: _rabbitMQProducerSettings.RoutingKey,
                ct);

            return new UpdateContactResponse()
            {
                IsSuccess = true,
            };
        }

        public UpdateContactResponse Validate(UpdateContactRequest requisicao)
        {
            var retorno = new UpdateContactResponse();
            var result = _validator.Validate(requisicao);
            if (result is null)
            {
                retorno.ErrorCode = (int)HttpStatusCode.InternalServerError;
                retorno.ErrorDescription = "Unabled to validate request body";
            }
            else if (!result.IsValid)
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
