using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

using System.Linq;
using System.Reflection;

namespace WorkerService.Worker
{
    public static class Configurations
    {
        public static IServiceCollection AddBackgroundServices(this IServiceCollection services)
        {
            var assembly = Assembly.GetExecutingAssembly();

            var types = assembly.GetTypes().Where(x => x.IsClass && x.BaseType == typeof(BackgroundService));

            if (types != null)
            {
                foreach (var type in types)
                {
                    services.AddSingleton(typeof(IHostedService), type);
                }
            }

            return services;
        }
    }
}
