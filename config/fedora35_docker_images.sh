# Cria imagem da aplicação e roda na porta definida no Dockerfile: 

echo "**************************************************************************************"
echo "*** Processamento arquivo script: "
echo "*** boxes/fedora35-cloud-based/config/fedora35_docker_images.sh"
echo "**************************************************************************************"

# Remove todas as imagens baixadas 
docker image rm $(docker image ls -qa) --force 

# Builda a imagem da aplicação com o node. Execução está descrita no Dockerfile também.
# Entra no diretorio do Dockerfile
cd /vagrant_data/src/alura-docker/app-exemplo
docker build -t dcarreirabr/alura-node-app-exemplo:1.0 .

# Lista as imagens criadas
docker image list