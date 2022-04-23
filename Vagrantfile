# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

# script inline com variável
# $meu_script = <<-SCRIPT
# echo I am provisioning...
# echo "date > /etc/vagrant_provisioned_at"
# SCRIPT

Vagrant.configure("2") do |config|

  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "fedora/35-cloud-base"
  config.vm.hostname = "vf35vm"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = true #default = true

  # ===========================================================
  # NETWORK
  # ===========================================================

  # ===========================================================
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # ===========================================================
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # ===========================================================
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # ===========================================================
  config.vm.network "forwarded_port", guest: 81, host: 8081, host_ip: "127.0.0.1"

  # ===========================================================
  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # ===========================================================
  # config.vm.network "private_network", ip: "192.168.33.10"

  # ===========================================================
  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # ===========================================================

  #config.vm.network "public_network"

  # ===========================================================
  # MOUNTING
  # ===========================================================

  # ===========================================================
  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # ===========================================================
  config.vm.synced_folder "/mnt/hd1tb/Vagrant/data", "/vagrant_data"
 
  # ===========================================================
  # PROVIDERS
  # ===========================================================
  
  # ===========================================================
  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  # ===========================================================
  
  # View the documentation for the provider you are using for more
  # information on available options.

  # config.vm.define "MINHA_VM" do |web|
  #
  # end

  config.vm.provider "virtualbox" do |v|
    v.gui = false
    v.memory = 2048
    v.cpus = 3
    v.name = "vf35vm"
    v.check_guest_additions = true #default = true
   end
 
  # ===========================================================
  # PROVISIONING
  # ===========================================================

  # ===========================================================
  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # ===========================================================
  
  # ===========================================================
  # SHELL
  # ===========================================================

  # -----------------------------------------------------------
  # shell inline (variavel: declarado no inicio do Vagrantfile)
  # -----------------------------------------------------------
  # config.vm.provision "shell", inline: $meu_script
  
  # -----------------------------------------------------------
  # shell inline (fixo)
  # -----------------------------------------------------------
  # config.vm.provision "shell", inline: <<-SHELL
  #    dnf update -y
  # SHELL

  # -----------------------------------------------------------
  # shell - external
  # -----------------------------------------------------------
  
  # Configurações comuns para todas VMs
  config.vm.provision "shell", path: "config/fedora35_common_config_1.sh"
  
  # Docker: instalação e configuração 
  config.vm.provision "shell", path: "config/fedora35_docker_install.sh"
  
  # Docker: cria imagens customizadas
  config.vm.provision "shell", path: "config/fedora35_docker_images.sh"
  
  # Docker: cria containers 
  config.vm.provision "shell", path: "config/fedora35_docker_containers.sh"

end
