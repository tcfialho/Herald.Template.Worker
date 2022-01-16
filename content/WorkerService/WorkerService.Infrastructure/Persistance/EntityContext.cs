
using Microsoft.EntityFrameworkCore;

using WorkerService.Application.Entities;

namespace WorkerService.Infrastructure.Persistance
{
    public class EntityContext : DbContext
    {
        public DbSet<Something> Somethings { get; set; }
        public DbSet<OtherThing> OtherThings { get; set; }

        public EntityContext()
        {
            //dotnet ef migrations add MyMigration --project ..\WorkerService.Infrastructure

            this.Database.EnsureCreated();
        }

        public EntityContext(DbContextOptions<EntityContext> options) : base(options)
        {            
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
        }
    }
}
