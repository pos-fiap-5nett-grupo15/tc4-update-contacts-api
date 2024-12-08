using MediatR;
using System.Text.Json.Serialization;

namespace UpdateContact.Application.DTOs.Contact.UpdateContact
{
    public class UpdateContactRequest : IRequest<UpdateContactResponse>
    {
        [JsonIgnore]
        public int Id { get; set; }
        public string? Nome { get; set; }
        public string? Email { get; set; }
        public int? Ddd { get; set; }
        public int? Telefone { get; set; }
    }
}
