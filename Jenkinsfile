pipeline {
    agent any
    stages {
        stage("Checkout code") {
            steps {
              checkout scm
            }
        }
        stage("Build project") {
            steps {
              script {
                sh 'go build -o helloworld main.go'
              }
            }
        }
        stage("Build image") {
            steps {
                script {
                    myapp = docker.build("gokulnathb/golang-helloworld")
                }
            }
        }
        stage("Push image") {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                            myapp.push("latest")
                    }
                }
            }
        }
    }    
}
