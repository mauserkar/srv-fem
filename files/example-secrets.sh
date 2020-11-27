#!/bin/bash
###################### Secrets Vars ########################
# Common
export ENV_USER="$USER"
export ENV_REPO_PATH=""
export ENV_SECRETS_FILE=""

# Mysql
export ENV_MYSQL_SERVER=""
export ENV_MYSQL_USER=""
export ENV_MYSQL_PASSWORD=""

# Wordpress
export ENV_WORDPRESS_DB_DEV=""
export ENV_WORDPRESS_DB_PRD=""
export ENV_WORDPRESS_USER=""
export ENV_WORDPRESS_PASSWORD=""

# NextCloud
export ENV_NEXTCLOUD_DB=""
export ENV_NEXTCLOUD_USER=""
export ENV_NEXTCLOUD_PASSWORD=""

###################### Alias ###############################
alias env_load_vars="source $ENV_REPO_PATH/files/$ENV_SECRETS_FILE"

############################################################
##################### Common ###############################

## View variables
echo "--- Variables ---"
env | grep --color=never "ENV_"

# View Alias
echo "--- Alias ---"
alias | grep --color=never "env_" | awk '{ $1 = "" ; print }' | column -t
echo "env_vars_file_remplace"

# Load Vars on Login
CHECK_ALIAS=$(grep "$ENV_REPO_PATH/$ENV_SECRETS_FILE" /home/$ENV_USER/.bashrc)
if [ -z "$CHECK_ALIAS" ] ; then
    echo ". $ENV_REPO_PATH/$ENV_SECRETS_FILE" >> /home/$ENV_USER/.bashrc
fi

# Remplace files
env_vars_file_remplace() {
    FILES_WITH_SECRETS=$(grep -sl "ENV_" $ENV_REPO_PATH . -R | grep -v "$ENV_SECRETS_FILE")
    for file in $FILES_WITH_SECRETS ; do
        echo "$file"
        env_vars_file $file
    done
}

env_vars_file() {
    FILE=$1
    EXT_REMOVE=$(echo $FILE | cut -f1 -d ".")
    EXT_FILE=$(echo $FILE | cut -f2 -d ".")
    envsubst < $FILE > "$EXT_REMOVE-env-vars-secrets.$EXT_FILE"
}
