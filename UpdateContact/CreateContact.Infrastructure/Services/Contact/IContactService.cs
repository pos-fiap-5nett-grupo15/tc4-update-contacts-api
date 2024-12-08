using TechChallenge.Domain.Entities.Contact;
using TechChallenge.Domain.Enums;

namespace UpdateContact.Infrastructure.Services.Contact
{
    public interface IContactService
    {
        Task<ContactEntity?> GetByIdAsync(int id);
        Task<ContactEntity?> UpdateStatusByIdAsync(ContactEntity contactEntity, ContactSituationEnum novoStatus);
        Task<bool> UpdateByIdAsync(ContactEntity contactEntity, int id);
    }
}
