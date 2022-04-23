# ------------------------------------------------------
# Executa containers
# ------------------------------------------------------

echo "**************************************************************************************"
echo "*** Processamento arquivo script: "
echo "*** boxes/fedora35-cloud-based/config/fedora35_docker_containers.sh"
echo "**************************************************************************************"

# Remove todos os containers em uso
echo "*** Docker: removendo todos containers"
docker container rm $(docker container ls -qa) --force

# Hello-world
echo "*** Docker: executando container hello-world"
docker run hello-world

# Alura app-node teste

# detached (não trava o terminal)
# bind de porta 80 do host e 3000 do serviço
# monta pasta /vagrant_data do host para /vagrant_data do container
# define identificador do container na network
# conecta o container na rede bridge (só os containers se enxergam por este nome)
# imagem criada à partir da node:14

echo "*** Docker: executando container dcarreirabr/alura-node-app-exemplo:1.0 na porta 3000 com bind para porta 80"
docker run \
       -d \
       -p 80:3000 \
       --mount type=bind,source=/vagrant_data,target=/vagrant_data \
       --name alura-app \
       --network bridge-vagrant \
       dcarreirabr/alura-node-app-exemplo:1.0

# Lista todos containers
echo "*** Docker: listando todos containers"
docker container list -a