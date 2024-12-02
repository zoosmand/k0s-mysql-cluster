# Kubernetes Deployment Makefile


.PHONY: all
all:
	# ---
	@ echo "It works!"


.PHONY: apply
apply:
	# $(MAKE) -C ./00-Common apply
	# $(MAKE) -C ./01-Secrets apply
	# $(MAKE) -C ./02-Storage apply
	# $(MAKE) -C ./03-Manager apply
	# $(MAKE) -C ./04-DataNode apply
	# $(MAKE) -C ./05-Server apply
	$(MAKE) -C ./06-Balancer apply
	# $(MAKE) -C ./07-PrometheusExporter apply


.PHONY: update
update:
	# $(MAKE) -C ./00-Common update
	# $(MAKE) -C ./01-Secrets update
	# $(MAKE) -C ./02-Storage update
	# $(MAKE) -C ./03-Manager update
	# $(MAKE) -C ./04-DataNode update
	# $(MAKE) -C ./05-Server update
	# $(MAKE) -C ./06-Balancer update
	# $(MAKE) -C ./07-PrometheusExporter update


.PHONY: delete
delete:
	# $(MAKE) -C ./07-PrometheusExporter delete
	$(MAKE) -C ./06-Balancer delete
	# $(MAKE) -C ./05-Server delete
	# $(MAKE) -C ./04-DataNode delete
	# $(MAKE) -C ./03-Manager delete
	# $(MAKE) -C ./02-Storage delete
	# $(MAKE) -C ./01-Secrets delete
	# $(MAKE) -C ./00-Common delete


.PHONY: cleanup
cleanup:
	# $(MAKE) -C ./07-PrometheusExporter cleanup
	# $(MAKE) -C ./06-Balancer cleanup
	# $(MAKE) -C ./05-Server cleanup
	# $(MAKE) -C ./04-DataNode cleanup
	# $(MAKE) -C ./03-Manager cleanup
	# $(MAKE) -C ./02-Storage cleanup
	# $(MAKE) -C ./01-Secrets cleanup
	# $(MAKE) -C ./00-Common cleanup
