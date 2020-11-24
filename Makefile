VAR_FILE ?= ./files/common.vars

install_microk8s:
	sudo snap install microk8s --classic
	sudo usermod -a -G microk8s ${USER}
	sudo chown -f -R ${USER} ~/.kube
	echo 'alias kubectl="microk8s kubectl"' >> ~/.bash_aliases
	echo 'alias env-k8s="source /home/carlos/srv-fem/files/secrets.sh"' >> ~/.bash_aliases
	#su - ${USER}

k8s_env:
	source files/secrets.sh
	@echo "envsubst < ${YML_FILE} | kubectl create -f -"
export_vars:
	cat ${VAR_FILE} | while read var; do export $$var; done
