using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;
using Herald.Result.Mvc;

using MediatR;

using Microsoft.AspNetCore.Mvc;

#if (!nodatabase)
using WorkerService.Application.Entities;
using WorkerService.Application.Features.GetFromDataBase;
#endif
#if (!noqueue)
using WorkerService.Application.Features.SendToQueue;
#endif
#if (!noexternalapi)
using WorkerService.Application.Features.GetAddressByPostalCode;
#endif

namespace WorkerService.Worker.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class WorkerServiceController : ControllerBase
    {
        private readonly IMediator _mediator;

        public WorkerServiceController(IMediator mediator)
        {
            _mediator = mediator;
        }
#if (!nodatabase)
        [HttpGet()]
        [ProducesResponseType(typeof(IEnumerable<Something>), (int)HttpStatusCode.OK)]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        [ProducesResponseType((int)HttpStatusCode.NotFound)]
        public async Task<IActionResult> GetFromDataBase()
            => await _mediator.Send(new GetFromDataBaseCommand()).ToActionResult();
#endif

#if (!noqueue)
        [HttpPost()]
        [ProducesResponseType((int)HttpStatusCode.OK)]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        public async Task<IActionResult> SendToQueue([FromBody] SendToQueueCommand command) 
            => await _mediator.Send(command).ToActionResult();
#endif

#if (!noexternalapi)
        [HttpGet("{PostalCode}")]
        [ProducesResponseType(typeof(GetFromExternalApiResult), (int)HttpStatusCode.OK)]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        [ProducesResponseType((int)HttpStatusCode.NotFound)]
        public async Task<IActionResult> GetFromExternalApi([FromRoute] GetFromExternalApiCommand command) 
            => await _mediator.Send(command).ToActionResult();
#endif
    }
}