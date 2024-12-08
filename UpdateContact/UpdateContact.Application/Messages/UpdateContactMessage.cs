using MediatR;

namespace UpdateContact.Worker.Messages
{
    public class UpdateContactMessage
    {
        public int Id { get; set; }
        public bool UpdateSucess { get; set; }
    }
}
