# Herald.Template.Worker

![Status](https://github.com/tcfialho/Herald.Template.Worker/workflows/Herald.Template.Worker/badge.svg) ![Coverage](https://codecov.io/gh/tcfialho/Herald.Template.Worker/branch/master/graph/badge.svg) ![NuGet](https://buildstats.info/nuget/Herald.Template.Worker)

## Overview
 - Herald Scaffold for create Worker projects.

## Installation
 - .NET CLI
    ```
    dotnet new -i Herald.Template.Worker::*
    ```

See more information in [Nuget](https://www.nuget.org/packages/Herald.Template.Worker/).

## Usage

```
dotnet new herald-worker -n ProjectName -o OutputFolder 

Options:
  -nd|--no-database     Put database sample into generated project (Default: false).
  -nq|--no-queue        Put queue sample into generated project (Default: false).
  -ne|--no-externalapi  Put external api sample into generated project (Default: false).
```
## Credits

Author [**Thiago Fialho**](https://br.linkedin.com/in/thiago-fialho-139ab116)

## License

Herald.Template.Worker is licensed under the [MIT License](LICENSE).