pipeline {
  environment {
    project = "996189696326.dkr.ecr.us-east-1.amazonaws.com/jenkins-test-image"
    version = "3.0"
    docker_image = "$project:$version"
    awsurl = "https://996189696326.dkr.ecr.us-east-1.amazonaws.com/jenkins-test-image"
    awsCred = 'ecr:us-east-1:awscredentials'

  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/hieupt13/Integrate-GitHub-with-Jenkins.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build  "$docker_image"

        }
      }
    }


    stage('Push Image') {
      steps{
        script {
          docker.withRegistry(awsurl,awsCred) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $docker_image"
      }
    }
  }
}