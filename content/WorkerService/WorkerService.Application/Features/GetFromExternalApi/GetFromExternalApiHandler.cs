﻿using System.Threading;
using System.Threading.Tasks;

using Herald.Result;

using Mapster;

using MediatR;

using WorkerService.Application.Infrastructure.WebServices;

namespace WorkerService.Application.Features.GetFromExternalApi
{
    public class GetFromExternalApiHandler : IRequestHandler<GetFromExternalApiCommand, Result<GetFromExternalApiResult>>
    {
        private readonly ICepService _cepService;

        public GetFromExternalApiHandler(ICepService cepService)
        {
            _cepService = cepService;
        }

        public async Task<Result<GetFromExternalApiResult>> Handle(GetFromExternalApiCommand request, CancellationToken cancellationToken)
        {
            var cepResponse = await _cepService.GetAddressByCep(new CepRequest(request.PostalCode));

            var result = cepResponse.Adapt<GetFromExternalApiResult>();

            return ResultStatus.Sucess(result);
        }
    }
}