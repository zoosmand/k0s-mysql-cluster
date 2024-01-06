all: apply

clear: cleanup

cleanup: delete

apply:
	kubectl apply -f ./00-secret.yaml
	kubectl apply -f ./01-exporter.yaml

delete:
	kubectl delete -f ./01-exporter.yaml || true
	kubectl delete -f ./00-secret.yaml || true
