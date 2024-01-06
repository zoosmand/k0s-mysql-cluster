all: apply

clear: cleanup

cleanup: delete

apply:
	kubectl apply -f ./00-pv.yaml
	kubectl apply -f ./01-pvc.yaml
	kubectl apply -f ./02-config.yaml
	kubectl apply -f ./03-cluster-data-node-2.yaml
	kubectl apply -f ./03-cluster-data-node-3.yaml

delete:
	kubectl delete -f ./03-cluster-data-node-3.yaml || true
	kubectl delete -f ./03-cluster-data-node-2.yaml || true
	kubectl delete -f ./02-config.yaml || true
	kubectl delete -f ./01-pvc.yaml || true
	kubectl delete -f ./00-pv.yaml || true
