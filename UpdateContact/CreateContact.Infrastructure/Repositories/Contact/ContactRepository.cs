using Dapper;
using TechChallenge.Domain.Entities.Contact;
using TechChallenge.Infrastructure.UnitOfWork;

namespace CreateContact.Infrastructure.Repositories.Contact
{
    public class ContactRepository : IContactRepository
    {
        private readonly ITechDatabase _database;
        private const string TABLE_NAME = "Contact";
        private const string SCHEMA = "ContactsManagement";

        public ContactRepository(ITechDatabase database) =>
            _database = database ?? throw new ArgumentNullException(nameof(database));

        public async Task<ContactEntity?> GetByIdAsync(int id) =>
            await _database.Connection.QueryFirstOrDefaultAsync<ContactEntity>(
                $"SELECT * FROM [{SCHEMA}].[{TABLE_NAME}] WHERE {nameof(ContactEntity.Id)} = {id};");

        public async Task<bool> UpdateByIdAsync(ContactEntity contactEntity, int id)
        {
            var sucess = false;
            var updates = new List<string>();

            if (!string.IsNullOrWhiteSpace(contactEntity.Nome))
                updates.Add($"{nameof(ContactEntity.Nome)} = '{contactEntity.Nome}'");
            if (!string.IsNullOrWhiteSpace(contactEntity.Email))
                updates.Add($"{nameof(ContactEntity.Email)} = '{contactEntity.Email}'");
            if (contactEntity.Ddd > 0)
                updates.Add($"{nameof(ContactEntity.Ddd)} = {contactEntity.Ddd}");
            if (contactEntity.Telefone > 0)
                updates.Add($"{nameof(ContactEntity.Telefone)} = {contactEntity.Telefone}");

            if (updates.Count > 0)
            {
                sucess = await _database.Connection.ExecuteAsync($@"UPDATE [{SCHEMA}].[{TABLE_NAME}] 
                                                                    SET {string.Join(",", updates)}
                                                                    WHERE {nameof(ContactEntity.Id)} = {id};") > 0;
            }

            return sucess;
        }

        public async Task<ContactEntity?> UpdateStatusByIdAsync(int id, int? situacaoAnterior, int novaSituacao) =>
            await _database.Connection.QueryFirstOrDefaultAsync<ContactEntity>(
                $@"UPDATE [{SCHEMA}].[{TABLE_NAME}]
                   SET
                    {nameof(ContactEntity.SituacaoAnterior)} = {(situacaoAnterior.HasValue ? situacaoAnterior.Value : "NULL")},
                    {nameof(ContactEntity.SituacaoAtual)} = {novaSituacao}
                   WHERE {nameof(ContactEntity.Id)} = {id};");
    }
}
