namespace CreateContact.Infrastructure.Settings
{
    public interface IRabbitMQConsumerSettings
    {
        public string Queue { get; }
        public string Host { get; }
        public string Username { get; }
        public string Password { get; }
    }
}
