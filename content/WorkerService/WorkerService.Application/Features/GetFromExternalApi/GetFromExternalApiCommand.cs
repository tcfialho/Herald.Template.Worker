using System.ComponentModel.DataAnnotations;

using Herald.Result;

using MediatR;

namespace WorkerService.Application.Features.GetFromExternalApi
{
    public partial class GetFromExternalApiCommand : IRequest<Result<GetFromExternalApiResult>>
    {
        [Required]
        public string PostalCode { get; set; }
    }
}
