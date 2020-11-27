#!/bin/bash
###################### Variables ###########################
# Common
export ENV_USER="$USER"
export ENV_REPO_PATH="/home/$ENV_USER/repos/srv-fem"
# Mysql
export ENV_MYSQL_SERVER=""
export ENV_MYSQL_DB_DEV=""
export ENV_MYSQL_DB_PRO=""
export ENV_MYSQL_USER=""
export ENV_MYSQL_PASSWORD=""
# Wordpress
export ENV_WORDPRESS_DB_HOST=""
export ENV_WORDPRESS_DB_NAME=""
export ENV_WORDPRESS_DB_USER=""
export ENV_WORDPRESS_DB_PASSWORD=""
############################################################
###################### Alias ###############################
alias env-vars="source /home/$USER/repos/srv-fem/files/secrets.sh"



############################################################
## View variables
echo "Variables:"
env | grep "ENV_"
# View Alias
alias

# Usage:
echo "usage: envsubst < file_with_env_vars.yml | command -"