#if (sqs || kafka || rabbitmq || azure)
using System;

using Herald.MessageQueue;
using Herald.MessageQueue.Attributes;

namespace WorkerService.Application.Features.SendToQueue
{
#if (rabbitmq)
    [RoutingKey("SendToQueueMessageQueue")]
    [ExchangeName("WorkerServiceExchange")]
#endif
    public class SendToQueueMessage : MessageBase
    {
        public string Description { get; set; }
    }
}
#endif