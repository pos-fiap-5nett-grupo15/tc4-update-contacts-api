using System.Text.Json.Serialization;
using TechChallenge3.Common.DTOs;

namespace UpdateContact.Application.DTOs.Contact.UpdateContact
{
    public class UpdateContactResponse : BaseReponse
    {
        public bool IsSuccess { get; set; } = false;
    }
}
