using Herald.MessageQueue;
using Herald.Result;

using MediatR;

using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

using System;
using System.Threading;
using System.Threading.Tasks;

using WorkerService.Application.Features.GetFromDataBase;

namespace WorkerService.Worker.BackgroundServices
{
    public class ProcessGetFromDataBaseService : BackgroundService
    {
        private readonly IMediator _mediator;
        private readonly ILogger<ProcessGetFromDataBaseService> _logger;
        private readonly IMessageQueue _messageQueue;

        public ProcessGetFromDataBaseService(IMediator mediator, ILogger<ProcessGetFromDataBaseService> logger, IMessageQueue messageQueue)
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
                    await foreach (var message in _messageQueue.Receive<GetFromDataBaseMessage>(stoppingToken))
                    {
                        var result = await _mediator.Send(new GetFromDataBaseCommand());
                        if (result.Status == Status.Sucess)
                        {
                            await _messageQueue.Received(message);
                        }
                    }
                }
                catch (Exception ex)
                {
                    _logger.LogError(ex, $"Error while process: {nameof(ProcessGetFromDataBaseService)}");
                }
            }
        }
    }
}