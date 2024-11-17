# Kubernetes Deployment Makefile

include ../common.mk


.PHONY: apply
apply:
	# ---
	$(MAKE) -f ../common.mk $@
	@ printf "\n\t--- Deploly namespace ---\n\n";
	kubectl apply -f ./00-namespace.yaml


.PHONY: delete
delete:
	# ---
	$(MAKE) -f ../common.mk $@
	@ printf "\n\t--- Delete namespace ---\n\n";
	kubectl delete -f ./00-namespace.yaml || true
