
pipeline {
    agent {
    label "default"
    }
    options {
        ansiColor('xterm')
    }
        stages {
            stage('Setup tools') {
                // agent {
                // label "default"
                // }
                steps {
                    echo '\033[34m- - -Config Pipeline- - -\033[0m'
                    sh '''
                        apt-get update -y && apt-get install curl -y
                        # Using Ubuntu
                        echo "install node"
                        curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
                        apt-get install -y nodejs
                        node --version
                    '''
                }
            }
            stage('Build') {
                // agent {
                // label "python"
                // }
                steps {
                    echo '\033[34mBuild docker image\033[0m'
                    container('docker') {
                    sh 'docker version'
                    }
                }
            }
            stage('Test') {
                steps {
                    echo 'Testing.....'
                    echo '\033[34mHello\033[0m \033[33mcolorful\033[0m \033[35mtesting!\033[0m'
                }
            }
            stage('Deploy') {
                steps {
                    echo 'Deploying....'
                }
            }
        }
    }