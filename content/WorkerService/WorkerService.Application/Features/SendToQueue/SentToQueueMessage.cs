using System;

using Herald.MessageQueue;
using Herald.MessageQueue.Attributes;

namespace WorkerService.Application.Features.SendToQueue
{
#if (rabbitmq)
    [RoutingKey("SentToQueueMessageQueue")]
    [ExchangeName("WorkerServiceExchange")]
#endif
    public class SentToQueueMessage : MessageBase
    {
        public string Description { get; set; }
    }
}
