namespace CreateContact.Infrastructure.Settings
{
    public class RabbitMQProducerSettings : IRabbitMQProducerSettings
    {
        public string Host { get; set; }
        public string Exchange { get; set; }
        public string RoutingKey { get; set; }
    }
}
