# Kubernetes Deployment Makefile

include ../common.mk


# ----------------------------------------------------------------

.PHONY: apply
apply:
	# ---
	$(MAKE) -f ../common.mk $@
	@ printf "\n\t--- Deploly MySQL NDB Prometheus Exporter ---\n\n";
	# kubectl create secret generic ndb-cluster-exporter-secrets --from-literal=mysqld-exporter-password=xxxxxx || true
	kubectl apply -f ./00-exporter.yaml


.PHONY: delete
delete:
	# ---
	$(MAKE) -f ../common.mk $@
	@ printf "\n\t--- MySQL NDB Prometheus Exporter ---\n\n";
	kubectl delete -f ./00-exporter.yaml || true
	# kubectl delete secret ndb-cluster-exporter-secrets || true
