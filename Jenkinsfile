pipeline {
  environment {
    project = "testdocker"
    version = "${BUILD_NUMBER}"
    docker_image = "$project:$version"
    awsurl = "https://996189696326.dkr.ecr.us-east-1.amazonaws.com/jenkins-test-image"
    awsCred = 'ecr:us-east-1:awscredential'

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
          dockerImage = docker.build ('$docker_image')
        }
      }
    }


    stage('Push Image') {
      steps{
        script {
          docker.withRegistry(awsurl,awsCred) {
            docker.image(docker_image).push()
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