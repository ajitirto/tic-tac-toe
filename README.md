
# Tic-Tac-Toe Application Deployment

This repository contains a Helm chart and Docker setup for deploying the **Tic-Tac-Toe** application. The app can be tested using Docker, Minikube, and Helm to deploy it on a local Kubernetes cluster.

## Prerequisites

Before you begin, ensure you have the following tools installed:
- Docker
- Minikube
- kubectl
- Helm

If not, you can follow the official installation guides for these tools.

## Docker Setup

### Build the Docker Image

1. **Build the Docker image** with the following command:

   ```bash
   docker build -t ajitirto/tic-tac-toe:2.0 -f Dockerfile.prod .
   ```

2. **Run the Docker container**:

   ```bash
   docker run -p 3031:3000 ajitirto/tic-tac-toe:2.0
   ```

   This will start the application on port `3000` inside the container and map it to port `3031` on the host.

### Test the Docker Container

You can test the application by visiting `http://localhost:3031` in your browser.

---

## Minikube Setup

### Start Minikube

1. **Start Minikube**:

   ```bash
   minikube start
   ```

   This starts a local Kubernetes cluster using Minikube.

### Apply Kubernetes Manifests

2. **Apply the deployment** and **service** manifests:

   ```bash
   kubectl apply -f k8s/deployment.yaml
   kubectl apply -f k8s/service.yaml
   ```

   This deploys the Tic-Tac-Toe application to the local Kubernetes cluster and exposes it as a service.

### Test the Minikube Deployment

You can test the deployment by accessing the service through Minikube's IP and the NodePort:

1. **Get the Minikube IP and NodePort**:

   ```bash
   curl http://$(minikube ip):$(kubectl get svc tic-tac-toe-service -o=jsonpath='{.spec.ports[0].nodePort}')
   ```

2. If you are using **Ingress** for routing, update your `/etc/hosts` file:

   ```bash
   echo "$(minikube ip) tic-tac-toe.local" | sudo tee -a /etc/hosts
   ```

3. Finally, access the app via the **Ingress** URL:

   ```bash
   curl http://tic-tac-toe.local
   ```

---

## Helm Setup

### Lint the Helm Chart

1. **Lint the Helm chart** to check for any issues:

   ```bash
   helm lint helm/
   ```

### Install the Helm Chart

2. **Install the Helm chart** to deploy the application in Kubernetes:

   ```bash
   helm install tic-tac-toe helm/
   ```

   This will install the Tic-Tac-Toe application as a release called `tic-tac-toe`.

### Check the Helm Deployment

3. **Check the status of the Helm deployment**:

   ```bash
   helm list
   ```

   You should see the `tic-tac-toe` release listed with the status `deployed`.

---

## Directory Structure

```
.
├── k8s/
│   ├── deployment.yaml  # Kubernetes Deployment manifest
│   └── service.yaml     # Kubernetes Service manifest
├── helm/
│   ├── Chart.yaml       # Helm Chart metadata
│   ├── values.yaml      # Helm values for customization
│   ├── deployment.yaml  # Helm Deployment template
│   ├── ingress.yaml     # Helm Ingress template
│   └── service.yaml     # Helm Service template
├── Dockerfile.prod      # Dockerfile for production build
└── README.md            # This documentation
```

---

## Conclusion

You can deploy and test the Tic-Tac-Toe application locally using Docker, Minikube, or Helm on Kubernetes. This allows for flexible development and testing environments depending on your needs.

---

# React + Vite

This template provides a minimal setup to get React working in Vite with HMR and some ESLint rules.

Currently, two official plugins are available:

- [@vitejs/plugin-react](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react/README.md) uses [Babel](https://babeljs.io/) for Fast Refresh
- [@vitejs/plugin-react-swc](https://github.com/vitejs/vite-plugin-react-swc) uses [SWC](https://swc.rs/) for Fast Refresh
