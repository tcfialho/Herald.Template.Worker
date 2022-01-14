using Microsoft.AspNetCore.Routing;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;

using WorkerService.Worker.BackgroundServices;

namespace WorkerService.Worker
{
    public static class Configurations
    {
        public static IServiceCollection AddBackgroundServices(this IServiceCollection services)
        {
            var assembly = Assembly.GetExecutingAssembly();
            
            var types = assembly.GetTypes().Where(x => x.IsClass && x.BaseType == typeof(BackgroundService));

            foreach (var type in types)
            {
                services.AddTransient(typeof(IHostedService), type);
            }

            return services;
        }
    }
}
