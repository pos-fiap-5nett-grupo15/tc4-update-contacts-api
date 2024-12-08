using UpdateContact.Application.DTOs.Contact.UpdateContact;
using FluentValidation;

namespace UpdateContact.Application.DTOs.Validations
{
    public class ContactValidation : AbstractValidator<UpdateContactRequest>
    {
        public ContactValidation()
        {
            RuleFor(c => c.Nome)
                .NotEmpty().WithMessage("O campo {PropertyName} precisa ser fornecido");

            RuleFor(c => c.Email)
                .NotEmpty().WithMessage("O campo {PropertyName} precisa ser fornecido");

            RuleFor(c => c.Ddd.ToString())
                .NotEmpty().WithMessage("O campo {PropertyName} precisa ser fornecido");

            RuleFor(c => c.Telefone.ToString())
                .NotEmpty().WithMessage("O campo {PropertyName} precisa ser fornecida");
        }
    }
}

