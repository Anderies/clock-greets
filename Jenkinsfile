
pipeline {
    agent {
    label "pi"
    }
    options {
        ansiColor('xterm')
        // skipDefaultCheckout true
    }
        stages {
            stage('Setup tools') {
                steps {
                    echo '\033[34m- - - [_] [_] [_] Config Pipeline [_] [_] [_] - - -\033[0m'
                    sh '''
                        echo "config"
                    '''
                }
            }
            stage('Build') {
                steps {
                    echo '\033[34m- - - [_] [_] [_] Build App [_] [_] [_] - - -\033[0m'
                    sh '''
                        ls -alt
                    '''
                }
            }
            stage('Test') {
                steps {
                    echo 'Testing.....'
                }
            }
            stage('Deploy') {
                steps {
                    echo 'Deploying....'
                }
            }
        }
        post {
        // Clean after build
        always {
            cleanWs(cleanWhenNotBuilt: true,
                    deleteDirs: true,
                    disableDeferredWipeout: true,
                    notFailBuild: true,
                    cleanWhenFailure: true,
                    cleanWhenSuccess: true)
        }
    }
}