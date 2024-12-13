using MediatR;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UpdateContact.Api.Controllers.Contacts;
using UpdateContact.Application.DTOs.Contact.UpdateContact;
using UpdateContact.Application.Handlers.Contact.UpdateContact;

namespace UpdateContact.Test.Controllers
{
    public class UpdateContactTest
    {
        private ContactsController _contactController;
        private Mock<IMediator> _mediator;

        public UpdateContactTest()
        {
            _mediator = new Mock<IMediator>();
            _contactController = new ContactsController(_mediator.Object);
        }

        //[Fact]
        //public async void UpdateContactSuccess()
        //{
        //    var requestData = new UpdateContactRequest()
        //    {
        //        Id = 1,
        //        Nome = "Teste",
        //        Ddd = 99,
        //        Email = "Teste",
        //        Telefone = 999999999,
        //    };

        //    _mediator.Setup(m => m.Send(It.IsAny<UpdateContactResponse>(), It.IsAny<CancellationToken>())).ReturnsAsync(Task.CompletedTask);

        //    var result = await _contactController.UpdateAsync(requestData.Id, requestData);

        //    Assert.NotNull(result);
        //}
    }
}
