using Herald.MessageQueue;

using System;

namespace WorkerService.Application.Features.SendToQueue
{
    public class SentToQueueMessage : MessageBase
    {
        public SentToQueueMessage()
        {
            Id = Guid.NewGuid();
        }

        public Guid Id { get; }
        public string Description { get; set; }
    }
}
