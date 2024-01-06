all: apply

clear: cleanup

cleanup: delete

apply:
	kubectl apply -f ./00-discovery-service.yaml

delete:
	kubectl delete -f ./00-discovery-service.yaml || true
