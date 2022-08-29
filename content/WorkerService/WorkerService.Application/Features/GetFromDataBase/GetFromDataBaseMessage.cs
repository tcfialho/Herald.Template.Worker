using System;

using Herald.MessageQueue;
using Herald.MessageQueue.Attributes;

namespace WorkerService.Application.Features.GetFromDataBase
{
#if (rabbitmq)
    [RoutingKey("GetFromDataBaseMessageQueue")]
    [ExchangeName("WorkerServiceExchange")]
#endif
    public class GetFromDataBaseMessage : MessageBase
    {
    }
}
