using System;

using Herald.MessageQueue;

namespace WorkerService.Application.Features.SendToQueue
{
    public class SentToQueueMessage : MessageBase
    {
        public Guid Id { get; set; }
        public string Description { get; set; }
    }
}
