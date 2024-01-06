all: apply

clear: cleanup

cleanup: delete

apply:
	kubectl apply -f ./00-testing-pod.yaml

delete:
	kubectl delete -f ./00-testing-pod.yaml || true
