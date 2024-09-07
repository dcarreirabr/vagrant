# -------------------------------------------------------------------
# Projeto: Ambiente complexo virtualizado
# -------------------------------------------------------------------

Criado por:   Daniel Mello Carreira
Criado em:    21/04/2022

Objetivo:     Criar um ambiente virtualizado com uma infraestrutura similar a um ambiente corporativo
              real on-premise que possa ser executado em um laptop Intel Corei7 rodando Linux Fedora 
              com 8GBytes de memória RAM

Restrições
    Não usar Windows
    Vagrant como IAS (Infrastructure as Code)
    Virtualbox como virtualizador
    Docker para containers
    Autenticação LDAP
    Balanceamento de carga
    APIs com Autenticação oAuth
    HTTPs: comunicação segura entre servers
    Bancos de dados no Host
    Códigos-fonte no Host
    Bugzilla como controle de bugs
    Git como SCM/VCS
        Github
        Gitlab

Host
    Software 
        Linux Fedora 35
        VirtualBox 6.1
        Vagrant V. 2.2.16
        VisualStudioCode 1.66.2
            Markdownlint
            Remote - SSH
            Vagrant
            YAML
    Pontos para montagem
        /mnt/hd1tb/Vagrant/data: dados das aplicações e código-fonte
            /scr: código-fonte dos projetos
            /db: bancos de dados
        /mnt/hd1tb/Vagrant/boxes

VMs
    Nome
        vf35vm
    Tipo
        Vagrant
    Descrição
        VM Host da plataforma de containers 
    SO  
        Vagrant Box fedora/35-cloud-base (Fedora 35 cloud edition)
    HOMEDIR
        /mnt/hd1tb/Vagrant/boxes/fedora35-cloud-based
    Docker
        Version 20.10.14 build a224086
        Containers
            hello-world
            nodejs
    Montagens
        Host:<diretorio da box> => /vagrant
        Host:/mnt/hd1tb/Vagrant/data => /vagrant_data

Servers
    Applicaton
        J2EE: Wildfly
        J2EE: Glassfish
        J233: TomEE
        WEB server: Tomcat
        WEB server: Jetty
        Nodejs
    Database
        MariaDb
        Postgre
        Oracle Express
        Redis
        MongoDB
        Couch
    Infrastructure 
        Proxy 
        LDAP 
        Firewall: IPTables
        Api Gateway: Mulesoft
        Cache
        VPN
        DNS
        Jenkins
        Maven

Linguagens
    Nodejs
    Java
    Python

# -------------------------------------------------------------------
# HOST: instruções gerais a respeito da instalação / preparação do ambiente 
# -------------------------------------------------------------------

1) Instalar o VirtualBox
    
    https://computingforgeeks.com/how-to-install-vagrant-and-virtualbox-on-fedora/

    Verifica compatibilidade da cpu
        
        cat /proc/cpuinfo | egrep "vmx|svm"

    Adiciona o repositório do VirtualBox

        sudo dnf -y install wget
        wget http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
        sudo mv virtualbox.repo /etc/yum.repos.d/virtualbox.repo

    After adding the repository, install VirtualBox

        sudo dnf install -y gcc binutils make glibc-devel patch libgomp glibc-headers  kernel-headers kernel-devel-`uname -r` dkms
        sudo dnf install -y VirtualBox-6.1

    Add your user account to the vboxusersgroup.

        sudo usermod -a -G vboxusers ${USER}
    
    Configure VirtualBox Drivers

        sudo /usr/lib/virtualbox/vboxdrv.sh setup

    Download Extension Pack:

        cd ~/
        wget https://download.virtualbox.org/virtualbox/6.1.28/Oracle_VM_VirtualBox_Extension_Pack-6.1.28.vbox-extpack

2) Instalar o Vagrant

    sudo dnf -y install vagrant

3) Arquivo ~/.bashrc: 
    
    definir o local onde os boxes serão baixados
    definir aliases   

    # User specific aliases and functions
    set -o vi

    # Diretorios
    alias v  ="cd /mnt/hd1tb/Vagrant/boxes #boxes"
    alias h  ="cd ~/. #home dir"

    # Comandos
    alias vu='vagrant up $1'
    alias vup='vagrant up $1 --provision'
    alias vp='vagrant provision $1'
    alias vs='vagrant ssh $1'
    alias vgs='vagrant global-status'
    alias vh='vagrant halt $1'
    alias vhf='vagrant halt $1 --force'
    alias vd='vagrant destroy $1'
    alias vdf='vagrant destroy $1 --force'
    alias vs='vagrant status $1'
    alias vbl='vagrant box list'


    # PATH customizado
    PATH=$PATH:~/bin

    # PATH customizado - Local que baixa os boxes e guarda demais configurações comuns para VMs
    export VAGRANT_HOME=/mnt/hd1tb/Vagrant/home

4) Automatizar integração com os repositórios GIT através de chave RSA no ~.ssh/config
