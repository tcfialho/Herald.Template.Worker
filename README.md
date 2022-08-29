# Herald.Template.Worker

![Status](https://github.com/tcfialho/Herald.Template.WorkerService/workflows/Herald.Template.WorkerService/badge.svg) ![Coverage](https://codecov.io/gh/tcfialho/Herald.Template.WorkerService/branch/master/graph/badge.svg) ![NuGet](https://buildstats.info/nuget/Herald.Template.WorkerService)

## Overview
 - Herald Scaffold for create WorkerService projects.

## Installation
 - .NET CLI
    ```
    dotnet new -i Herald.Template.WorkerService::*
    ```

See more information in [Nuget](https://www.nuget.org/packages/Herald.Template.WorkerService/).

## Usage
```
dotnet new herald-worker -n ProjectName -o OutputFolder
```
## Full Options
```
dotnet new herald-worker -n ProjectName -o OutputFolder -f=net6.0 -q=sqs -d=postgre -ne
```
```
  -n|--name             The project and solution name for the output being created.
                        string - Optional
                        Default: current folder
  
  -o|--output           Location to place the generated output.
                        string - Optional
                        Default: current folder

  -f|--framework        The target framework for the project.
                            net6.0           - .NET 6.0
                            net5.0           - .NET 5.0
                            netcoreapp3.1    - .NET Core 3.1
                        Default: net6.0

  -q|--queue            Choose queue technology to include sample into the generated project.
                            sqs         - Amazon SQS
                            kafka       - Apache Kafka
                            rabbitmq    - RabbitMQ
                            azure       - Azure Queue Storage
                        Default: sqs

  -d|--database         Includes/removes the database sample into generated project.
                            none         - No database
                            postgre      - PostgreSQL
                            mysql        - MySQL
                            sqlserver    - Microsoft SQL Server
                        Default: postgre

  -ne|--no-externalapi  Removes external api sample into generated project.
                        bool - Optional
                        Default: false
```

## Credits

Author [**Thiago Fialho**](https://br.linkedin.com/in/thiago-fialho-139ab116)

## License

Herald.Template.WorkerService is licensed under the [MIT License](LICENSE).