using MediatR;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;
using System.Net;
using TechChallenge3.Common.DTOs;
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

        [HttpPatch("{id}")]
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

                var processResponse = await _mediator.Send(request);

                if (processResponse.IsSuccess)
                    return Ok();
                else
                {
                    return StatusCode(processResponse.ErrorCode > 0 ? processResponse.ErrorCode : (int)HttpStatusCode.InternalServerError,
                                      processResponse.ErrorDescription ?? "Unkown error on update process");
                }
            }
            catch (Exception ex)
            {
                return StatusCode((int)HttpStatusCode.InternalServerError, $"Error: {ex.Message}\n\n{ex.StackTrace}");
            }
        }
    }
}
