pipeline {

agent any


environment {

DOCKER_IMAGE="gopireddy456/ci-cd-app:latest"

}


triggers {

githubPush()

}


stages {


stage('Checkout'){

steps{

git 'https://github.com/Gopi456/ci-cd-assignment.git'

}

}



stage('Build Maven App'){

steps{

sh '''

cd demo

mvn clean package -DskipTests

'''

}

}




stage('Docker Build'){


steps{

sh '''

docker build -t $DOCKER_IMAGE .

'''

}

}




stage('Push Image'){


steps{


withCredentials([usernamePassword(

credentialsId:'dockerhub-creds',

usernameVariable:'USER',

passwordVariable:'PASS'

)]){


sh '''

echo $PASS | docker login -u $USER --password-stdin

docker push $DOCKER_IMAGE

'''

}


}

}





stage('Deploy AKS'){


steps{


withCredentials([file(

credentialsId:'kubeconfig',

variable:'KUBECONFIG'

)]){


sh '''

kubectl apply -f deployment.yaml

kubectl apply -f service.yaml


'''

}


}

}



stage('Verify'){


steps{


sh '''

kubectl get pods

kubectl get svc

'''


}


}



}


post{


success{

echo "Deployment Successful"

}


failure{

echo "Pipeline Failed"

}


}

}
