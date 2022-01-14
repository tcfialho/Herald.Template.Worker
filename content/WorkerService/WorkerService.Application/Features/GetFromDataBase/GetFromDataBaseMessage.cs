using Herald.MessageQueue;

using System;

namespace WorkerService.Application.Features.GetFromDataBase
{
    public class GetFromDataBaseMessage : MessageBase
    {
        public Guid Id { get; set; }
    }
}
