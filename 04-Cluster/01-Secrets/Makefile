# Kubernetes Deployment Makefile

include ../common.mk


# ----------------------------------------------------------------

.PHONY: apply
apply:
	# ---
	$(MAKE) -f ../common.mk $@
	@ printf "\n\t--- Deploly Password for Prometheus Exporter ---\n\n";
	@ source ../.env; \
	kubectl create secret generic ndb-cluster-exporter-secrets \
		--from-literal=mysqld-exporter-password=$$MYSQL_EXPORTER_PASSWORD \
		--namespace ndb-cluster || true


.PHONY: delete
delete:
	# ---
	$(MAKE) -f ../common.mk $@
	@ printf "\n\t--- Delete Password for Prometheus Exporter ---\n\n";
	kubectl delete secret ndb-cluster-exporter-secrets --namespace ndb-cluster || true
