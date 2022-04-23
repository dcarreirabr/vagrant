#!/bin/bash

# Colocar os scripts de setup comum para todas as VMs
# Vagrant executa comandos como su
#   1) dnf update -y
#   2) setup da linguagem (se necessário)
#   3) pontos de montagem adicionais

echo "**************************************************************************************"
echo "*** Processamento arquivo script: "
echo "*** boxes/fedora35-cloud-based/config/fedora35_common_config_1.sh"
echo "**************************************************************************************"

# Atualiza SO e aplicações
dnf update -y

# Mostra permissões antes da alteração
#ls -ltr /etc/locale.conf

# Altera as configurações locais para PT-BR
#cat /vagrant/config/fedora35_file_etc_locale.conf > /etc/locale.conf

# Mostra o resultado da alteração
#cat /etc/locale.conf

# Mostra permissões após a alteração
#ls -ltr /etc/locale.conf

# Inclui configurações adicionais no .bashrc
# to do: 
# Se não existir fazer copia do .bashrc para .bashrc_original
# Dar cat .bashrc com .bashrc_original +  
# /vagrant/config/fedora35_.bashrc no arquivo 