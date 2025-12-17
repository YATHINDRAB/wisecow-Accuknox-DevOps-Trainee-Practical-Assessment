# Cow wisdom web server

## Prerequisites

```
sudo apt install fortune-mod cowsay -y
```

## How to use?

1. Run `./wisecow.sh`
2. Point the browser to server port (default 4499)

## What to expect?
![wisecow](https://github.com/nyrahul/wisecow/assets/9133227/8d6bfde3-4a5a-480e-8d55-3fef60300d98)

# Problem Statement
Deploy the wisecow application as a k8s app

## Requirement
1. Create Dockerfile for the image and corresponding k8s manifest to deploy in k8s env. The wisecow service should be exposed as k8s service.
2. Github action for creating new image when changes are made to this repo
3. [Challenge goal]: Enable secure TLS communication for the wisecow app.

## Expected Artifacts
1. Github repo containing the app with corresponding dockerfile, k8s manifest, any other artifacts needed.
2. Github repo with corresponding github action.
3. Github repo should be kept private and the access should be enabled for following github IDs: nyrahul




# Accuknox DevOps Trainee Practical Assessment

This repository contains my submission for the **Accuknox DevOps Trainee Practical Assessment**, showcasing containerization, Kubernetes deployment, CI/CD automation, TLS security, and system automation.

---

## 🔹 Problem Statement 1: Wisecow Application

### Features Implemented
- Dockerized the **Wisecow** application using a custom Dockerfile
- Deployed the application on **Kubernetes (Minikube/Kind)**
- Exposed the app using Kubernetes Service and Ingress
- Enabled **TLS (HTTPS)** for secure communication
- Implemented **CI/CD using GitHub Actions** to:
  - Build and push Docker images automatically
  - Deploy updated images to the Kubernetes cluster

---

## 🔹 Tech Stack
- Docker
- Kubernetes
- GitHub Actions
- Ingress + TLS
- Bash & Python
- KubeArmor (Optional)

---

## 🔹 Problem Statement 2: Automation Scripts

Implemented **two automation scripts**:

1. **System Health Monitoring (Bash)**  
   - Monitors CPU, memory, and disk usage  
   - Alerts when thresholds are exceeded  

2. **Application Health Checker (Python)**  
   - Checks application uptime using HTTP status codes  
   - Reports whether the application is UP or DOWN  

---

## 🔹 Problem Statement 3 (Optional): KubeArmor

- Implemented a **zero-trust KubeArmor policy**
- Applied the policy to the Wisecow workload
- Captured and committed a screenshot of policy violations

---

## 📁 Key Files
```text
Dockerfile
k8s/                # Kubernetes manifests
.github/workflows/  # CI/CD pipeline
scripts/            # Automation scripts
kubearmor/          # Zero-trust policy & screenshot
