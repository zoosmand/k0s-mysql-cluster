# Kubernetes Deployment Makefile

include ../common.mk


# ----------------------------------------------------------------

.PHONY: apply
apply:
	# ---
	$(MAKE) -f ../common.mk $@
	@ printf "\n\t--- Deploly MySQL NDB Cluster Manager ---\n\n";
	kubectl apply -f ./00-config.yaml
	kubectl apply -f ./01-cluster-manager.yaml


.PHONY: delete
delete:
	# ---
	$(MAKE) -f ../common.mk $@
	@ printf "\n\t--- MySQL NDB Cluster Manager ---\n\n";
	kubectl delete -f ./01-cluster-manager.yaml || true
	kubectl delete -f ./00-config.yaml || true
