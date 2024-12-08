using UpdateContact.Infrastructure.Repositories.Contact;
using System.Transactions;
using TechChallenge.Infrastructure.UnitOfWork;

namespace UpdateContact.Infrastructure.UnitOfWork
{
    public interface IUpdateContactUnitOfWork : IBaseUnitOfWork
    {
        IContactRepository ContactRepository { get; }
    }
}
