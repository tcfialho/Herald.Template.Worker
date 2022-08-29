using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;

using WorkerService.Infrastructure;

namespace WorkerService.Worker
{
    public class Program
    {
        public static void Main(string[] args) 
            => CreateHostBuilder(args)
                .Build()
#if (postgre || mysql || sqlserver)
                .DoEFMigration()
#endif
                .Run();

        public static IHostBuilder CreateHostBuilder(string[] args)
        {
            return Host.CreateDefaultBuilder(args)
                        .ConfigureWebHostDefaults(webBuilder =>
                        {
                            webBuilder.UseStartup<Startup>();
                        });
        }
    }
}