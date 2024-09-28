# Kubernetes Deployment Makefile

include ../common.mk


.PHONY: apply
apply: \
	apply_ss


.PHONY: delete
delete: \
	delete_ss

# ----------------------------------------------------------------

.PHONY: apply_pod
apply_pod:
	# ---
	$(MAKE) -f ../common.mk apply
	@ printf "\n\t--- Deploly testing pod ---\n\n";
	kubectl apply -f ./00-testing-pod.yaml


.PHONY: delete_pod
delete_pod:
	# ---
	$(MAKE) -f ../common.mk delete
	@ printf "\n\t--- Delete testing pod ---\n\n";
	kubectl delete -f ./00-testing-pod.yaml

# ----------------------------------------------------------------

.PHONY: apply_ss
apply_ss:
	# ---
	$(MAKE) -f ../common.mk apply
	@ printf "\n\t--- Deploly testing statefulset ---\n\n";
	kubectl apply -f ./01-testing-statefulset.yaml


.PHONY: delete_ss
delete_ss:
	# ---
	$(MAKE) -f ../common.mk delete
	@ printf "\n\t--- Delete testing statefulset ---\n\n";
	kubectl delete -f ./01-testing-statefulset.yaml
