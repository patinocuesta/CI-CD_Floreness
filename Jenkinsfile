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
        sh "docker image prune -fa"
        deleteDir()
      }
    }
    stage('Docker Purge') {
      steps {
        sh 'docker stop $(docker ps -a -q)'
        sh 'docker rm $(docker ps -a -q)'
      }
     }
     stage('Running test') {
      steps {
        sh 'docker run -d -p 8090:80 patinodonato/nginx-flore'
      }
    }
  }
}
