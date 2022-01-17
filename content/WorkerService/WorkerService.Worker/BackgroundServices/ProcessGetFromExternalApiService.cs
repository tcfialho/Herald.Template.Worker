using Herald.MessageQueue;
using Herald.Result;

using MediatR;

using Microsoft.Extensions.Logging;

using System.Threading;
using System.Threading.Tasks;

using WorkerService.Application.Features.GetFromExternalApi;

namespace WorkerService.Worker.BackgroundServices
{
    public class ProcessGetFromExternalApiService : IScopedBackgroundService
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

        public async Task ExecuteAsync(CancellationToken stoppingToken)
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
    }
}