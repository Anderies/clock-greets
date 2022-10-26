
pipeline {
    agent {
        label "pi"
    }
    options {
        ansiColor('xterm')
        // skipDefaultCheckout true
    }
        stages {
            stage('Build') {
                steps {
                    echo "INFO: Building start"
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