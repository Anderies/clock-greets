
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
            stage('Config pipeline') {
                steps {
                    echo "INFO: Some specific configuration"
                    sh '''
                        export DOCKER_BUILDKIT=1
                       '''
                }
            }
            stage('Test') {
                steps {
                    echo "INFO: Testing start"
                    // sh '''
                    //     docker build --target test-runner -t tests/test-runner .
                    //    '''
                }
            }
            stage('Build') {
                steps {
                    echo "INFO: Building start"
                    sh '''
                        docker build -t yurasdockers/dashboard:0.1(clck) .
                    '''
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