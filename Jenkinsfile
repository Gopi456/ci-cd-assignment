pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "gopireddy456/ci-cd-app:latest"
    }

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
                    docker build -t $DOCKER_IMAGE .
                '''
            }
        }

        stage('Push Image') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {
                    sh '''
                        echo $PASS | docker login -u $USER --password-stdin
                        docker push $DOCKER_IMAGE
                    '''
                }
            }
        }

    stage('Deploy AKS') {

    steps {

        withCredentials([
            file(credentialsId: 'azure-sp', variable: 'AZURE_SP')
        ]) {

            sh '''
            
            az login --service-principal \
            -u $(cat $AZURE_SP | jq -r .clientId) \
            -p $(cat $AZURE_SP | jq -r .clientSecret) \
            --tenant $(cat $AZURE_SP | jq -r .tenantId)


            az aks get-credentials \
            --resource-group cicd-demo-rg \
            --name cicd-aks \
            --overwrite-existing


            kubectl apply -f deployment.yaml

            '''

        }
    }
}
        stage('Verify') {
            steps {
                sh '''
                    kubectl get pods
                    kubectl get svc
                '''
            }
        }
    }

    post {
        success {
            echo "Deployment Successful"
        }
        failure {
            echo "Pipeline Failed"
        }
    }
}