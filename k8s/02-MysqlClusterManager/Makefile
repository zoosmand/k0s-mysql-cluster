all: apply

clear: cleanup

cleanup: delete

apply:
	kubectl apply -f ./00-config.yaml
	kubectl apply -f ./01-cluster-manager-mp1.yaml
	kubectl apply -f ./02-cluster-manager-mp8.yaml

delete:
	kubectl delete -f ./02-cluster-manager-mp8.yaml || true
	kubectl delete -f ./01-cluster-manager-mp1.yaml || true
	kubectl delete -f ./00-config.yaml || true
