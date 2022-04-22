# Instalação do Docker
# Fedora 34 em diante
#
# Obs: Vagrant roda script com su
#
# Documentação oficial
#    https://docs.docker.com/engine/install/fedora/#:~:text=Go%20to%20https%3A%2F%2Fdownload,version%20you%20want%20to%20install.&text=To%20install%20a%20nightly%20or,URL%20to%20nightly%20or%20test%20.

# Desinstala versoes anteriores

dnf remove -y docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine

# Instala repositório estável
dnf -y install dnf-plugins-core
dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

# Instala o engine
dnf install -y docker-ce docker-ce-cli containerd.io

# Documentação para instalação de versão específica
#   https://docs.docker.com/engine/install/fedora/#install-using-the-repository

# Iniciliza o serviço
systemctl start docker

# Roda o container Hello World
docker run hello-world

# Pos instalação
groupadd docker
sudo usermod -aG docker $USER #tem que ser com o sudo no caso é o user vagrant (default)
