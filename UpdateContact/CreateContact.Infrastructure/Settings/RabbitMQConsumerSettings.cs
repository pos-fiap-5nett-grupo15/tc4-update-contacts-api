namespace CreateContact.Infrastructure.Settings
{
    public class RabbitMQConsumerSettings : IRabbitMQConsumerSettings
    {
        public string Queue { get; set; }
        public string Host { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
    }
}
