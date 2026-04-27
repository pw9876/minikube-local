.PHONY: install start stop reset status deploy undeploy smoke dashboard logs lint

install:
	@./scripts/install.sh

start:
	@./scripts/start.sh

stop:
	@minikube stop

reset:
	@minikube delete

status:
	@minikube status
	@kubectl get nodes,pods -A

deploy:
	@kubectl apply -f manifests/

undeploy:
	@kubectl delete -f manifests/ --ignore-not-found

smoke:
	@./tests/test_cluster.sh

dashboard:
	@minikube dashboard

logs:
	@minikube logs --problems

lint:
	@shellcheck scripts/*.sh tests/*.sh
