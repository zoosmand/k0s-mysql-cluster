# Kubernetes Deployment Makefile

include ../common.mk


# ----------------------------------------------------------------

.PHONY: apply
apply:
	# ---
	$(MAKE) -f ../common.mk $@
	@ printf "\n\t--- Deploly MySQL NDB Data Node ---\n\n";
	kubectl apply -f ./00-config.yaml
	kubectl apply -f ./01-server.yaml


.PHONY: delete
delete:
	# ---
	$(MAKE) -f ../common.mk $@
	@ printf "\n\t--- MySQL NDB Data Node ---\n\n";
	kubectl delete -f ./01-server.yaml || true
	kubectl delete -f ./00-config.yaml || true
