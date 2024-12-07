using CreateContact.Infrastructure.Repositories.Contact;
using TechChallenge.Infrastructure.UnitOfWork;

namespace CreateContact.Infrastructure.UnitOfWork
{
    public sealed class UpdateContactUnitOfWork : BaseUnitOfWork, IUpdateContactUnitOfWork
    {
        private readonly ITechDatabase _techDabase;

        public IContactRepository ContactRepository { get; }

        public UpdateContactUnitOfWork(ITechDatabase database)
            : base(database)
        {
            this._techDabase = database ?? throw new ArgumentNullException(nameof(database));

            this.ContactRepository = new ContactRepository(this._techDabase);
        }
    }
}
