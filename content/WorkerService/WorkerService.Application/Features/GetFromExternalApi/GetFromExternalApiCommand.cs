﻿using System.ComponentModel.DataAnnotations;

using Herald.Result;

using MediatR;

namespace WorkerService.Application.Features.GetAddressByPostalCode
{
    public partial class GetFromExternalApiCommand : IRequest<Result<GetFromExternalApiResult>>
    {
        [Required]
        public string PostalCode { get; set; }
    }
}
