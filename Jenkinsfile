
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
            stage('Test') {
                steps {
                    sh 'ng test'
                }
            }
            stage('Build') {
                steps {
                    echo "INFO: Building start"
                    sh '''
                        export DOCKER_BUILDKIT=1
                        docker build -t yurasdockers/clock:0.1 .
                    '''
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