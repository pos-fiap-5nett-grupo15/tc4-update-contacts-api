using UpdateContact.Infrastructure.UnitOfWork;
using TechChallenge.Domain.Entities.Contact;
using TechChallenge.Domain.Enums;

namespace UpdateContact.Infrastructure.Services.Contact
{
    public class ContactService : IContactService
    {
        private readonly IUpdateContactUnitOfWork _unitOfWork;

        public ContactService(IUpdateContactUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<ContactEntity?> GetByIdAsync(int id)
        {
            return await _unitOfWork.ContactRepository.GetByIdAsync(id);
        }

        public async Task<ContactEntity?> UpdateStatusByIdAsync(ContactEntity contactEntity, ContactSituationEnum novoStatus)
        {
            return await _unitOfWork.ContactRepository.UpdateStatusByIdAsync(contactEntity.Id, (int?)contactEntity.SituacaoAtual, (int)novoStatus);
        }

        public async Task<bool> UpdateByIdAsync(ContactEntity contactEntity, int id)
        {
            return await _unitOfWork.ContactRepository.UpdateByIdAsync(contactEntity, id);
        }
    }
}
