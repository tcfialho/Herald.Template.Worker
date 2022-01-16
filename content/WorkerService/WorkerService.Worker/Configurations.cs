using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

using System;
using System.Linq;
using System.Reflection;

using WorkerService.Worker.BackgroundServices;

namespace WorkerService.Worker
{
    public static class Configurations
    {
        public static IServiceCollection AddScopedBackgroudService<T>(this IServiceCollection services) where T : class, IScopedBackgroundService
        {
            if (services == null)
            {
                throw new ArgumentNullException(nameof(services));
            }

            services.AddHostedService<ScopedBackgroudService<T>>();
            services.AddScoped<T>();

            return services;
        }

        public static IServiceCollection AddScopedBackgroudService(this IServiceCollection services, Type type)
        {
            if (services == null)
            {
                throw new ArgumentNullException(nameof(services));
            }

            if (type is null)
            {
                throw new ArgumentNullException(nameof(type));
            }

            if (!typeof(IScopedBackgroundService).IsAssignableFrom(type))
            {
                throw new ArgumentException($"The type {type.Name} not implements {nameof(IScopedBackgroundService)}");
            }

            var hostedService = typeof(ScopedBackgroudService<>).MakeGenericType(new[] { type });
            services.AddSingleton(typeof(IHostedService), hostedService);
            services.AddScoped(type);

            return services;
        }

        public static IServiceCollection AddBackgroundServices(this IServiceCollection services)
        {
            var assembly = Assembly.GetExecutingAssembly();

            var types = assembly.GetTypes().Where(type => type.IsClass && type.BaseType == typeof(BackgroundService));

            if (types != null)
            {
                foreach (var type in types)
                {
                    services.AddSingleton(typeof(IHostedService), type);
                }
            }

            return services;
        }

        public static IServiceCollection AddScopedBackgroudServices(this IServiceCollection services)
        {
            var assembly = Assembly.GetExecutingAssembly();

            var types = assembly.GetTypes().Where(type => type.IsClass && typeof(IScopedBackgroundService).IsAssignableFrom(type));

            if (types != null)
            {
                foreach (var type in types)
                {
                    services.AddScopedBackgroudService(type);
                }
            }

            return services;
        }
    }
}
