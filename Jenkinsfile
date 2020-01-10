pipeline {
  environment {
    registry = "patinodonato/nginx-flore"
    registryCredential = 'dockerhub-patinodonato'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/patinocuesta/CI-CD_Floreness.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          cd /home/ubuntu/docker
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}
