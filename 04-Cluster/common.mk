# Kubernetes Deployment Makefile

ARCH := $$(dpkg --print-architecture)



.PHONY: all
all:
	# ---
	@ echo "It works!"


.PHONY: apply
apply:
	# ---
	@ printf "\n\t--- Caution! Apply ---\n\n";


.PHONY: update
update:
	# ---
	@ printf "\n\t--- Caution! Update ---\n\n";


.PHONY: delete
delete:
	# ---
	@ printf "\n\t--- Caution! Delete ---\n\n";


.PHONY: cleanup
cleanup:
	# ---
	@ printf "\n\t--- Caution! Cleanup ---\n\n";
