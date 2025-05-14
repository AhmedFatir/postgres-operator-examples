all:
	@kubectl apply -k kustomize/install/namespace
	@kubectl apply --server-side -k kustomize/install/default
	@kubectl apply -k kustomize/postgres

clean:
	@kubectl delete -k kustomize/postgres --ignore-not-found
	@kubectl delete -k kustomize/install/default --ignore-not-found
	@kubectl delete -k kustomize/install/namespace --ignore-not-found