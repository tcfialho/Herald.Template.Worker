
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

using System;
using System.Threading;
using System.Threading.Tasks;

namespace WorkerService.Worker.BackgroundServices
{
    public interface IScopedBackgroundService
    {
        Task ExecuteAsync(CancellationToken stoppingToken);
    }

    public class ScopedBackgroudService<T> : BackgroundService where T : class, IScopedBackgroundService
    {
        private readonly IServiceProvider _serviceProvider;
        private readonly ILogger<T> _logger;

        public ScopedBackgroudService(IServiceProvider serviceProvider, ILogger<T> logger)
        {
            _serviceProvider = serviceProvider;
            _logger = logger;
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            await Task.Yield();

            while (!stoppingToken.IsCancellationRequested)
            {
                try
                {
                    using (var scope = _serviceProvider.CreateScope())
                    {
                        await scope.ServiceProvider.GetRequiredService<T>().ExecuteAsync(stoppingToken);
                    }
                }
                catch (Exception ex)
                {
                    _logger.LogError(ex, $"Error while process: {nameof(T)}");
                }
            }
        }
    }
}