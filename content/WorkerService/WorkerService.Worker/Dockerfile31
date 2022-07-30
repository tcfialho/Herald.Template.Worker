#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build
WORKDIR /src
COPY ["WorkerService.Worker/WorkerService.Worker.csproj", "WorkerService.Worker/"]
COPY ["WorkerService.Application/WorkerService.Application.csproj", "WorkerService.Application/"]
COPY ["WorkerService.Infrastructure/WorkerService.Infrastructure.csproj", "WorkerService.Infrastructure/"]
RUN dotnet restore "WorkerService.Worker/WorkerService.Worker.csproj"
COPY . .
WORKDIR "/src/WorkerService.Worker"
RUN dotnet build "WorkerService.Worker.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "WorkerService.Worker.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WorkerService.Worker.dll"]
