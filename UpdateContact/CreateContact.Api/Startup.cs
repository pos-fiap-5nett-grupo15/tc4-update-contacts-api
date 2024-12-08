using UpdateContact.Application.DTOs.Contact.UpdateContact;
using UpdateContact.Application.DTOs.Validations;
using UpdateContact.Application.Handlers.Contact.CreateContact;
using UpdateContact.Infrastructure.Services.Contact;
using UpdateContact.Infrastructure.Settings;
using UpdateContact.Infrastructure.UnitOfWork;
using FluentValidation;
using TechChallenge.Infrastructure.DefaultStartup;
using TechChallenge.Infrastructure.Middlewares;
using Prometheus;

namespace UpdateContact.Api
{
    internal class Startup : BaseStartup
    {
        public IConfiguration Configuration;

        public Startup(IConfiguration configuration)
            : base(configuration)
        {
            this.Configuration = configuration;
        }

        internal void ConfigureImpl(IApplicationBuilder app, IWebHostEnvironment environment)
        {
            this.Configure(app, environment);

            app.UseMiddleware<RequestCounterMiddleware>();
            app.UseMetricServer();
        }

        internal void ConfigureServiceImpl(IServiceCollection services)
        {
            this.ConfigureService(services);
            services.AddLogging();

            ConfigureUnitOfWork(services);
            ConfigureHandleServices(services);
            ConfigureContactServices(services);
        }

        private void ConfigureContactServices(IServiceCollection services)
        {
            services.AddScoped<IContactService, ContactService>();
        }

        private void ConfigureHandleServices(IServiceCollection services)
        {
            services.AddSingleton<IRabbitMQProducerSettings>(Configuration.GetSection(nameof(RabbitMQProducerSettings))?.Get<RabbitMQProducerSettings>() ?? throw new ArgumentNullException(nameof(RabbitMQProducerSettings)));

            services.AddMediatR(cfg => cfg.RegisterServicesFromAssembly(typeof(CreateContactHandler).Assembly));
            services.AddTransient<IValidator<UpdateContactRequest>, ContactValidation>();
        }

        private void ConfigureUnitOfWork(IServiceCollection services)
        {
            services.AddScoped<IUpdateContactUnitOfWork, UpdateContactUnitOfWork>();
        }
    }
}
