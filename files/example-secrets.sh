#!/bin/bash
###################### Variables ###########################
# Common
export ENV_USER="$USER"
export ENV_REPO_PATH="/home/$ENV_USER/repos/srv-fem"
# Mysql
export ENV_MYSQL_SERVER=""
export ENV_MYSQL_USER=""
export ENV_MYSQL_PASSWORD=""
# Wordpress
export ENV_WORDPRESS_DB_DEV=""
export ENV_WORDPRESS_DB_PRD=""
export ENV_WORDPRESS_USER=""
export ENV_WORDPRESS_PASSWORD=""
############################################################
###################### Alias ###############################
alias env-vars="source /home/$USER/repos/srv-fem/files/secrets.sh"



############################################################
## View variables
echo "Variables:"
env | grep "ENV_"
# View Alias
alias

# Remplace files
env_vars_files() {
    grep "ENV_" $ENV_REPO_PATH . -R | while read file; do env_vars() $file; done
}
env_vars() {
    FILE=$1
    WITHOUT_EXT_FILE=$(echo $FILE | cut -f1 -d ".")
    EXT_FILE=$(echo $FILE | cut -f2 -d ".")
    envsubst < $path > "$WITHOUT_EXT_FILE-secrets-.$EXT_FILE"
}

# Usage
echo "usage: envsubst < file_with_env_vars.yml | command -"