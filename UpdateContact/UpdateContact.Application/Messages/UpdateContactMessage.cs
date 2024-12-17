using MediatR;
using UpdateContact.Application.DTOs.Contact.UpdateContact;

namespace UpdateContact.Worker.Messages
{
    public class UpdateContactMessage
    {
        public int Id { get; set; }
        public UpdateContactRequest UpdateData { get; set; }
    }
}
