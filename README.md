# CI/CD Pipeline Setup using Git, Jenkins, Docker and Kubernetes

## Overview

This project demonstrates the implementation of a Continuous Integration and Continuous Deployment (CI/CD) pipeline using GitHub, Jenkins, Maven, Docker, and Kubernetes (Minikube).

The pipeline automatically performs:

* Source code checkout from GitHub
* Maven build execution
* Spring Boot artifact generation
* Docker image creation
* Kubernetes deployment preparation

The solution was developed as part of a DevOps Engineer Internship Assignment.

---

## Architecture Diagram

<img width="334" height="1600" alt="WhatsApp Image 2026-06-10 at 12 56 47 PM" src="https://github.com/user-attachments/assets/0380a2c9-9571-4d88-8006-e179d6c2cd23" />


### Workflow

1. Developer pushes code to GitHub.
2. Jenkins automatically triggers the pipeline.
3. Jenkins checks out source code.
4. Maven builds the application.
5. Docker creates a container image.
6. Docker image becomes available for deployment.
7. Kubernetes (Minikube) deploys the application.
8. Application becomes accessible through Kubernetes Service.

---

## Technology Stack

| Component         | Technology            |
| ----------------- | --------------------- |
| Version Control   | Git, GitHub           |
| CI/CD Tool        | Jenkins               |
| Build Tool        | Maven                 |
| Language          | Java 17               |
| Framework         | Spring Boot           |
| Containerization  | Docker                |
| Orchestration     | Kubernetes (Minikube) |
| Pipeline Language | Groovy                |
| IDE               | VS Code               |

---

## Repository Structure

```text
CI-CD-Assignment/
│
├── demo/
│   ├── src/
│   ├── pom.xml
│
├── Dockerfile
│
├── deployment.yaml
│
├── Jenkinsfile
│
├── README.md
│
└── docs/
    └── architecture-diagram.jpeg
```

---

## Jenkins Pipeline

The Jenkins pipeline is implemented using Groovy.

### Pipeline Stages

### 1. Checkout

Fetches the latest code from GitHub repository.

### 2. Build

Builds the Spring Boot application using Maven.

```bash
mvn clean package -DskipTests
```

### 3. Docker Build

Creates a Docker image from the generated JAR.

```bash
docker build -t ci-cd-app .
```

### 4. Deployment

Deploys application resources to Kubernetes.

```bash
kubectl apply -f deployment.yaml
```

---

## Jenkinsfile

```groovy
pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/Gopi456/ci-cd-assignment.git'
            }
        }

        stage('Build') {
            steps {
                sh 'cd demo && mvn clean package -DskipTests'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t ci-cd-app .'
            }
        }
    }
}
```

---

## Docker Build Verification

Docker image successfully generated:

```bash
docker images
```

Output:

```text
REPOSITORY    TAG      IMAGE ID
ci-cd-app     latest   <image-id>
```

---

## Kubernetes Verification

Cluster verification:

```bash
kubectl get nodes
```

Output:

```text
NAME       STATUS   ROLES
minikube   Ready    control-plane
```

Deployment verification:

```bash
kubectl apply -f deployment.yaml
```

Output:

```text
deployment.apps/ci-cd-app configured
```

---

## Build Validation

| Validation Item                 | Status |
| ------------------------------- | ------ |
| GitHub Checkout                 | Passed |
| Maven Build                     | Passed |
| JAR Creation                    | Passed |
| Docker Image Build              | Passed |
| Jenkins Pipeline Execution      | Passed |
| Kubernetes Cluster Verification | Passed |
| Deployment Manifest Validation  | Passed |

---

## Security Considerations

* Source code managed through Git version control.
* Jenkins pipeline automation reduces manual intervention.
* Docker containers provide isolated execution environments.
* Infrastructure configuration maintained as code.
* Deployment manifests version controlled.
* Jenkins credentials can be stored securely using Jenkins Credentials Manager.

---

## Monitoring Recommendations

For production-grade implementation:

* Prometheus
* Grafana
* ELK Stack
* Jenkins Monitoring Plugin
* Kubernetes Health Probes
* AlertManager Notifications

---

## Screenshots

### Jenkins Build Success

<img width="1600" height="798" alt="WhatsApp Image 2026-06-10 at 11 40 54 AM" src="https://github.com/user-attachments/assets/8706174a-9b2d-4829-bfda-a2b3fee63e3c" />




---

### Jenkins Console Output

<img width="1600" height="855" alt="image" src="https://github.com/user-attachments/assets/7a17723e-c18f-4129-a8f0-852c73efe290" />


---

### Docker Build Output

<img width="1440" height="552" alt="image" src="https://github.com/user-attachments/assets/6d4fa579-2880-488a-b454-2673ce3d3f65" />

---

### Docker Images

<img width="478" height="88" alt="image" src="https://github.com/user-attachments/assets/bdf89730-1061-4f1e-b5fa-ef40e053adb3" />


---

### Kubernetes Cluster

<img width="1452" height="805" alt="image" src="https://github.com/user-attachments/assets/b17aaac7-d5e2-487f-bbb3-d31f45eaf476" />
<img width="1345" height="540" alt="image" src="https://github.com/user-attachments/assets/f87d80a7-8946-4675-9e2a-554b9b05026f" />
<img width="1600" height="819" alt="image" src="https://github.com/user-attachments/assets/2fd40732-f76c-4e60-be89-7253631b9b01" />


---

### GitHub Repository

<img width="959" height="466" alt="image" src="https://github.com/user-attachments/assets/2afa4c86-8f76-41e6-b58f-b9ffe4bb39b9" />


---

## Project Outcome

Successfully implemented a CI/CD pipeline that:

* Automates application build process.
* Generates deployable artifacts.
* Creates Docker images automatically.
* Integrates GitHub with Jenkins.
* Supports Kubernetes deployment workflows.
* Demonstrates DevOps automation using industry-standard tools.

---

## GitHub Repository

Repository Link:

https://github.com/Gopi456/ci-cd-assignment

---

## Author

**Adapa Gopi Reddy**

B.Tech – Computer Science & Engineering (AI & ML)

DevOps & Cloud Enthusiast

GitHub: https://github.com/Gopi456

CI/CD Webhook testing