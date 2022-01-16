using Herald.MessageQueue;
using Herald.Result;

using MediatR;

using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

using System;
using System.Threading;
using System.Threading.Tasks;

using WorkerService.Application.Features.GetFromExternalApi;

namespace WorkerService.Worker.BackgroundServices
{
    public class ProcessGetFromExternalApiService : BackgroundService
    {
        private readonly IMediator _mediator;
        private readonly ILogger<ProcessGetFromExternalApiService> _logger;
        private readonly IMessageQueue _messageQueue;

        public ProcessGetFromExternalApiService(IMediator mediator, ILogger<ProcessGetFromExternalApiService> logger, IMessageQueue messageQueue)
        {
            _mediator = mediator;
            _logger = logger;
            _messageQueue = messageQueue;
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested)
            {
                try
                {
                    await foreach (var message in _messageQueue.Receive<GetFromExternalApiMessage>(stoppingToken))
                    {
                        var result = await _mediator.Send(new GetFromExternalApiCommand() { PostalCode = message.PostalCode });
                        if (result.Status == Status.Sucess)
                        {
                            await _messageQueue.Received(message);
                        }
                    }
                }
                catch (Exception ex)
                {
                    _logger.LogError(ex, $"Error while process: {nameof(ProcessGetFromExternalApiService)}");
                }
            }
        }
    }
}