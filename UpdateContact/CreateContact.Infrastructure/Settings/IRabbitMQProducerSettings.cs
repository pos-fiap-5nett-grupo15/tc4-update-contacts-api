namespace CreateContact.Infrastructure.Settings
{
    public interface IRabbitMQProducerSettings
    {
        public string Host { get; }
        public string Exchange { get; }
        public string RoutingKey { get; }
    }
}
