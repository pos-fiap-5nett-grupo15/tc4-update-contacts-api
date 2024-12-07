using TechChallenge.Domain.Entities.Contact;

namespace CreateContact.Infrastructure.Repositories.Contact
{
    public interface IContactRepository
    {
        Task<ContactEntity?> GetByIdAsync(int id);
        Task<bool> UpdateByIdAsync(ContactEntity contactEntity, int id);
        Task<ContactEntity?> UpdateStatusByIdAsync(int id, int? situacaoAnterior, int novaSituacao);
    }
}
