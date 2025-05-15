all:
	@kubectl apply -k kustomize/install/namespace
	@kubectl apply --server-side -k kustomize/install/default
	@kubectl apply -k kustomize/high-availability

clean:
	@kubectl delete -k kustomize/high-availability --ignore-not-found
	@kubectl delete -k kustomize/install/default --ignore-not-found
	@kubectl delete -k kustomize/install/namespace --ignore-not-found

# kubectl get secret expcluster-pgbouncer -n postgres-operator --template='{{index .data "pgbouncer-password" | base64decode}}'
# psql -U _crunchypgbouncer -h expcluster-pgbouncer.postgres-operator.svc pgbouncer