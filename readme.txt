# -------------------------------------------------------------------
# Instruções gerais a respeito da instalação / preparação do ambiente 
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
    alias vu ='vagrant up #vu'
    alias vup='vagrant up --provision #vup'
    alias vp ='vagrant provision #vp'
    alias vgs='vagrant global-status #vgs'
    alias vh ='vagrant halt #vh'
    alias vhf='vagrant halt --force #vhf'
    alias vd ='vagrant destroy #vd'
    alias vdf='vagrant destroy --force #vdf'
    alias vs ='vagrant status <id> #vs'
    alias vbl='vagrant box list #vbl'

    # PATH customizado
    PATH=$PATH:~/bin

    # PATH customizado - Local que baixa os boxes e guarda demais configurações comuns para VMs
    export VAGRANT_HOME=/mnt/hd1tb/Vagrant/home
