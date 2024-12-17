namespace UpdateContact.Infrastructure.Settings
{
    public class RabbitMQProducerSettings : IRabbitMQProducerSettings
    {
        public string Host { get; set; }
        public int Port { get; set; }
        public string Exchange { get; set; }
        public string RoutingKey { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
    }
}
