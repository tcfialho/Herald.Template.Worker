using System;

using Herald.MessageQueue;

namespace WorkerService.Application.Features.SendToQueue
{
    public class SendToQueueMessage : MessageBase
    {
        public SendToQueueMessage()
        {
            Id = Guid.NewGuid();
        }

        public Guid Id { get; }
        public string Description { get; set; }
    }
}
