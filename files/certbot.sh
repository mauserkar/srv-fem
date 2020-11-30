#!/bin/bash
set -x

. /home/ubuntu/repos/srv-fem/files/prd-env-vars-secrets.sh

docker service rm common-stack_proxy

#sleep port 80 disponiblity 
sleep 10 

docker run -it --rm --name certbot \
    -v "$ENV_REPO_PATH/data/data-certificates/certs:/etc/letsencrypt" \
    -v "$ENV_REPO_PATH/data/data-certificates/letsencrypt:/var/lib/letsencrypt" \
    -p 80:80 \
    -p 443:443 \
    certbot/certbot certonly \
        --standalone \
        --preferred-challenges http \
        -d $ENV_DOMAIN \
        -d www.$ENV_DOMAIN \
        -d dev.$ENV_DOMAIN \
        -d www.dev.$ENV_DOMAIN \
        -d www.cloud.$ENV_DOMAIN \
        -d cloud.$ENV_DOMAIN \
        --non-interactive \
        --agree-tos \
        -m $ADMIN_EMAIL 

docker stack deploy -c $ENV_REPO_PATH/swarm/common-stack-env-vars-secrets.yml common-stack
