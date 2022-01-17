using Herald.MessageQueue;
using Herald.Result;

using MediatR;

using Microsoft.Extensions.Logging;

using System.Threading;
using System.Threading.Tasks;

using WorkerService.Application.Features.SendToQueue;

namespace WorkerService.Worker.BackgroundServices
{
    public class ProcessSendToQueueService : IScopedBackgroundService
    {
        private readonly IMediator _mediator;
        private readonly ILogger<ProcessSendToQueueService> _logger;
        private readonly IMessageQueue _messageQueue;

        public ProcessSendToQueueService(IMediator mediator, ILogger<ProcessSendToQueueService> logger, IMessageQueue messageQueue)
        {
            _mediator = mediator;
            _logger = logger;
            _messageQueue = messageQueue;
        }

        public async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            await foreach (var message in _messageQueue.Receive<SendToQueueMessage>(stoppingToken))
            {
                var result = await _mediator.Send(new SendToQueueCommand() { Description = message.Description });
                if (result.Status == Status.Sucess)
                {
                    await _messageQueue.Received(message);
                }
            }
        }
    }
}