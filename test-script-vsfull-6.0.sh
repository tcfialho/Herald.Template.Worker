dotnet new herald-worker -n E_SQS_POSTGRE -o E_SQS_POSTGRE -f=net6.0 -q=sqs -d=postgre
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_SQS_POSTGRE\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\E_SQS_POSTGRE\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\E_SQS_POSTGRE\.docker\docker-compose.override.http.yml" up -d --build  
sleep 15;
curl -k -s -o /dev/null -w "Code: %{http_code}" -X 'GET' 'http://localhost:5000/hc'
cd E_SQS_POSTGRE/.docker
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4566 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4566/000000000000/GetFromExternalApiMessageQueue.fifo' --message-body '{"PostalCode": "04562000"}'
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4576 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4576/queue/SendToQueueMessageQueue.fifo' --message-body '{"description": "string"}'
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4566 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4566/000000000000/GetFromDataBaseMessageQueue.fifo' --message-body '{}'
docker logs docker-e_sqs_postgre.worker-1
cd ../..

dotnet new herald-worker -n E_SQS_MYSQL -o E_SQS_MYSQL -f=net6.0 -q=sqs -d=mysql
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_SQS_MYSQL\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\E_SQS_MYSQL\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\E_SQS_MYSQL\.docker\docker-compose.override.http.yml" up -d --build  
sleep 15;
curl -k -s -o /dev/null -w "Code: %{http_code}" -X 'GET' 'http://localhost:5000/hc'
cd E_SQS_MYSQL/.docker
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4566 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4566/000000000000/GetFromExternalApiMessageQueue.fifo' --message-body '{"PostalCode": "04562000"}'
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4576 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4576/queue/SendToQueueMessageQueue.fifo' --message-body '{"description": "string"}'
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4566 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4566/000000000000/GetFromDataBaseMessageQueue.fifo' --message-body '{}'
docker logs docker-e_sqs_mysql.worker-1
cd ../..

dotnet new herald-worker -n E_SQS_SQLSERVER -o E_SQS_SQLSERVER -f=net6.0 -q=sqs -d=sqlserver
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_SQS_SQLSERVER\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\E_SQS_SQLSERVER\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\E_SQS_SQLSERVER\.docker\docker-compose.override.http.yml" up -d --build  
sleep 15;
cd E_SQS_SQLSERVER/.docker
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4566 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4566/000000000000/GetFromExternalApiMessageQueue.fifo' --message-body '{"PostalCode": "04562000"}'
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4576 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4576/queue/SendToQueueMessageQueue.fifo' --message-body '{"description": "string"}'
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4566 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4566/000000000000/GetFromDataBaseMessageQueue.fifo' --message-body '{}'
docker logs docker-e_sqs_sqlserver.worker-1
cd ../..

dotnet new herald-worker -n E_SQS_NONE -o E_SQS_NONE -f=net6.0 -q=sqs -d=none
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_SQS_NONE\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\E_SQS_NONE\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\E_SQS_NONE\.docker\docker-compose.override.http.yml" up -d --build  
sleep 15;
cd E_SQS_NONE/.docker
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4566 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4566/000000000000/GetFromExternalApiMessageQueue.fifo' --message-body '{"PostalCode": "04562000"}'
docker-compose exec -d localstack aws --endpoint-url=http://localhost:4576 sqs send-message --message-group-id WorkerService.Worker --queue-url 'http://localhost:4576/queue/SendToQueueMessageQueue.fifo' --message-body '{"description": "string"}'
docker logs docker-e_sqs_none.worker-1
cd ../..

dotnet new herald-worker -n E_KAKFA_POSTGRE -o E_KAKFA_POSTGRE -f=net6.0 -q=kafka -d=postgre
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_KAKFA_POSTGRE\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\E_KAKFA_POSTGRE\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\E_KAKFA_POSTGRE\.docker\docker-compose.override.http.yml" up -d --build  
sleep 15;
cd E_KAKFA_POSTGRE/.docker
docker-compose exec -T -d kafka bash -c 'echo {\"PostalCode\": \"04562000\"} | kafka-console-producer --broker-list kafka:9092 --topic GetFromExternalApiMessageTopic'
docker-compose exec -T -d kafka bash -c 'echo {\"Description\": \"string\"} | kafka-console-producer --broker-list kafka:9092 --topic SendToQueueMessageTopic'
docker-compose exec -T -d kafka bash -c 'echo {} | kafka-console-producer --broker-list kafka:9092 --topic GetFromDataBaseMessageTopic'
docker logs docker-e_kakfa_postgre.worker-1
cd ../..

dotnet new herald-worker -n E_KAKFA_MYSQL -o E_KAKFA_MYSQL -f=net6.0 -q=kafka -d=mysql
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_KAKFA_MYSQL\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\E_KAKFA_MYSQL\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\E_KAKFA_MYSQL\.docker\docker-compose.override.http.yml" up -d --build  
sleep 15;
cd E_KAKFA_MYSQL/.docker
docker-compose exec -T -d kafka bash -c 'echo {\"PostalCode\": \"04562000\"} | kafka-console-producer --broker-list kafka:9092 --topic GetFromExternalApiMessageTopic'
docker-compose exec -T -d kafka bash -c 'echo {\"Description\": \"string\"} | kafka-console-producer --broker-list kafka:9092 --topic SendToQueueMessageTopic'
docker-compose exec -T -d kafka bash -c 'echo {} | kafka-console-producer --broker-list kafka:9092 --topic GetFromDataBaseMessageTopic'
docker logs docker-e_kakfa_mysql.worker-1
cd ../..

dotnet new herald-worker -n E_KAKFA_SQLSERVER -o E_KAKFA_SQLSERVER -f=net6.0 -q=kafka -d=sqlserver
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_KAKFA_SQLSERVER\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\E_KAKFA_SQLSERVER\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\E_KAKFA_SQLSERVER\.docker\docker-compose.override.http.yml" up -d --build  
sleep 15;
cd E_KAKFA_SQLSERVER/.docker
docker-compose exec -T -d kafka bash -c 'echo {\"PostalCode\": \"04562000\"} | kafka-console-producer --broker-list kafka:9092 --topic GetFromExternalApiMessageTopic'
docker-compose exec -T -d kafka bash -c 'echo {\"Description\": \"string\"} | kafka-console-producer --broker-list kafka:9092 --topic SendToQueueMessageTopic'
docker-compose exec -T -d kafka bash -c 'echo {} | kafka-console-producer --broker-list kafka:9092 --topic GetFromDataBaseMessageTopic'
docker logs docker-e_kakfa_sqlserver.worker-1
cd ../..

dotnet new herald-worker -n E_KAKFA_NONE -o E_KAKFA_NONE -f=net6.0 -q=kafka -d=none
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_KAKFA_NONE\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\E_KAKFA_NONE\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\E_KAKFA_NONE\.docker\docker-compose.override.http.yml" up -d --build  
sleep 15;
cd E_KAKFA_NONE/.docker
docker-compose exec -T -d kafka bash -c 'echo {\"PostalCode\": \"04562000\"} | kafka-console-producer --broker-list kafka:9092 --topic GetFromExternalApiMessageTopic'
docker-compose exec -T -d kafka bash -c 'echo {\"Description\": \"string\"} | kafka-console-producer --broker-list kafka:9092 --topic SendToQueueMessageTopic'
docker logs docker-e_kakfa_none.worker-1
cd ../..

dotnet new herald-worker -n E_RABBITMQ_POSTGRE -o E_RABBITMQ_POSTGRE -f=net6.0 -q=rabbitmq -d=postgre
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_POSTGRE\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_POSTGRE\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_POSTGRE\.docker\docker-compose.override.http.yml" up -d --build 
sleep 15;
cd E_KAKFA_NONE/.docker
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_POSTGREExchange routing_key=GetFromExternalApiMessageQueue payload='{"PostalCode": "04562000"}'
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_POSTGREExchange routing_key=SendToQueueMessageQueue payload='{"Description": "string"}'
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_POSTGREExchange routing_key=GetFromDataBaseMessageQueue payload='{}'
cd ../..

dotnet new herald-worker -n E_RABBITMQ_MYSQL -o E_RABBITMQ_MYSQL -f=net6.0 -q=rabbitmq -d=mysql
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_MYSQL\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_MYSQL\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_MYSQL\.docker\docker-compose.override.http.yml" up -d --build 
sleep 15;
cd E_KAKFA_NONE/.docker
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_MYSQLExchange routing_key=SendToQueueMessageQueue payload='{"Description": "string"}'
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_MYSQLExchange routing_key=GetFromDataBaseMessageQueue payload='{}'
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_MYSQLExchange routing_key=GetFromExternalApiMessageQueue payload='{"PostalCode": "04562000"}'
cd ../..

dotnet new herald-worker -n E_RABBITMQ_SQLSERVER -o E_RABBITMQ_SQLSERVER -f=net6.0 -q=rabbitmq -d=sqlserver
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_SQLSERVER\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_SQLSERVER\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_SQLSERVER\.docker\docker-compose.override.http.yml" up -d --build 
sleep 15;
cd E_KAKFA_NONE/.docker
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_SQLSERVERExchange routing_key=GetFromExternalApiMessageQueue payload='{"PostalCode": "04562000"}'
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_SQLSERVERExchange routing_key=SendToQueueMessageQueue payload='{"Description": "string"}'
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_SQLSERVERExchange routing_key=GetFromDataBaseMessageQueue payload='{}'
cd ../..

dotnet new herald-worker -n E_RABBITMQ_NONE -o E_RABBITMQ_NONE -f=net6.0 -q=rabbitmq -d=none
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_NONE\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_NONE\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\E_RABBITMQ_NONE\.docker\docker-compose.override.http.yml" up -d --build 
sleep 15;
cd E_KAKFA_NONE/.docker
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_NONEExchange routing_key=GetFromExternalApiMessageQueue payload='{"PostalCode": "04562000"}'
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=E_RABBITMQ_NONEExchange routing_key=SendToQueueMessageQueue payload='{"Description": "string"}'
cd ../..

dotnet new herald-worker -n E_AZURE_POSTGRE -o E_AZURE_POSTGRE -f=net6.0 -q=azure -d=postgre
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_AZURE_POSTGRE\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\E_AZURE_POSTGRE\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\E_AZURE_POSTGRE\.docker\docker-compose.override.http.yml" up -d --build 
sleep 10;
curl -X POST http://localhost:10001/devstoreaccount1/getfromexternalapimessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{"PostalCode": "04562000"}</MessageText></QueueMessage>'
curl -X POST http://localhost:10001/devstoreaccount1/sendtoqueuemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{"Description": "string"}</MessageText></QueueMessage>'
curl -X POST http://localhost:10001/devstoreaccount1/getfromdatabasemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{}</MessageText></QueueMessage>'

dotnet new herald-worker -n E_AZURE_MYSQL -o E_AZURE_MYSQL -f=net6.0 -q=azure -d=mysql
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_AZURE_MYSQL\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\E_AZURE_MYSQL\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\E_AZURE_MYSQL\.docker\docker-compose.override.http.yml" up -d --build 
sleep 10;
curl -X POST http://localhost:10001/devstoreaccount1/getfromexternalapimessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{"PostalCode": "04562000"}</MessageText></QueueMessage>'
curl -X POST http://localhost:10001/devstoreaccount1/sendtoqueuemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{"Description": "string"}</MessageText></QueueMessage>'
curl -X POST http://localhost:10001/devstoreaccount1/getfromdatabasemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{}</MessageText></QueueMessage>'

dotnet new herald-worker -n E_AZURE_SQLSERVER -o E_AZURE_SQLSERVER -f=net6.0 -q=azure -d=sqlserver
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_AZURE_SQLSERVER\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\E_AZURE_SQLSERVER\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\E_AZURE_SQLSERVER\.docker\docker-compose.override.http.yml" up -d --build 
sleep 10;
curl -X POST http://localhost:10001/devstoreaccount1/getfromexternalapimessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{"PostalCode": "04562000"}</MessageText></QueueMessage>'
curl -X POST http://localhost:10001/devstoreaccount1/sendtoqueuemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{"Description": "string"}</MessageText></QueueMessage>'
curl -X POST http://localhost:10001/devstoreaccount1/getfromdatabasemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{}</MessageText></QueueMessage>'

dotnet new herald-worker -n E_AZURE_NONE -o E_AZURE_NONE -f=net6.0 -q=azure -d=none
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\E_AZURE_NONE\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\E_AZURE_NONE\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\E_AZURE_NONE\.docker\docker-compose.override.http.yml" up -d --build 
sleep 10;
curl -X POST http://localhost:10001/devstoreaccount1/getfromexternalapimessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{"PostalCode": "04562000"}</MessageText></QueueMessage>'
curl -X POST http://localhost:10001/devstoreaccount1/getfromdatabasemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{}</MessageText></QueueMessage>'

dotnet new herald-worker -n NE_SQS_POSTGRE -o NE_SQS_POSTGRE -f=net6.0 -ne -q=sqs -d=postgre
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_SQS_POSTGRE\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\NE_SQS_POSTGRE\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\NE_SQS_POSTGRE\.docker\docker-compose.override.http.yml" up -d --build 
sleep 10;
curl -k -s -o /dev/null -w "Code: %{http_code}" -X 'POST' 'http://localhost:5000/NE_SQS_POSTGRE' -H 'Content-Type: application/json' -d '{"description": "string"}' 
curl -k -s -o /dev/null -w "Code: %{http_code}" -X 'GET' 'http://localhost:5000/NE_SQS_POSTGRE'

dotnet new herald-worker -n NE_SQS_MYSQL -o NE_SQS_MYSQL -f=net6.0 -ne -q=sqs -d=mysql
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_SQS_MYSQL\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\NE_SQS_MYSQL\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\NE_SQS_MYSQL\.docker\docker-compose.override.http.yml" up -d --build 
sleep 10;
curl -k -s -o /dev/null -w "Code: %{http_code}" -X 'POST' 'http://localhost:5000/NE_SQS_MYSQL' -H 'Content-Type: application/json' -d '{"description": "string"}' 
curl -k -s -o /dev/null -w "Code: %{http_code}" -X 'GET' 'http://localhost:5000/NE_SQS_MYSQL'

dotnet new herald-worker -n NE_SQS_SQLSERVER -o NE_SQS_SQLSERVER -f=net6.0 -ne -q=sqs -d=sqlserver
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_SQS_SQLSERVER\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\NE_SQS_SQLSERVER\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\NE_SQS_SQLSERVER\.docker\docker-compose.override.http.yml" up -d --build 
sleep 10;
curl -k -s -o /dev/null -w "Code: %{http_code}" -X 'POST' 'http://localhost:5000/NE_SQS_SQLSERVER' -H 'Content-Type: application/json' -d '{"description": "string"}' 
curl -k -s -o /dev/null -w "Code: %{http_code}" -X 'GET' 'http://localhost:5000/NE_SQS_SQLSERVER'

dotnet new herald-worker -n NE_SQS_NONE -o NE_SQS_NONE -f=net6.0 -ne -q=sqs -d=none
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_SQS_NONE\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\NE_SQS_NONE\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\NE_SQS_NONE\.docker\docker-compose.override.http.yml" up -d --build 
sleep 10;
curl -k -s -o /dev/null -w "Code: %{http_code}" -X 'POST' 'http://localhost:5000/NE_SQS_NONE' -H 'Content-Type: application/json' -d '{"description": "string"}' 

dotnet new herald-worker -n NE_KAKFA_POSTGRE -o NE_KAKFA_POSTGRE -f=net6.0 -ne -q=kafka -d=postgre
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_POSTGRE\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_POSTGRE\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_POSTGRE\.docker\docker-compose.override.http.yml" up -d --build 
sleep 15;
cd NE_KAKFA_POSTGRE/.docker
docker-compose exec -T -d kafka bash -c 'echo {\"Description\": \"string\"} | kafka-console-producer --broker-list kafka:9092 --topic SendToQueueMessageTopic'
docker-compose exec -T -d kafka bash -c 'echo {} | kafka-console-producer --broker-list kafka:9092 --topic GetFromDataBaseMessageTopic'
docker logs docker-ne_kakfa_postgre.worker-1
cd ../..

dotnet new herald-worker -n NE_KAKFA_MYSQL -o NE_KAKFA_MYSQL -f=net6.0 -ne -q=kafka -d=mysql
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_MYSQL\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_MYSQL\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_MYSQL\.docker\docker-compose.override.http.yml" up -d --build 
sleep 15;
cd NE_KAKFA_MYSQL/.docker
docker-compose exec -T -d kafka bash -c 'echo {\"Description\": \"string\"} | kafka-console-producer --broker-list kafka:9092 --topic SendToQueueMessageTopic'
docker-compose exec -T -d kafka bash -c 'echo {} | kafka-console-producer --broker-list kafka:9092 --topic GetFromDataBaseMessageTopic'
docker logs docker-ne_kakfa_mysql.worker-1
cd ../..

dotnet new herald-worker -n NE_KAKFA_SQLSERVER -o NE_KAKFA_SQLSERVER -f=net6.0 -ne -q=kafka -d=sqlserver
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_SQLSERVER\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_SQLSERVER\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_SQLSERVER\.docker\docker-compose.override.http.yml" up -d --build 
sleep 15;
cd NE_KAKFA_SQLSERVER/.docker
docker-compose exec -T -d kafka bash -c 'echo {\"Description\": \"string\"} | kafka-console-producer --broker-list kafka:9092 --topic SendToQueueMessageTopic'
docker-compose exec -T -d kafka bash -c 'echo {} | kafka-console-producer --broker-list kafka:9092 --topic GetFromDataBaseMessageTopic'
docker logs docker-ne_kakfa_sqlserver.worker-1
cd ../..

dotnet new herald-worker -n NE_KAKFA_NONE -o NE_KAKFA_NONE -f=net6.0 -ne -q=kafka -d=none
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_NONE\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_NONE\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\NE_KAKFA_NONE\.docker\docker-compose.override.http.yml" up -d --build 
sleep 15;
cd NE_KAKFA_NONE/.docker
docker-compose exec -T -d kafka bash -c 'echo {\"Description\": \"string\"} | kafka-console-producer --broker-list kafka:9092 --topic SendToQueueMessageTopic'
docker logs docker-ne_kakfa_none.worker-1
cd ../..

dotnet new herald-worker -n NE_RABBITMQ_POSTGRE -o NE_RABBITMQ_POSTGRE -f=net6.0 -ne -q=rabbitmq -d=postgre
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_POSTGRE\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_POSTGRE\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_POSTGRE\.docker\docker-compose.override.http.yml" up -d --build 
sleep 15;
cd E_KAKFA_NONE/.docker
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=NE_RABBITMQ_POSTGREExchange routing_key=SendToQueueMessageQueue payload='{"Description": "string"}'
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=NE_RABBITMQ_POSTGREExchange routing_key=GetFromDataBaseMessageQueue payload='{}'
cd ../..

dotnet new herald-worker -n NE_RABBITMQ_MYSQL -o NE_RABBITMQ_MYSQL -f=net6.0 -ne -q=rabbitmq -d=mysql
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_MYSQL\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_MYSQL\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_MYSQL\.docker\docker-compose.override.http.yml" up -d --build 
sleep 15;
cd E_KAKFA_NONE/.docker
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=NE_RABBITMQ_MYSQLExchange routing_key=SendToQueueMessageQueue payload='{"Description": "string"}'
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=NE_RABBITMQ_MYSQLExchange routing_key=GetFromDataBaseMessageQueue payload='{}'
cd ../..

dotnet new herald-worker -n NE_RABBITMQ_SQLSERVER -o NE_RABBITMQ_SQLSERVER -f=net6.0 -ne -q=rabbitmq -d=sqlserver
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_SQLSERVER\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_SQLSERVER\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_SQLSERVER\.docker\docker-compose.override.http.yml" up -d --build 
sleep 15;
cd E_KAKFA_NONE/.docker
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=NE_RABBITMQ_SQLSERVERExchange routing_key=SendToQueueMessageQueue payload='{"Description": "string"}'
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=NE_RABBITMQ_SQLSERVERExchange routing_key=GetFromDataBaseMessageQueue payload='{}'
cd ../..

dotnet new herald-worker -n NE_RABBITMQ_NONE -o NE_RABBITMQ_NONE -f=net6.0 -ne -q=rabbitmq -d=none
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_NONE\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_NONE\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\NE_RABBITMQ_NONE\.docker\docker-compose.override.http.yml" up -d --build 
sleep 15;
cd E_KAKFA_NONE/.docker
docker-compose exec -d rabbitmq rabbitmqadmin --host rabbitmq -uuser -ppassword publish exchange=NE_RABBITMQ_NONEExchange routing_key=SendToQueueMessageQueue payload='{"Description": "string"}'
cd ../..

dotnet new herald-worker -n NE_AZURE_POSTGRE -o NE_AZURE_POSTGRE -f=net6.0 -ne -q=azure -d=postgre
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_AZURE_POSTGRE\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\NE_AZURE_POSTGRE\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\NE_AZURE_POSTGRE\.docker\docker-compose.override.http.yml" up -d --build 
sleep 10;
curl -X POST http://localhost:10001/devstoreaccount1/sendtoqueuemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{"Description": "string"}</MessageText></QueueMessage>'
curl -X POST http://localhost:10001/devstoreaccount1/getfromdatabasemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{}</MessageText></QueueMessage>'

dotnet new herald-worker -n NE_AZURE_MYSQL -o NE_AZURE_MYSQL -f=net6.0 -ne -q=azure -d=mysql
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_AZURE_MYSQL\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\NE_AZURE_MYSQL\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\NE_AZURE_MYSQL\.docker\docker-compose.override.http.yml" up -d --build 
sleep 10;
curl -X POST http://localhost:10001/devstoreaccount1/sendtoqueuemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{"Description": "string"}</MessageText></QueueMessage>'
curl -X POST http://localhost:10001/devstoreaccount1/getfromdatabasemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{}</MessageText></QueueMessage>'

dotnet new herald-worker -n NE_AZURE_SQLSERVER -o NE_AZURE_SQLSERVER -f=net6.0 -ne -q=azure -d=sqlserver
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_AZURE_SQLSERVER\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\NE_AZURE_SQLSERVER\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\NE_AZURE_SQLSERVER\.docker\docker-compose.override.http.yml" up -d --build 
sleep 10;
curl -X POST http://localhost:10001/devstoreaccount1/sendtoqueuemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{"Description": "string"}</MessageText></QueueMessage>'
curl -X POST http://localhost:10001/devstoreaccount1/getfromdatabasemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{}</MessageText></QueueMessage>'

dotnet new herald-worker -n NE_AZURE_NONE -o NE_AZURE_NONE -f=net6.0 -ne -q=azure -d=none
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker network prune --force
docker-compose -f 'C:\Users\tcfialho\TestHeraldWorker\NE_AZURE_NONE\.docker\docker-compose.yml' -f 'C:\Users\tcfialho\TestHeraldWorker\NE_AZURE_NONE\.docker\docker-compose.override.yml' -f  "C:\Users\tcfialho\TestHeraldWorker\NE_AZURE_NONE\.docker\docker-compose.override.http.yml" up -d --build 
sleep 10;
curl -X POST http://localhost:10001/devstoreaccount1/getfromdatabasemessagequeue/messages -H "Content-Type: application/xml" -d '<QueueMessage><MessageText>{}</MessageText></QueueMessage>'
