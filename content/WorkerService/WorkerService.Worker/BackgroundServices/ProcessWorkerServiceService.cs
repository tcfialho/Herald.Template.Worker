using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

using System;
using System.Threading;
using System.Threading.Tasks;

namespace WorkerService.Worker.BackgroundServices
{
    public class ProcessWorkerServiceService : BackgroundService
    {
        private readonly ILogger<ProcessWorkerServiceService> _logger;

        public ProcessWorkerServiceService(ILogger<ProcessWorkerServiceService> logger)
        {
            _logger = logger;
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested)
            {
                _logger.LogInformation("Worker running at: {time}", DateTimeOffset.Now);
                await Task.Delay(1000, stoppingToken);
            }
        }
    }
}
