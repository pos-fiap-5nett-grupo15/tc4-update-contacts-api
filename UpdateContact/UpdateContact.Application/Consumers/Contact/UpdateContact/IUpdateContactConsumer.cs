using UpdateContact.Worker.Messages;

namespace UpdateContact.Application.Consumers.Contact.UpdateContact
{
    public interface IUpdateContactConsumer
    {
        Task HandleAsync(UpdateContactMessage message, CancellationToken ct);
    }
}
