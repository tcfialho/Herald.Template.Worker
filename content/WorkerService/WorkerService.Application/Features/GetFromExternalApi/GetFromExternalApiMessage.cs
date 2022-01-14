using Herald.MessageQueue;

using System;

namespace WorkerService.Application.Features.GetAddressByPostalCode
{
    public class GetFromExternalApiMessage : MessageBase
    {
        public Guid Id { get; set; }
        public string PostalCode { get; set; }
    }
}
