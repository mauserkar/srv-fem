VAR_FILE ?= ./files/common.vars

install_microk8s:
	sudo snap install microk8s --classic
	sudo usermod -a -G microk8s ${USER}
	sudo chown -f -R ${USER} ~/.kube
	echo 'alias kubectl="microk8s kubectl"' >> ~/.bash_aliases
	#su - ${USER}

export_vars:
	cat ${VAR_FILE} | while read var; do export $$var; done
