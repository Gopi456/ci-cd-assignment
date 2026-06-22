# CI/CD Pipeline Implementation using GitHub, Jenkins, Docker and Kubernetes (AKS)

## Overview

This project demonstrates an end-to-end Continuous Integration and Continuous Deployment (CI/CD) pipeline implementation using GitHub, Jenkins, Maven, Docker, Docker Hub, and Azure Kubernetes Service (AKS).

The main objective of this project is to automate the software delivery process by automatically building, packaging, containerizing, and deploying a Spring Boot application into a Kubernetes cluster whenever code changes are pushed to GitHub.

This project was developed as part of the DevOps Engineer Internship Assignment.

---

# Architecture Diagram


                 Developer
                    |
                    |
              Git Push / Commit
                    |
                    |
              GitHub Repository
                    |
                    |
        GitHub Webhook Trigger
                    |
                    |
              Jenkins Server
                    |
                    |
          Jenkins Declarative Pipeline
                    |
     -----------------------------------
     |                |                |
     |                |                |
 Maven Build     Docker Build     Docker Push
     |                |                |
     |                |                |
 Spring Boot      Container       Docker Hub
 Artifact         Image              |
                                      |
                                      |
                              Kubernetes Deployment
                                      |
                                      |
                                Azure AKS Cluster
                                      |
                          -----------------------
                          |                     |
                       Pod 1                 Pod 2
                          |
                          |
                    Kubernetes Service
                          |
                          |
                  Application Access


---

# CI/CD Workflow

1. Developer writes application code.

2. Code changes are pushed to GitHub repository.

3. GitHub Webhook sends an event notification to Jenkins.

4. Jenkins automatically starts the pipeline.

5. Jenkins checks out the latest source code.

6. Maven builds the Spring Boot application.

7. Jenkins creates a Docker image.

8. Docker image is pushed to Docker Hub.

9. Jenkins deploys the application into Azure Kubernetes Service (AKS).

10. Kubernetes creates pods and exposes the application using Kubernetes Service.

11. Application availability is verified.

---

# Technology Stack

| Component | Technology |
|---|---|
| Version Control | Git, GitHub |
| CI/CD Tool | Jenkins |
| Pipeline Script | Groovy |
| Build Tool | Maven |
| Programming Language | Java 17 |
| Framework | Spring Boot |
| Containerization | Docker |
| Container Registry | Docker Hub |
| Container Orchestration | Kubernetes |
| Cloud Platform | Microsoft Azure AKS |
| IDE | VS Code |

---

# Repository Structure

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


---

# Jenkinsfile

```groovy
pipeline {

agent any


stages {


stage('Checkout') {

steps {

git branch: 'main',
url: 'https://github.com/Gopi456/ci-cd-assignment.git'

}

}


stage('Build Maven App') {

steps {

sh '''

cd demo

mvn clean package -DskipTests

'''

}

}


stage('Docker Build') {

steps {

sh '''

docker build -t gopireddy456/ci-cd-app:latest .

'''

}

}


stage('Push Docker Image') {

steps {

sh '''

docker push gopireddy456/ci-cd-app:latest

'''

}

}


stage('Deploy AKS') {

steps {

sh '''

kubectl apply -f deployment.yaml

kubectl apply -f service.yaml

'''

}

}


stage('Verify Deployment') {

steps {

sh '''

kubectl get pods

kubectl get svc

'''

}

}


}

}

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
## Validation result

| Validation                 | Status |
| -------------------------- | ------ |
| GitHub Integration         | Passed |
| GitHub Webhook Trigger     | Passed |
| Jenkins Pipeline Execution | Passed |
| Maven Build                | Passed |
| JAR Generation             | Passed |
| Docker Image Creation      | Passed |
| Docker Hub Push            | Passed |
| AKS Deployment             | Passed |
| Kubernetes Verification    | Passed |
| Application Testing        | Passed |

---

##  Final Pipeline Flow 

GitHub Commit

      ↓

Webhook Trigger

      ↓

Jenkins Pipeline

      ↓

Maven Build

      ↓

Docker Image Build

      ↓

Docker Hub Push

      ↓

AKS Kubernetes Deployment

      ↓

Pod Verification

      ↓

Application Running
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


<img width="959" height="482" alt="image" src="https://github.com/user-attachments/assets/473f8feb-c309-4ab2-9a92-ec7b1687e6d4" />
<img width="959" height="446" alt="image" src="https://github.com/user-attachments/assets/9ecf40c7-df2a-4910-8fa9-cab3464f4a23" />




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

## Cloud-Azure 
<img width="959" height="442" alt="image" src="https://github.com/user-attachments/assets/34e86ea7-4c45-4e2c-aae6-b83a8ebb0a92" />

## Verification
<img width="959" height="484" alt="image" src="https://github.com/user-attachments/assets/2a1e557e-07c4-4de1-b83b-c40edd14dfb8" />



---

Project Outcome

Successfully implemented a complete CI/CD automation workflow.

The project achieved:

Automated GitHub to Jenkins integration.
Automated application build process.
Automated Docker image creation.
Automated Docker Hub image publishing.
Automated Kubernetes deployment.
Reduced manual deployment effort.
Demonstrated real-world DevOps practices.


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
