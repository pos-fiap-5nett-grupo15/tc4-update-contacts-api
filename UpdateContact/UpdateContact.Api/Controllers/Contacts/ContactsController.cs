using MediatR;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;
using TechChallenge.Common.DTOs;
using UpdateContact.Application.DTOs.Contact.UpdateContact;

namespace UpdateContact.Api.Controllers.Contacts
{
    [ApiController]
    [Route("[controller]")]
    // TODO: Implementar autenticação/autorização
    public class ContactsController : ControllerBase
    {
        private readonly IMediator _mediator;

        public ContactsController(IMediator mediator) =>
            _mediator = mediator;

        [HttpPost("{id}")]
        [SwaggerResponse(StatusCodes.Status201Created)]
        [SwaggerResponse(StatusCodes.Status400BadRequest, type: typeof(BaseReponse))]
        public async Task<IActionResult> CreateAsync([FromRoute] int id, [FromBody] UpdateContactRequest request)
        {
            try
            {
                if (id <= 0)
                    return BadRequest("No contact id");
                else
                    request.Id = id;

                return Created(string.Empty, await _mediator.Send(request));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
