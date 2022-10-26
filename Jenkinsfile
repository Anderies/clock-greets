def dockerRegistry = "yurasdockers/";
def dashboardName = "dashboard:0.1-clck"

pipeline {
    agent { label 'pi' }
    options {
        ansiColor('xterm')
        timestamps ()
        buildDiscarder(logRotator(numToKeepStr: '10'))
        // skipDefaultCheckout true
    }
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerCred')
    }
        stages {
            stage('Config pipeline') {
                steps {
                    echo "\u001B[31mINFO: Some specific configuration\u001B[0m"
                    sh '''
                        export DOCKER_BUILDKIT=1
                        echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                       '''
                }
            }
            stage('Test') {
                steps {
                    echo "\u001B[31mINFO: Testing start\u001B[0m"
                    // sh '''
                    //     docker build --target test-runner -t tests/test-runner .
                    //    '''
                }
            }
            stage('Build') {
                steps {
                    echo "\u001B[31mINFO: Building start\u001B[0m"
                    sh '''
                        docker build -t yurasdockers/dashboard:0.1-clck .
                        docker push yurasdockers/dashboard:0.1-clck
                    '''
                }
            }
        }
        post {
        // Clean after build
        always {
            sh '\u001B[31mdocker logout\u001B[0m'
            cleanWs(cleanWhenNotBuilt: true,
                    deleteDirs: true,
                    disableDeferredWipeout: true,
                    notFailBuild: true,
                    cleanWhenFailure: true,
                    cleanWhenSuccess: true)
        }
    }
}