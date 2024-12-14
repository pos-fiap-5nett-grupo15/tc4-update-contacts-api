using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Prometheus;
using TechChallenge3.Infrastructure.Crypto;
using TechChallenge3.Infrastructure.Settings;
using TechChallenge3.Infrastructure.UnitOfWork;
using UpdateContact.Application.Consumers.Contact.UpdateContact;
using UpdateContact.Infrastructure.RabbitMQ;
using UpdateContact.Infrastructure.Services.Contact;
using UpdateContact.Infrastructure.Settings;
using UpdateContact.Infrastructure.UnitOfWork;
using UpdateContract.Worker.Consumers;

namespace UpdateContract.Worker
{
    internal class Startup
    {
        public IConfiguration Configuration;

        public Startup(IConfiguration configuration) =>
            this.Configuration = configuration ?? throw new ArgumentNullException(nameof(configuration));

        internal void Configure(IApplicationBuilder app, IWebHostEnvironment environment)
        {
            app.UseMetricServer();
        }

        internal void ConfigureService(IServiceCollection services)
        {
            // Logging
            services.AddLogging();

            this.ConfigureRabitMQ(services);
            this.ConfigureDatabase(services);
            this.ConfigureCustomServices(services);
            this.ConfigureConsumers(services);
        }

        private void ConfigureRabitMQ(IServiceCollection services)
        {
            services.AddSingleton<IRabbitMQProducerSettings>(Configuration.GetSection(nameof(RabbitMQProducerSettings))?.Get<RabbitMQProducerSettings>() ?? throw new ArgumentNullException(nameof(RabbitMQProducerSettings)));
            services.AddSingleton(new RabbitMQConnector(Configuration.GetSection(nameof(RabbitMQConsumerSettings))?.Get<RabbitMQConsumerSettings>()));
            services.AddHostedService<RabbitMQConsumer>();
        }

        private void ConfigureDatabase(IServiceCollection services)
        {
            var cryptoService = new CryptoService(Configuration.GetSection(nameof(CryptoSettings)).Get<CryptoSettings>());
            services.AddSingleton((ICryptoService)cryptoService);
            services.AddScoped<ITechDatabase, TechDatabase>();
            services.AddScoped<IUpdateContactUnitOfWork, UpdateContactUnitOfWork>();
        }

        private void ConfigureCustomServices(IServiceCollection services) =>
            services.AddScoped<IContactService, ContactService>();

        private void ConfigureConsumers(IServiceCollection services) =>
            services.AddScoped<IUpdateContactConsumer, UpdateContactConsumer>();

    }
}
