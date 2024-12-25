# docker 
# docker build -t ajitirto/tic-tac-toe:2.0 -f Dockerfile.prod .
# docker run -p 3031:3000 ajitirto/tic-tac-toe:2.0

# minikube
# minikube start 
# kaf k8s/deployment.yaml
# kaf k8s/service.yaml

curl http://$(minikube ip):$(kubectl get svc tic-tac-toe-service -o=jsonpath='{.spec.ports[0].nodePort}')

# use ingress
echo "$(minikube ip) tic-tac-toe.local" | sudo tee -a /etc/hosts 

curl http://tic-tac-toe.local

# helm 
# helm lint helm/
# helm install tic-tac-toe helm/ 

# ╰─❯ helm list                                                                                                       ─╯
# NAME       	NAMESPACE	REVISION	UPDATED                                	STATUS  	CHART                  	APP VERSION
# tic-tac-toe	default  	1       	2024-12-25 16:28:24.722780754 +0700 WIB	deployed	tic-tac-toe-chart-0.1.0	1.0        
