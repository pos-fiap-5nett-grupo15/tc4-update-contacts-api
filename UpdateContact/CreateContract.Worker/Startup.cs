﻿using CreateContact.Application.Consumers.Contact.UpdateContact;
using CreateContact.Infrastructure.RabbitMQ;
using CreateContact.Infrastructure.Services.Contact;
using CreateContact.Infrastructure.Settings;
using CreateContact.Infrastructure.UnitOfWork;
using CreateContract.Worker.Consumers;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using TechChallenge.Infrastructure.Crypto;
using TechChallenge.Infrastructure.Settings;
using TechChallenge.Infrastructure.UnitOfWork;

namespace CreateContract.Worker
{
    internal class Startup
    {
        public IConfiguration Configuration;

        public Startup(IConfiguration configuration) =>
            this.Configuration = configuration ?? throw new ArgumentNullException(nameof(configuration));

        internal void Configure(IApplicationBuilder app, IWebHostEnvironment environment) { }

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
