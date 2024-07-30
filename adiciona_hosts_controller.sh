#!/bin/bash
# Executar com o usuário ansible

# valida se já existe a chave ssh publica para conexao
FILE=/home/ansible/.ssh/id_rsa.pub
if [ -f "$FILE" ]; then
    echo "a chave ssh já existe"
  else
    ssh-keygen
fi

# adiciona NODES
echo "Informe a quantidade de nodes que deseja adicionar ao Ansible Controller"
read QTD_NODES
for (( loop=1; loop<=$QTD_NODES; loop++)) do
  echo "Informe o Endereço IP do host $loop"
  read NODE_IP
  echo "Informe o FQND do host $loop"
  read NODE_FQDN
  NODE_DNS='echo $NODE_FQDN | cut -f 1 -d .'
  ssh-copy-id $NODE_IP
  echo $NODE_IP $NODE_DNS $NODE_FQDN | sudo tee -a /etc/hosts
done
