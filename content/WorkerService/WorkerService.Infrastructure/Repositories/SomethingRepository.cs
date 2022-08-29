#if (postgre || mysql || sqlserver)
using System.Linq;

using Herald.EntityFramework.Repositories;

using Microsoft.EntityFrameworkCore;

using WorkerService.Application.Entities;
using WorkerService.Application.Infrastructure.Repositories;

namespace WorkerService.Infrastructure.Repositories
{
    public class SomethingRepository : Repository<Something>, ISomethingRepository
    {
        protected override IQueryable<Something> _query { get; set; }

        public SomethingRepository(DbContext context) : base(context)
        {
        }
    }
}
#endif