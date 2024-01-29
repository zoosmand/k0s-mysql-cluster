all: apply

clear: cleanup

cleanup: delete

apply:
	# kubectl apply -f ./00-namespace.yaml
	$(MAKE) -C ./00-requisites
	$(MAKE) -C ./01-MysqlClusterDiscoveryService
	# $(MAKE) -C ./02-MysqlClusterManager
	# $(MAKE) -C ./03-MysqlClusterDataNode
	# $(MAKE) -C ./04-MysqlServer
	# $(MAKE) -C ./05-MysqlExporter

delete:
	$(MAKE) -C ./05-MysqlExporter delete
	$(MAKE) -C ./04-MysqlServer delete
	$(MAKE) -C ./03-MysqlClusterDataNode delete
	$(MAKE) -C ./02-MysqlClusterManager delete
	$(MAKE) -C ./01-MysqlClusterDiscoveryService delete
	$(MAKE) -C ./00-requisites delete
	# kubectl delete -f ./00-namespace.yaml || true
