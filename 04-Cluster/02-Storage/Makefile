# Kubernetes Deployment Makefile

include ../common.mk


.PHONY: apply
apply:
	# ---
	$(MAKE) -f ../common.mk $@
	@ printf "\n\t--- Deploly persistent storage and claim ---\n\n";
	kubectl apply -f ./00-pv.yaml
	kubectl apply -f ./01-pvc.yaml


.PHONY: delete
delete:
	# ---
	$(MAKE) -f ../common.mk $@
	@ printf "\n\t--- Delete persistent storage and claim ---\n\n";
	kubectl delete -f ./01-pvc.yaml
	kubectl delete -f ./00-pv.yaml
