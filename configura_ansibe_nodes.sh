#!/bin/bash

#Instala Ansible e pacotes adicionais
subscription-manager register --force
yum update -y
yum install vim bash-completion -y
useradd ansible
passwd ansible
echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible
echo "192.168.64.50 controller controller.razor.local" >> /etc/hosts
