#  Solicita token e armazena reposta na var
getjwt=$(curl --location --request POST 'http://localhost:4000/users' --header 'Content-Type: application/json' --data-raw '{ "username":"provedor.manager", "orgName":"Provedor"}')
echo $getjwt

# Armazena token na var
read token < <(echo $getjwt | jq -r '.token')

#  Inicia container com token como variavel de ambiente
docker rm -f event2ledger1
docker build -t event2ledger1 .
docker run --name event2ledger1 --env newtoken=$token -d event2ledger1