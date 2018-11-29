NS ?= efk

create:
	kubectl create -f efk-ns.yaml
	kubectl create -f gluster-ep.yaml
	kubectl create -f gluster-pv.yaml
	kubectl create -f gluster-pvc.yaml
	kubectl create -f elasticsearch-service.yaml
	kubectl create -f elasticsearch-deployment.yaml
	@# kubectl create -f kapacitor-deployment.yaml
	@# kubectl create -f chronograf-deployment.yaml
	@# kubectl create -f influxdb-deployment.yaml
	@# kubectl create -f influxdb-service.yaml
	@# kubectl create -f telegraf-DaemonSet.yaml
	@# kubectl create -f chronograf-service.yaml
	@# kubectl create -f ingress-chronograf.yaml

delete:
	-kubectl delete -f elasticsearch-deployment.yaml
	-kubectl delete -f elasticsearch-service.yaml
	-kubectl delete -f gluster-pvc.yaml
	-kubectl delete -f gluster-pv.yaml
	-kubectl delete -f gluster-ep.yaml
	-kubectl delete -f efk-ns.yaml

get:
	kubectl -n ${NS} get pods,deploy,rs,ds,ep,pv,pvc,ingress,svc,configmaps -o wide
