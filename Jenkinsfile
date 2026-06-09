pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Gopi456/ci-cd-assignment.git'
            }
        }

        stage('Build') {
            steps {
                sh 'cd demo && mvn clean package -DskipTests'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker version'
                sh 'docker build -t ci-cd-app .'
            }
        }

        stage('Deploy') {
            steps {
                sh 'kubectl version --client'
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml'
            }
        }
    }
}
