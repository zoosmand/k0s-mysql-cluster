all: apply

clear: cleanup

cleanup: delete

apply:
	kubectl apply -f ./00-pv.yaml
	kubectl apply -f ./01-pvc.yaml
	kubectl apply -f ./02-config.yaml
	kubectl apply -f ./03-cluster-server-mp1.yaml
	kubectl apply -f ./04-cluster-server-mp8.yaml

delete:
	kubectl delete -f ./04-clutest-server-mp8.yaml || true
	kubectl delete -f ./03-clutest-server-mp1.yaml || true
	kubectl delete -f ./02-config.yaml || true
	kubectl delete -f ./01-pvc.yaml || true
	kubectl delete -f ./00-pv.yaml || true
