using TechChallenge3.Domain.Entities.Contact;
using TechChallenge3.Domain.Enums;

namespace UpdateContact.Infrastructure.Services.Contact
{
    public interface IContactService
    {
        Task<ContactEntity?> GetByIdAsync(int id);
        Task<ContactEntity?> UpdateStatusByIdAsync(ContactEntity contactEntity, ContactSituationEnum novoStatus);
        Task<bool> UpdateByIdAsync(ContactEntity contactEntity, int id);
    }
}
