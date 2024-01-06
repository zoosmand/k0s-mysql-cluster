all: apply

clear: cleanup

cleanup: delete

apply:
	kubectl apply -f ./00-config.yaml
	kubectl apply -f ./01-cluster-manager.yaml

delete:
	kubectl delete -f ./01-cluster-manager.yaml || true
	kubectl delete -f ./00-config.yaml || true
