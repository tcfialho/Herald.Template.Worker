using Herald.MessageQueue;

using System;
using Herald.MessageQueue.Attributes;

namespace WorkerService.Application.Features.GetFromExternalApi
{
#if (rabbitmq)
    [RoutingKey("GetFromExternalApiMessageQueue")]
    [ExchangeName("WorkerServiceExchange")]
#endif
    public class GetFromExternalApiMessage : MessageBase
    {
        public string PostalCode { get; set; }
    }
}
