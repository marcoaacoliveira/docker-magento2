#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Por favor especifique um diretorio para ser copiado para o container (ex. vendor, --all)"
    exit
fi

if [[ "$1" == '--all' ]]; then
    #copy all folders and files to php
    docker cp ~/Projects/magento2/app/.htaccess $(docker-compose ps | grep -e mage2_php | awk '{print $1}'):/magento2/app/.htaccess
    docker cp ~/Projects/magento2/app/autoload.php $(docker-compose ps | grep -e mage2_php | awk '{print $1}'):/magento2/app/autoload.php
    docker cp ~/Projects/magento2/app/bootstrap.php $(docker-compose ps | grep -e mage2_php | awk '{print $1}'):/magento2/app/bootstrap.php
    docker cp ~/Projects/magento2/app/functions.php $(docker-compose ps | grep -e mage2_php | awk '{print $1}'):/magento2/app/functions.php
    docker cp ~/Projects/magento2/bin $(docker-compose ps | grep -e mage2_php | awk '{print $1}'):/magento2/bin
    docker cp ~/Projects/magento2/dev $(docker-compose ps | grep -e mage2_php | awk '{print $1}'):/magento2/dev
    docker cp ~/Projects/magento2/generated $(docker-compose ps | grep -e mage2_php | awk '{print $1}'):/magento2/generated
    docker cp ~/Projects/magento2/lib $(docker-compose ps | grep -e mage2_php | awk '{print $1}'):/magento2/lib
    docker cp ~/Projects/magento2/phpserver $(docker-compose ps | grep -e mage2_php | awk '{print $1}'):/magento2/phpserver
    docker cp ~/Projects/magento2/pub $(docker-compose ps | grep -e mage2_php | awk '{print $1}'):/magento2/pub
    docker cp ~/Projects/magento2/setup $(docker-compose ps | grep -e mage2_php | awk '{print $1}'):/magento2/setup
    docker cp ~/Projects/magento2/update $(docker-compose ps | grep -e mage2_php | awk '{print $1}'):/magento2/update
    docker cp ~/Projects/magento2/var $(docker-compose ps | grep -e mage2_php | awk '{print $1}'):/magento2/var
    docker cp ~/Projects/magento2/.htaccess $(docker-compose ps | grep -e mage2_php | awk '{print $1}'):/magento2/.htaccess
    docker cp ~/Projects/magento2/index.php $(docker-compose ps | grep -e mage2_php | awk '{print $1}'):/magento2/index.php
    docker-compose exec -u root -T php chown -R www-data:www-data /magento2/
    echo "Copiou todos os arquivos do host para os containers"
else
    docker cp ~/Projects/magento2/$1 $(docker-compose ps | grep mage2_php | awk '{print $1}'):/magento2/$1
    docker cp ~/Projects/magento2/$1 $(docker-compose ps | grep mage2_nginx | awk '{print $1}'):/magento2/$1
    echo "Copiou todos a pasta $1 do host para os containers"
fi