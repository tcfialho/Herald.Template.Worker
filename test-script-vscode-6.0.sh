dotnet new herald-worker -n E_SQS_POSTGRE -o E_SQS_POSTGRE -f=net6.0 -q=sqs -d=postgre
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_SQS_POSTGRE\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\E_SQS_POSTGRE\E_SQS_POSTGRE.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\E_SQS_POSTGRE\E_SQS_POSTGRE.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\E_SQS_POSTGRE\E_SQS_POSTGRE.Api\E_SQS_POSTGRE.Worker.csproj" &>/dev/null &
cd E_SQS_POSTGRE/.docker
sleep 10;
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4566 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4566/000000000000/GetFromExternalApiMessageQueue.fifo' --message-body '{"PostalCode": "04562000"}'
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4576 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4576/queue/SendToQueueMessageQueue.fifo' --message-body '{"description": "string"}'
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4566 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4566/000000000000/GetFromDataBaseMessageQueue.fifo' --message-body '{}'
TASKKILL //IM "E_SQS_POSTGRE.Worker.exe" //F //T

dotnet new herald-worker -n E_SQS_MYSQL -o E_SQS_MYSQL -f=net6.0 -q=sqs -d=mysql
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_SQS_MYSQL\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\E_SQS_MYSQL\E_SQS_MYSQL.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\E_SQS_MYSQL\E_SQS_MYSQL.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\E_SQS_MYSQL\E_SQS_MYSQL.Api\E_SQS_MYSQL.Worker.csproj" &>/dev/null &
cd E_SQS_MYSQL/.docker
sleep 10;
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4566 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4566/000000000000/GetFromExternalApiMessageQueue.fifo' --message-body '{"PostalCode": "04562000"}'
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4576 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4576/queue/SendToQueueMessageQueue.fifo' --message-body '{"description": "string"}'
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4566 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4566/000000000000/GetFromDataBaseMessageQueue.fifo' --message-body '{}'
TASKKILL //IM "E_SQS_MYSQL.Worker.exe" //F //T

dotnet new herald-worker -n E_SQS_SQLSERVER -o E_SQS_SQLSERVER -f=net6.0 -q=sqs -d=sqlserver
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_SQS_SQLSERVER\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\E_SQS_SQLSERVER\E_SQS_SQLSERVER.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\E_SQS_SQLSERVER\E_SQS_SQLSERVER.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\E_SQS_SQLSERVER\E_SQS_SQLSERVER.Api\E_SQS_SQLSERVER.Worker.csproj" &>/dev/null &
cd E_SQS_SQLSERVER/.docker
sleep 10;
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4566 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4566/000000000000/GetFromExternalApiMessageQueue.fifo' --message-body '{"PostalCode": "04562000"}'
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4576 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4576/queue/SendToQueueMessageQueue.fifo' --message-body '{"description": "string"}'
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4566 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4566/000000000000/GetFromDataBaseMessageQueue.fifo' --message-body '{}'
TASKKILL //IM "E_SQS_SQLSERVER.Worker.exe" //F //T

dotnet new herald-worker -n E_SQS_NONE -o E_SQS_NONE -f=net6.0 -q=sqs -d=none
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_SQS_NONE\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\E_SQS_NONE\E_SQS_NONE.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\E_SQS_NONE\E_SQS_NONE.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\E_SQS_NONE\E_SQS_NONE.Api\E_SQS_NONE.Worker.csproj" &>/dev/null &
cd E_SQS_NONE/.docker
sleep 10;
curl -k -s -o /dev/null -w "Code: %{http_code}" -X 'GET' 'https://localhost:5001/E_SQS_NONE/21331410'
curl -k -s -o /dev/null -w "Code: %{http_code}" -X 'POST' 'https://localhost:5001/E_SQS_NONE' -H 'Content-Type: application/json' -d '{"description": "string"}'
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4566 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4566/000000000000/GetFromExternalApiMessageQueue.fifo' --message-body '{"PostalCode": "04562000"}'
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4566 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4566/000000000000/GetFromDataBaseMessageQueue.fifo' --message-body '{}'
TASKKILL //IM "E_SQS_NONE.Worker.exe" //F //T

dotnet new herald-worker -n E_KAKFA_POSTGRE -o E_KAKFA_POSTGRE -f=net6.0 -q=kafka -d=postgre
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_KAKFA_POSTGRE\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\E_KAKFA_POSTGRE\E_KAKFA_POSTGRE.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\E_KAKFA_POSTGRE\E_KAKFA_POSTGRE.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\E_KAKFA_POSTGRE\E_KAKFA_POSTGRE.Api\E_KAKFA_POSTGRE.Worker.csproj" &>/dev/null &
cd E_KAKFA_POSTGRE/.docker
sleep 10;
docker-compose exec -T -d kafka bash -c 'echo {\"PostalCode\": \"04562000\"} | kafka-console-producer --broker-list kafka:9092 --topic GetFromExternalApiMessageTopic'
docker-compose exec -T -d kafka bash -c 'echo {\"Description\": \"string\"} | kafka-console-producer --broker-list kafka:9092 --topic SendToQueueMessageTopic'
docker-compose exec -T -d kafka bash -c 'echo {} | kafka-console-producer --broker-list kafka:9092 --topic GetFromDataBaseMessageTopic'
TASKKILL //IM "E_KAKFA_POSTGRE.Worker.exe" //F //T

dotnet new herald-worker -n E_KAKFA_MYSQL -o E_KAKFA_MYSQL -f=net6.0 -q=kafka -d=mysql
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_KAKFA_MYSQL\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\E_KAKFA_MYSQL\E_KAKFA_MYSQL.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\E_KAKFA_MYSQL\E_KAKFA_MYSQL.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\E_KAKFA_MYSQL\E_KAKFA_MYSQL.Api\E_KAKFA_MYSQL.Worker.csproj" &>/dev/null &
cd E_KAKFA_MYSQL/.docker
sleep 10;
docker-compose exec -T -d kafka bash -c 'echo {\"PostalCode\": \"04562000\"} | kafka-console-producer --broker-list kafka:9092 --topic GetFromExternalApiMessageTopic'
docker-compose exec -T -d kafka bash -c 'echo {\"Description\": \"string\"} | kafka-console-producer --broker-list kafka:9092 --topic SendToQueueMessageTopic'
docker-compose exec -T -d kafka bash -c 'echo {} | kafka-console-producer --broker-list kafka:9092 --topic GetFromDataBaseMessageTopic'
TASKKILL //IM "E_KAKFA_MYSQL.Worker.exe" //F //T

dotnet new herald-worker -n E_KAKFA_SQLSERVER -o E_KAKFA_SQLSERVER -f=net6.0 -q=kafka -d=sqlserver
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_KAKFA_SQLSERVER\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\E_KAKFA_SQLSERVER\E_KAKFA_SQLSERVER.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\E_KAKFA_SQLSERVER\E_KAKFA_SQLSERVER.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\E_KAKFA_SQLSERVER\E_KAKFA_SQLSERVER.Api\E_KAKFA_SQLSERVER.Worker.csproj" &>/dev/null &
cd E_KAKFA_SQLSERVER/.docker
sleep 10;
docker-compose exec -T -d kafka bash -c 'echo {\"PostalCode\": \"04562000\"} | kafka-console-producer --broker-list kafka:9092 --topic GetFromExternalApiMessageTopic'
docker-compose exec -T -d kafka bash -c 'echo {\"Description\": \"string\"} | kafka-console-producer --broker-list kafka:9092 --topic SendToQueueMessageTopic'
docker-compose exec -T -d kafka bash -c 'echo {} | kafka-console-producer --broker-list kafka:9092 --topic GetFromDataBaseMessageTopic'
TASKKILL //IM "E_KAKFA_SQLSERVER.Worker.exe" //F //T

dotnet new herald-worker -n E_KAKFA_NONE -o E_KAKFA_NONE -f=net6.0 -q=kafka -d=none
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_KAKFA_NONE\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\E_KAKFA_NONE\E_KAKFA_NONE.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\E_KAKFA_NONE\E_KAKFA_NONE.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\E_KAKFA_NONE\E_KAKFA_NONE.Api\E_KAKFA_NONE.Worker.csproj" &>/dev/null &
cd E_KAKFA_NONE/.docker
sleep 10;
docker-compose exec -T -d kafka bash -c 'echo {\"PostalCode\": \"04562000\"} | kafka-console-producer --broker-list kafka:9092 --topic GetFromExternalApiMessageTopic'
docker-compose exec -T -d kafka bash -c 'echo {} | kafka-console-producer --broker-list kafka:9092 --topic GetFromDataBaseMessageTopic'
TASKKILL //IM "E_KAKFA_NONE.Worker.exe" //F //T

dotnet new herald-worker -n E_RABBITMQ_POSTGRE -o E_RABBITMQ_POSTGRE -f=net6.0 -q=rabbitmq -d=postgre
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_POSTGRE\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_POSTGRE\E_RABBITMQ_POSTGRE.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_POSTGRE\E_RABBITMQ_POSTGRE.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_POSTGRE\E_RABBITMQ_POSTGRE.Api\E_RABBITMQ_POSTGRE.Worker.csproj" &>/dev/null &
cd E_RABBITMQ_POSTGRE/.docker
sleep 10;
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_POSTGREExchange routing_key=GetFromExternalApiMessageQueue payload='{"PostalCode": "04562000"}'
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_POSTGREExchange routing_key=SendToQueueMessageQueue payload='{"Description": "string"}'
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_POSTGREExchange routing_key=GetFromDataBaseMessageQueue payload='{}'
TASKKILL //IM "E_RABBITMQ_POSTGRE.Worker.exe" //F //T

dotnet new herald-worker -n E_RABBITMQ_MYSQL -o E_RABBITMQ_MYSQL -f=net6.0 -q=rabbitmq -d=mysql
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_MYSQL\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_MYSQL\E_RABBITMQ_MYSQL.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_MYSQL\E_RABBITMQ_MYSQL.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_MYSQL\E_RABBITMQ_MYSQL.Api\E_RABBITMQ_MYSQL.Worker.csproj" &>/dev/null &
cd E_RABBITMQ_MYSQL/.docker
sleep 10;
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_POSTGREExchange routing_key=GetFromExternalApiMessageQueue payload='{"PostalCode": "04562000"}'
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_POSTGREExchange routing_key=SendToQueueMessageQueue payload='{"Description": "string"}'
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_POSTGREExchange routing_key=GetFromDataBaseMessageQueue payload='{}'
TASKKILL //IM "E_RABBITMQ_MYSQL.Worker.exe" //F //T

dotnet new herald-worker -n E_RABBITMQ_SQLSERVER -o E_RABBITMQ_SQLSERVER -f=net6.0 -q=rabbitmq -d=sqlserver
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_SQLSERVER\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_SQLSERVER\E_RABBITMQ_SQLSERVER.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_SQLSERVER\E_RABBITMQ_SQLSERVER.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_SQLSERVER\E_RABBITMQ_SQLSERVER.Api\E_RABBITMQ_SQLSERVER.Worker.csproj" &>/dev/null &
cd E_RABBITMQ_SQLSERVER/.docker
sleep 10;
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_POSTGREExchange routing_key=GetFromExternalApiMessageQueue payload='{"PostalCode": "04562000"}'
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_POSTGREExchange routing_key=SendToQueueMessageQueue payload='{"Description": "string"}'
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_POSTGREExchange routing_key=GetFromDataBaseMessageQueue payload='{}'
TASKKILL //IM "E_RABBITMQ_SQLSERVER.Worker.exe" //F //T

dotnet new herald-worker -n E_RABBITMQ_NONE -o E_RABBITMQ_NONE -f=net6.0 -q=rabbitmq -d=none
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_NONE\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_NONE\E_RABBITMQ_NONE.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_NONE\E_RABBITMQ_NONE.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_NONE\E_RABBITMQ_NONE.Api\E_RABBITMQ_NONE.Worker.csproj" &>/dev/null &
cd E_RABBITMQ_NONE/.docker
sleep 10;
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_POSTGREExchange routing_key=GetFromExternalApiMessageQueue payload='{"PostalCode": "04562000"}'
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_POSTGREExchange routing_key=SendToQueueMessageQueue payload='{"Description": "string"}'
TASKKILL //IM "E_RABBITMQ_NONE.Worker.exe" //F //T

dotnet new herald-worker -n E_AZURE_POSTGRE -o E_AZURE_POSTGRE -f=net6.0 -q=azure -d=postgre
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_AZURE_POSTGRE\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\E_AZURE_POSTGRE\E_AZURE_POSTGRE.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\E_AZURE_POSTGRE\E_AZURE_POSTGRE.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\E_AZURE_POSTGRE\E_AZURE_POSTGRE.Api\E_AZURE_POSTGRE.Worker.csproj" &>/dev/null &
cd E_AZURE_POSTGRE/.docker
sleep 10;
curl -X POST http://localhost:10001/devstoreaccount1/getfromexternalapimessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{"PostalCode": "04562000"}</MessageText></QueueMessage>'
curl -X POST http://localhost:10001/devstoreaccount1/sendtoqueuemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{"Description": "string"}</MessageText></QueueMessage>'
curl -X POST http://localhost:10001/devstoreaccount1/getfromdatabasemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{}</MessageText></QueueMessage>'
TASKKILL //IM "E_AZURE_POSTGRE.Worker.exe" //F //T

dotnet new herald-worker -n E_AZURE_MYSQL -o E_AZURE_MYSQL -f=net6.0 -q=azure -d=mysql
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_AZURE_MYSQL\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\E_AZURE_MYSQL\E_AZURE_MYSQL.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\E_AZURE_MYSQL\E_AZURE_MYSQL.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\E_AZURE_MYSQL\E_AZURE_MYSQL.Api\E_AZURE_MYSQL.Worker.csproj" &>/dev/null &
cd E_AZURE_MYSQL/.docker
sleep 10;
curl -X POST http://localhost:10001/devstoreaccount1/getfromexternalapimessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{"PostalCode": "04562000"}</MessageText></QueueMessage>'
curl -X POST http://localhost:10001/devstoreaccount1/sendtoqueuemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{"Description": "string"}</MessageText></QueueMessage>'
curl -X POST http://localhost:10001/devstoreaccount1/getfromdatabasemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{}</MessageText></QueueMessage>'
TASKKILL //IM "E_AZURE_MYSQL.Worker.exe" //F //T

dotnet new herald-worker -n E_AZURE_SQLSERVER -o E_AZURE_SQLSERVER -f=net6.0 -q=azure -d=sqlserver
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_AZURE_SQLSERVER\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\E_AZURE_SQLSERVER\E_AZURE_SQLSERVER.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\E_AZURE_SQLSERVER\E_AZURE_SQLSERVER.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\E_AZURE_SQLSERVER\E_AZURE_SQLSERVER.Api\E_AZURE_SQLSERVER.Worker.csproj" &>/dev/null &
cd E_AZURE_SQLSERVER/.docker
sleep 10;
curl -X POST http://localhost:10001/devstoreaccount1/getfromexternalapimessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{"PostalCode": "04562000"}</MessageText></QueueMessage>'
curl -X POST http://localhost:10001/devstoreaccount1/sendtoqueuemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{"Description": "string"}</MessageText></QueueMessage>'
curl -X POST http://localhost:10001/devstoreaccount1/getfromdatabasemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{}</MessageText></QueueMessage>'
TASKKILL //IM "E_AZURE_SQLSERVER.Worker.exe" //F //T

dotnet new herald-worker -n E_AZURE_NONE -o E_AZURE_NONE -f=net6.0 -q=azure -d=none
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_AZURE_NONE\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\E_AZURE_NONE\E_AZURE_NONE.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\E_AZURE_NONE\E_AZURE_NONE.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\E_AZURE_NONE\E_AZURE_NONE.Api\E_AZURE_NONE.Worker.csproj" &>/dev/null &
cd E_AZURE_NONE/.docker
sleep 10;
curl -X POST http://localhost:10001/devstoreaccount1/getfromexternalapimessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{"PostalCode": "04562000"}</MessageText></QueueMessage>'
curl -X POST http://localhost:10001/devstoreaccount1/sendtoqueuemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{"Description": "string"}</MessageText></QueueMessage>'
TASKKILL //IM "E_AZURE_NONE.Worker.exe" //F //T

dotnet new herald-worker -n NE_SQS_POSTGRE -o NE_SQS_POSTGRE -f=net6.0 -ne -q=sqs -d=postgre
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_SQS_POSTGRE\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\NE_SQS_POSTGRE\NE_SQS_POSTGRE.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\NE_SQS_POSTGRE\NE_SQS_POSTGRE.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\NE_SQS_POSTGRE\NE_SQS_POSTGRE.Api\NE_SQS_POSTGRE.Worker.csproj" &>/dev/null &
cd NE_SQS_POSTGRE/.docker
sleep 10;
curl -k -s -o /dev/null -w "Code: %{http_code}" -X 'POST' 'https://localhost:5001/NE_SQS_POSTGRE' -H 'Content-Type: application/json' -d '{"description": "string"}' 
curl -k -s -o /dev/null -w "Code: %{http_code}" -X 'GET' 'https://localhost:5001/NE_SQS_POSTGRE'
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4576 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4576/queue/SendToQueueMessageQueue.fifo' --message-body '{"description": "string"}'
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4566 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4566/000000000000/GetFromDataBaseMessageQueue.fifo' --message-body '{}'
TASKKILL //IM "NE_SQS_POSTGRE.Worker.exe" //F //T

dotnet new herald-worker -n NE_SQS_MYSQL -o NE_SQS_MYSQL -f=net6.0 -ne -q=sqs -d=mysql
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_SQS_MYSQL\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\NE_SQS_MYSQL\NE_SQS_MYSQL.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\NE_SQS_MYSQL\NE_SQS_MYSQL.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\NE_SQS_MYSQL\NE_SQS_MYSQL.Api\NE_SQS_MYSQL.Worker.csproj" &>/dev/null &
cd NE_SQS_MYSQL/.docker
sleep 10;
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4576 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4576/queue/SendToQueueMessageQueue.fifo' --message-body '{"description": "string"}'
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4566 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4566/000000000000/GetFromDataBaseMessageQueue.fifo' --message-body '{}'
TASKKILL //IM "NE_SQS_MYSQL.Worker.exe" //F //T

dotnet new herald-worker -n NE_SQS_SQLSERVER -o NE_SQS_SQLSERVER -f=net6.0 -ne -q=sqs -d=sqlserver
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_SQS_SQLSERVER\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\NE_SQS_SQLSERVER\NE_SQS_SQLSERVER.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\NE_SQS_SQLSERVER\NE_SQS_SQLSERVER.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\NE_SQS_SQLSERVER\NE_SQS_SQLSERVER.Api\NE_SQS_SQLSERVER.Worker.csproj" &>/dev/null &
cd NE_SQS_SQLSERVER/.docker
sleep 10;
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4576 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4576/queue/SendToQueueMessageQueue.fifo' --message-body '{"description": "string"}'
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4566 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4566/000000000000/GetFromDataBaseMessageQueue.fifo' --message-body '{}'
TASKKILL //IM "NE_SQS_SQLSERVER.Worker.exe" //F //T

dotnet new herald-worker -n NE_SQS_NONE -o NE_SQS_NONE -f=net6.0 -ne -q=sqs -d=none
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_SQS_NONE\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\NE_SQS_NONE\NE_SQS_NONE.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\NE_SQS_NONE\NE_SQS_NONE.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\NE_SQS_NONE\NE_SQS_NONE.Api\NE_SQS_NONE.Worker.csproj" &>/dev/null &
cd NE_SQS_NONE/.docker
sleep 10;
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4576 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4576/queue/SendToQueueMessageQueue.fifo' --message-body '{"description": "string"}'
TASKKILL //IM "NE_SQS_NONE.Worker.exe" //F //T

dotnet new herald-worker -n NE_KAKFA_POSTGRE -o NE_KAKFA_POSTGRE -f=net6.0 -ne -q=kafka -d=postgre
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_POSTGRE\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_POSTGRE\NE_KAKFA_POSTGRE.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_POSTGRE\NE_KAKFA_POSTGRE.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_POSTGRE\NE_KAKFA_POSTGRE.Api\NE_KAKFA_POSTGRE.Worker.csproj" &>/dev/null &
cd NE_KAKFA_POSTGRE/.docker
sleep 10;
docker-compose exec -T -d kafka bash -c 'echo {\"Description\": \"string\"} | kafka-console-producer --broker-list kafka:9092 --topic SendToQueueMessageTopic'
docker-compose exec -T -d kafka bash -c 'echo {} | kafka-console-producer --broker-list kafka:9092 --topic GetFromDataBaseMessageTopic'
TASKKILL //IM "NE_KAKFA_POSTGRE.Worker.exe" //F //T

dotnet new herald-worker -n NE_KAKFA_MYSQL -o NE_KAKFA_MYSQL -f=net6.0 -ne -q=kafka -d=mysql
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_MYSQL\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_MYSQL\NE_KAKFA_MYSQL.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_MYSQL\NE_KAKFA_MYSQL.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_MYSQL\NE_KAKFA_MYSQL.Api\NE_KAKFA_MYSQL.Worker.csproj" &>/dev/null &
cd NE_KAKFA_MYSQL/.docker
sleep 10;
docker-compose exec -T -d kafka bash -c 'echo {\"Description\": \"string\"} | kafka-console-producer --broker-list kafka:9092 --topic SendToQueueMessageTopic'
docker-compose exec -T -d kafka bash -c 'echo {} | kafka-console-producer --broker-list kafka:9092 --topic GetFromDataBaseMessageTopic'
TASKKILL //IM "NE_KAKFA_MYSQL.Worker.exe" //F //T

dotnet new herald-worker -n NE_KAKFA_SQLSERVER -o NE_KAKFA_SQLSERVER -f=net6.0 -ne -q=kafka -d=sqlserver
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_SQLSERVER\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_SQLSERVER\NE_KAKFA_SQLSERVER.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_SQLSERVER\NE_KAKFA_SQLSERVER.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_SQLSERVER\NE_KAKFA_SQLSERVER.Api\NE_KAKFA_SQLSERVER.Worker.csproj" &>/dev/null &
cd NE_KAKFA_SQLSERVER/.docker
sleep 10;
docker-compose exec -T -d kafka bash -c 'echo {\"Description\": \"string\"} | kafka-console-producer --broker-list kafka:9092 --topic SendToQueueMessageTopic'
docker-compose exec -T -d kafka bash -c 'echo {} | kafka-console-producer --broker-list kafka:9092 --topic GetFromDataBaseMessageTopic'
TASKKILL //IM "NE_KAKFA_SQLSERVER.Worker.exe" //F //T

dotnet new herald-worker -n NE_KAKFA_NONE -o NE_KAKFA_NONE -f=net6.0 -ne -q=kafka -d=none
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_NONE\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_NONE\NE_KAKFA_NONE.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_NONE\NE_KAKFA_NONE.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_NONE\NE_KAKFA_NONE.Api\NE_KAKFA_NONE.Worker.csproj" &>/dev/null &
cd NE_KAKFA_NONE/.docker
sleep 10;
docker-compose exec -T -d kafka bash -c 'echo {\"Description\": \"string\"} | kafka-console-producer --broker-list kafka:9092 --topic SendToQueueMessageTopic'
TASKKILL //IM "NE_KAKFA_NONE.Worker.exe" //F //T

dotnet new herald-worker -n NE_RABBITMQ_POSTGRE -o NE_RABBITMQ_POSTGRE -f=net6.0 -ne -q=rabbitmq -d=postgre
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_POSTGRE\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_POSTGRE\NE_RABBITMQ_POSTGRE.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_POSTGRE\NE_RABBITMQ_POSTGRE.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_POSTGRE\NE_RABBITMQ_POSTGRE.Api\NE_RABBITMQ_POSTGRE.Worker.csproj" &>/dev/null &
cd NE_RABBITMQ_POSTGRE/.docker
sleep 10;
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_POSTGREExchange routing_key=SendToQueueMessageQueue payload='{"Description": "string"}'
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_POSTGREExchange routing_key=GetFromDataBaseMessageQueue payload='{}'
TASKKILL //IM "NE_RABBITMQ_POSTGRE.Worker.exe" //F //T

dotnet new herald-worker -n NE_RABBITMQ_MYSQL -o NE_RABBITMQ_MYSQL -f=net6.0 -ne -q=rabbitmq -d=mysql
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_MYSQL\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_MYSQL\NE_RABBITMQ_MYSQL.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_MYSQL\NE_RABBITMQ_MYSQL.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_MYSQL\NE_RABBITMQ_MYSQL.Api\NE_RABBITMQ_MYSQL.Worker.csproj" &>/dev/null &
cd NE_RABBITMQ_MYSQL/.docker
sleep 10;
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_POSTGREExchange routing_key=SendToQueueMessageQueue payload='{"Description": "string"}'
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_POSTGREExchange routing_key=GetFromDataBaseMessageQueue payload='{}'
TASKKILL //IM "NE_RABBITMQ_MYSQL.Worker.exe" //F //T

dotnet new herald-worker -n NE_RABBITMQ_SQLSERVER -o NE_RABBITMQ_SQLSERVER -f=net6.0 -ne -q=rabbitmq -d=sqlserver
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_SQLSERVER\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_SQLSERVER\NE_RABBITMQ_SQLSERVER.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_SQLSERVER\NE_RABBITMQ_SQLSERVER.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_SQLSERVER\NE_RABBITMQ_SQLSERVER.Api\NE_RABBITMQ_SQLSERVER.Worker.csproj" &>/dev/null &
cd NE_RABBITMQ_SQLSERVER/.docker
sleep 10;
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_POSTGREExchange routing_key=SendToQueueMessageQueue payload='{"Description": "string"}'
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_POSTGREExchange routing_key=GetFromDataBaseMessageQueue payload='{}'
TASKKILL //IM "NE_RABBITMQ_SQLSERVER.Worker.exe" //F //T

dotnet new herald-worker -n NE_RABBITMQ_NONE -o NE_RABBITMQ_NONE -f=net6.0 -ne -q=rabbitmq -d=none
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_NONE\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_NONE\NE_RABBITMQ_NONE.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_NONE\NE_RABBITMQ_NONE.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_NONE\NE_RABBITMQ_NONE.Api\NE_RABBITMQ_NONE.Worker.csproj" &>/dev/null &
cd NE_RABBITMQ_NONE/.docker
sleep 10;
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_POSTGREExchange routing_key=SendToQueueMessageQueue payload='{"Description": "string"}'
TASKKILL //IM "NE_RABBITMQ_NONE.Worker.exe" //F //T

dotnet new herald-worker -n NE_AZURE_POSTGRE -o NE_AZURE_POSTGRE -f=net6.0 -ne -q=azure -d=postgre
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_AZURE_POSTGRE\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\NE_AZURE_POSTGRE\NE_AZURE_POSTGRE.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\NE_AZURE_POSTGRE\NE_AZURE_POSTGRE.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\NE_AZURE_POSTGRE\NE_AZURE_POSTGRE.Api\NE_AZURE_POSTGRE.Worker.csproj" &>/dev/null &
cd NE_AZURE_POSTGRE/.docker
sleep 10;
curl -X POST http://localhost:10001/devstoreaccount1/sendtoqueuemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{"Description": "string"}</MessageText></QueueMessage>'
curl -X POST http://localhost:10001/devstoreaccount1/getfromdatabasemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{}</MessageText></QueueMessage>'
TASKKILL //IM "NE_AZURE_POSTGRE.Worker.exe" //F //T

dotnet new herald-worker -n NE_AZURE_MYSQL -o NE_AZURE_MYSQL -f=net6.0 -ne -q=azure -d=mysql
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_AZURE_MYSQL\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\NE_AZURE_MYSQL\NE_AZURE_MYSQL.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\NE_AZURE_MYSQL\NE_AZURE_MYSQL.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\NE_AZURE_MYSQL\NE_AZURE_MYSQL.Api\NE_AZURE_MYSQL.Worker.csproj" &>/dev/null &
cd NE_AZURE_MYSQL/.docker
sleep 10;
curl -X POST http://localhost:10001/devstoreaccount1/sendtoqueuemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{"Description": "string"}</MessageText></QueueMessage>'
curl -X POST http://localhost:10001/devstoreaccount1/getfromdatabasemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{}</MessageText></QueueMessage>'
TASKKILL //IM "NE_AZURE_MYSQL.Worker.exe" //F //T

dotnet new herald-worker -n NE_AZURE_SQLSERVER -o NE_AZURE_SQLSERVER -f=net6.0 -ne -q=azure -d=sqlserver
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_AZURE_SQLSERVER\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\NE_AZURE_SQLSERVER\NE_AZURE_SQLSERVER.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\NE_AZURE_SQLSERVER\NE_AZURE_SQLSERVER.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\NE_AZURE_SQLSERVER\NE_AZURE_SQLSERVER.Api\NE_AZURE_SQLSERVER.Worker.csproj" &>/dev/null &
cd NE_AZURE_SQLSERVER/.docker
sleep 10;
curl -X POST http://localhost:10001/devstoreaccount1/sendtoqueuemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{"Description": "string"}</MessageText></QueueMessage>'
curl -X POST http://localhost:10001/devstoreaccount1/getfromdatabasemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{}</MessageText></QueueMessage>'
TASKKILL //IM "NE_AZURE_SQLSERVER.Worker.exe" //F //T

dotnet new herald-worker -n NE_AZURE_NONE -o NE_AZURE_NONE -f=net6.0 -ne -q=azure -d=none
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_AZURE_NONE\.docker\docker-compose.yml' up -d --build
dotnet clean "c:\Users\tcfialho\TestHeraldWorker\NE_AZURE_NONE\NE_AZURE_NONE.sln"
dotnet build "c:\Users\tcfialho\TestHeraldWorker\NE_AZURE_NONE\NE_AZURE_NONE.sln"
nohup dotnet "run" "--project" "c:\Users\tcfialho\TestHeraldWorker\NE_AZURE_NONE\NE_AZURE_NONE.Api\NE_AZURE_NONE.Worker.csproj" &>/dev/null &
cd NE_AZURE_NONE/.docker
sleep 10;
curl -X POST http://localhost:10001/devstoreaccount1/sendtoqueuemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{"Description": "string"}</MessageText></QueueMessage>'
TASKKILL //IM "NE_AZURE_NONE.Worker.exe" //F //T
