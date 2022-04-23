# ------------------------------------------------------
# Executa containers
# ------------------------------------------------------

# Hello-world
echo "Docker: executando container hello-world"
docker run hello-world

# Alura app-node teste
echo "Docker: executando container dcarreirabr/alura-node-app-exemplo:1.0 na porta 3000 com bind para porta 80"
docker run \
       -p 80:3000 \
       --mount type=bind,source=/vagrant_data,target=/vagrant_data \
       --name alura-app \
       --network bridge-vagrant \
       dcarreirabr/alura-node-app-exemplo:1.0

# Lista todos containers
docker container list -a