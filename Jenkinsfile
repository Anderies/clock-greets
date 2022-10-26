
pipeline {
    agent {
        label "pi"
    }
    options {
        ansiColor('xterm')
        timestamps ()
        // skipDefaultCheckout true
    }
        stages {
            stage('Build') {
                steps {
                    echo "INFO: Building start"
                    sh '''
                        docker build -t yurasdockers/clock:0.1 .
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