
pipeline {
    agent {
    label "node"
    }
    options {
        ansiColor('xterm')
    }
        stages {
            stage('Setup tools') {
                steps {
                    echo '\033[34m- - -Config Pipeline- - -\033[0m'
                    container('node') {
                    sh 'ng build'
                    }
                }
            }
            stage('create a Python virtual environment') {
                steps {
                }
            }
            stage('Build') {
                steps {
                    echo '\033[34mBuild docker image\033[0m'
                    container('docker') {
                    sh 'docker version'
                    }
                }
            }
            stage('Test') {
                steps {
                    }
                }
            stage('Deploy') {
                steps {
                    echo 'Deploying....'
                }
            }
        }
    }