using CreateContact.Worker.Messages;

namespace CreateContact.Application.Consumers.Contact.UpdateContact
{
    public interface IUpdateContactConsumer
    {
        Task HandleAsync(UpdateContactMessage message, CancellationToken ct);
    }
}
