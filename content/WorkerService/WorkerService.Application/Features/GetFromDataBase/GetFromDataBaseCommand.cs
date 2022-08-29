#if (postgre || mysql || sqlserver)
using System.Collections.Generic;

using Herald.Result;

using MediatR;

using WorkerService.Application.Entities;

namespace WorkerService.Application.Features.GetFromDataBase
{
    public partial class GetFromDataBaseCommand : IRequest<Result<IList<Something>>>
    {
    }
}
#endif