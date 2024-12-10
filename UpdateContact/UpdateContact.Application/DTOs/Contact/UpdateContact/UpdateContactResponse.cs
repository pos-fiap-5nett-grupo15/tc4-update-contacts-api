using System.Text.Json.Serialization;
using TechChallenge.Common.DTOs;

namespace UpdateContact.Application.DTOs.Contact.UpdateContact
{
    public class UpdateContactResponse : BaseReponse
    {
        public bool IsSuccess { get; set; } = false;
    }
}
