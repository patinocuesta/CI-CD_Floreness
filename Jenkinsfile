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
          dockerImage = docker.build registry
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
        sh "docker rmi $registry"
      }
    }
    stage('Docker Purge') {
      steps {
        sh "docker image prune -fa"
        deleteDir()
      }
     }
     stage('Test') {
      steps {
        sh 'docker run -d -p 8090:80 patinodonato/nginx-flore'
      }
    }
  }
}
