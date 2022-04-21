#!/bin/bash

# Colocar os scripts de setup comum para todas as VMs
# Vagrant executa comandos como su
#   1) dnf update -y
#   2) setup da linguagem (se necessário)
#   3) pontos de montagem adicionais

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

