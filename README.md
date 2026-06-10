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

![CI/CD Architecture](docs/architecture-diagram.jpeg)

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

Insert screenshot here.

---

### Jenkins Console Output

Insert screenshot here.

---

### Docker Build Output

Insert screenshot here.

---

### Docker Images

Insert screenshot here.

---

### Kubernetes Cluster

Insert screenshot here.

---

### GitHub Repository

Insert screenshot here.

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
