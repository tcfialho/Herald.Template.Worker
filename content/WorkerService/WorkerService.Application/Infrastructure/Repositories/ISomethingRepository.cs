using Herald.EntityFramework.Repositories;

using WorkerService.Application.Entities;

namespace WorkerService.Application.Infrastructure.Repositories
{
    public interface ISomethingRepository : IRepository<Something>
    {
    }
}
