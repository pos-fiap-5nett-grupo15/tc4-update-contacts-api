using CreateContact.Infrastructure.Repositories.Contact;
using System.Transactions;
using TechChallenge.Infrastructure.UnitOfWork;

namespace CreateContact.Infrastructure.UnitOfWork
{
    public interface IUpdateContactUnitOfWork : IBaseUnitOfWork
    {
        IContactRepository ContactRepository { get; }
    }
}
