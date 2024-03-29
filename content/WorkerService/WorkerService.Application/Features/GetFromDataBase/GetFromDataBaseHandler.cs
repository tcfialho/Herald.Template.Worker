﻿#if (postgre || mysql || sqlserver)
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

using Herald.EntityFramework.Persistance;
using Herald.Result;

using MediatR;

using WorkerService.Application.Entities;
using WorkerService.Application.Infrastructure.Repositories;

namespace WorkerService.Application.Features.GetFromDataBase
{
    public class GetFromDataBaseHandler : IRequestHandler<GetFromDataBaseCommand, Result<IList<Something>>>
    {
        private readonly IUnitOfWork _uow;
        private readonly ISomethingRepository _somethingRepository;

        public GetFromDataBaseHandler(IUnitOfWork uow, ISomethingRepository somethingRepository)
        {
            _uow = uow;
            _somethingRepository = somethingRepository;
        }

        public async Task<Result<IList<Something>>> Handle(GetFromDataBaseCommand request, CancellationToken cancellationToken)
        {
            var somethings = await _somethingRepository.GetAll();

            return ResultStatus.Sucess(somethings);
        }
    }
}
#endif