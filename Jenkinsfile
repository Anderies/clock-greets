
pipeline {
    agent {
    label "default"
    }
    options {
        ansiColor('xterm')
        // skipDefaultCheckout true
    }
        stages {
            stage('Setup tools') {
                // agent {
                // label "default"
                // }
                steps {
                    echo '\033[34m- - -Config Pipeline- - -\033[0m'
                    sh '''
                        node --version
                        export NODE_OPTIONS=--max_old_space_size=400
                        echo $NODE_OPTIONS
                        npm install
                        # npm fund
                        # npm audit fix --force
                        npm install -g @angular/cli@9.0.7
                    '''
                }
            }
            stage('Build') {
                // agent {
                // label "python"
                // }
                steps {
                    echo '\033[34m- - - Build App - - -\033[0m'
                    sh '''
                    node --max_old_space_size=400 node_modules/@angular/cli/bin/ng build clock-greets --prod
                    ng build
                    '''
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