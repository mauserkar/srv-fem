#!/bin/bash

export ENV_REPO_PATH="/home/$USER/srv-fem"
export ENV_MYSQL_NAME=""
export ENV_MYSQL_DB=""
export ENV_MYSQL_USER=""
export ENV_MYSQL_PASSWORD=""
export ENV_WORDPRESS_DB_HOST=""
export ENV_WORDPRESS_DB_NAME=""
export ENV_WORDPRESS_DB_USER=""
export ENV_WORDPRESS_DB_PASSWORD=""

echo "usage: envsubst < file_with_env_vars.yml | kubectl create -f -"