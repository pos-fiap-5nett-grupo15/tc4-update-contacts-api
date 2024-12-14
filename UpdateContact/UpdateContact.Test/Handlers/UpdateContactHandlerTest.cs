
using FluentValidation;
using FluentValidation.Results;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Moq;
using System.Net;
using TechChallenge3.Domain.Entities.Contact;
using TechChallenge3.Domain.Enums;
using TechChallenge3.Infrastructure.Crypto;
using TechChallenge3.Infrastructure.UnitOfWork;
using UpdateContact.Application.DTOs.Contact.UpdateContact;
using UpdateContact.Application.DTOs.Validations;
using UpdateContact.Application.Handlers.Contact.UpdateContact;
using UpdateContact.Infrastructure.Repositories.Contact;
using UpdateContact.Infrastructure.Services.Contact;
using UpdateContact.Infrastructure.Settings;

namespace UpdateContact.Test.Handlers
{
    public class UpdateContactHandlerTest
    {
        private readonly UpdateContactHandler _updateContactHandler;
        private readonly IValidator<UpdateContactRequest> _validator;
        private readonly Mock<IContactService> _contactService;
        private readonly Mock<ILogger<UpdateContactHandler>> _logger;
        private readonly Mock<IRabbitMQProducerSettings> _rabbitSettings;

        public UpdateContactHandlerTest()
        {
            var services = new ServiceCollection();
            services.AddTransient<IValidator<UpdateContactRequest>, ContactValidation>();

            var serviceProvider = services.BuildServiceProvider();
            _validator = serviceProvider.GetService<IValidator<UpdateContactRequest>>() ?? throw new InvalidOperationException("Null validator");

            _rabbitSettings = new Mock<IRabbitMQProducerSettings>();
            _logger = new Mock<ILogger<UpdateContactHandler>>();
            _contactService = new Mock<IContactService>();
            _updateContactHandler = new UpdateContactHandler(
                _contactService.Object,
                _logger.Object,
                _validator,
                _rabbitSettings.Object);
        }
        [Fact]
        public async void UpdateContactSuccess()
        {
            //set
            _contactService.Setup(x => x.GetByIdAsync(It.IsAny<int>())).ReturnsAsync(new ContactEntity());
            _contactService.Setup(x => x.UpdateByIdAsync(It.IsAny<ContactEntity>(), It.IsAny<int>())).ReturnsAsync(true);
            _rabbitSettings.SetupGet(x => x.Host).Returns("localhost");
            _rabbitSettings.SetupGet(x => x.Exchange).Returns("tc3-test-exchange");
            _rabbitSettings.SetupGet(x => x.RoutingKey).Returns("tc3-test-routing-key");
            var requestData = new UpdateContactRequest()
            {
                Id = new Random().Next(1, 100),
                Nome = GenerateRandomString(),
                Ddd = int.TryParse(GenerateRandomString(2, true), out int ddd) ? ddd : 99,
                Email = GenerateRandomString(),
                Telefone = int.TryParse(GenerateRandomString(11, true), out int tel) ? tel : 999999999,
            };

            //act
            var result = await _updateContactHandler.Handle(requestData, default);

            //assert
            Assert.NotNull(result);
            Assert.True(result.IsSuccess);
        }

        [Fact]
        public async void UpdateContactFailNullValue()
        {
            //set
            _contactService.Setup(x => x.UpdateByIdAsync(It.IsAny<ContactEntity>(), It.IsAny<int>())).ReturnsAsync(false);
            UpdateContactRequest requestData = null;

            //act
            var result = await _updateContactHandler.Handle(requestData, default);

            //assert
            Assert.NotNull(result);
            Assert.False(result.IsSuccess);
            Assert.Equal((int)HttpStatusCode.BadRequest, result.ErrorCode);
        }

        [Fact]
        public async void UpdateContactFailNotFound()
        {
            //set
            _contactService.Setup(x => x.UpdateByIdAsync(It.IsAny<ContactEntity>(), It.IsAny<int>())).ReturnsAsync(false);
            var requestData = new UpdateContactRequest()
            {
                Id = 99999999,
                Nome = GenerateRandomString(),
                Ddd = int.TryParse(GenerateRandomString(2, true), out int ddd) ? ddd : 99,
                Email = GenerateRandomString(),
                Telefone = int.TryParse(GenerateRandomString(9, true), out int tel) ? tel : 999999999,
            };

            //act
            var result = await _updateContactHandler.Handle(requestData, default);

            //assert
            Assert.NotNull(result);
            Assert.False(result.IsSuccess);
            Assert.Equal((int)HttpStatusCode.NotFound, result.ErrorCode);
        }

        [Fact]
        public async void UpdateContactFailNullInnerData()
        {
            //set
            _contactService.Setup(x => x.UpdateByIdAsync(It.IsAny<ContactEntity>(), It.IsAny<int>())).ReturnsAsync(false);
            var requestData = new UpdateContactRequest()
            {
                Id = 1,
                Nome = string.Empty,
                Ddd = 0,
                Email = string.Empty,
                Telefone = 0,
            };

            //act
            var result = await _updateContactHandler.Handle(requestData, default);

            //assert
            Assert.NotNull(result);
            Assert.False(result.IsSuccess);
            Assert.Equal((int)HttpStatusCode.BadRequest, result.ErrorCode);
        }

        [Fact]
        public async void UpdateContactSuccessIntegrated()
        {
            //set
            var configuration = new ConfigurationBuilder()
            .SetBasePath(Directory.GetCurrentDirectory())
            .AddJsonFile("appsettings.json")
            .Build();

            var contactRepository = new ContactRepository(new TechDatabase(configuration, new CryptoService(null)));

            var contactData = new ContactEntity()
            {
                Id = 1,
                Nome = GenerateRandomString(),
                Ddd = int.TryParse(GenerateRandomString(2, true), out int ddd) ? ddd : 99,
                Email = GenerateRandomString(),
                Telefone = int.TryParse(GenerateRandomString(9, true), out int tel) ? tel : 999999999,
            };

            //act
            var updateResult = await contactRepository.UpdateByIdAsync(contactData, contactData.Id);
            var updatedData = await contactRepository.GetByIdAsync(contactData.Id);

            //assert
            Assert.True(updateResult);
            Assert.NotNull(updatedData);
            Assert.Equal(contactData.Id, updatedData.Id);
            Assert.Equal(contactData.Nome, updatedData.Nome);
            Assert.Equal(contactData.Ddd, updatedData.Ddd);
            Assert.Equal(contactData.Email, updatedData.Email);
            Assert.Equal(contactData.Telefone, updatedData.Telefone);
        }

        private static string GenerateRandomString(int length = 10, bool onlyNumbers = false, bool onlyLetters = false)
        {
            var chars = string.Empty;
            var letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            var numbers = "0123456789";

            if (onlyNumbers)
                chars = numbers;
            else if (onlyLetters)
                chars = letters;
            else
                chars = letters + numbers;

            Random random = new Random();
            char[] stringChars = new char[length];

            for (int i = 0; i < length; i++)
            {
                stringChars[i] = chars[random.Next(chars.Length)];
            }

            return new string(stringChars);
        }
    }
}
