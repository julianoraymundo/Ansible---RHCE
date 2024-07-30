#!/bin/bash

# script de instalação do Ansible

#Instala Ansible e pacotes adicionais
yum update -y
subscription-manager repos --enable codeready-builder-for-rhel-9-$(arch)-rpms
dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm -y
yum install ansible-core bash-completion vim -y

# cria o usuário e concede permissão sudo
useradd ansible
passwd ansbible
echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible
