using TechChallenge3.Infrastructure.UnitOfWork;
using UpdateContact.Infrastructure.Repositories.Contact;

namespace UpdateContact.Infrastructure.UnitOfWork
{
    public interface IUpdateContactUnitOfWork : IBaseUnitOfWork
    {
        IContactRepository ContactRepository { get; }
    }
}
