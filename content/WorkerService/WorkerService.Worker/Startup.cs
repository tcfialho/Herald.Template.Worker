using Herald.Observability.Jaeger.Configurations;

using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

using WorkerService.Application;
using WorkerService.Infrastructure;

namespace WorkerService.Worker
{
    public class Startup
    {
        public IConfiguration Configuration { get; }
        public IWebHostEnvironment Env { get; }

        public Startup(IConfiguration configuration, IWebHostEnvironment env)
        {
            Configuration = configuration;
            Env = env;
        }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddFeatures(Configuration);
#if (sqs || kafka || rabbitmq || azure)
            services.AddQueues(Configuration);
#endif
#if (!noexternalapi)
            services.AddWebServices(Configuration);
#endif
#if (postgre || mysql || sqlserver)
            services.AddRepositories(Configuration);
#endif
            services.AddScopedBackgroudServices();
            services.AddJaegerTracing(setup => Configuration.GetSection("JaegerOptions").Bind(setup));
            services.AddHealthChecks();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapHealthChecks("/hc");
            });
        }
    }
}
