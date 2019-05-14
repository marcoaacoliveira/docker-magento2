#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Por favor especifique um diretorio para ser copiado para o container (ex. vendor, --all)"
    exit
fi

if [[ "$1" == "--all" ]]; then
    (docker cp $(docker-compose ps | grep -e mage_nginx | awk '{print $1}'):/magento2/ ~/Projects/magento2/./ || true)
    echo "Copiou todos os arquivos do host para os containers"
else
    docker cp $(docker-compose ps | grep  -e mage2_nginx | awk '{print $1}'):/magento2/$1 ~/Projects/magento2/
    echo "Copiou todos a pasta $1 do host para os containers"
fi