pipeline {
    agent any
    stages {
        stage("Initialize") {
            steps {
              script {
                sh 'docker -v'
                def dockerHome = tool 'Docker'
                sh 'echo ${dockerHome}'
                env.PATH = "${dockerHome}/bin:${env.PATH}"
              }
            }
        }
        stage("Checkout code") {
            steps {
              checkout scm
            }
        }
        stage("Build project") {
            steps {
              script {
                  def root = tool type: 'go', name: 'Go 1.16'
                  withEnv(["GOROOT=${root}", "PATH+GO=${root}/bin:${HOME}/go/bin"]) {
                    sh 'go build -o helloworld main.go'
                  }
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
        stage("Deploy image") {
            steps {
                script {
                    sh 'kubectl apply -f deployment.yaml'
                }
            }
        }
    }    
}
