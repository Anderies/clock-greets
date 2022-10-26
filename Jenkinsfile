def dockerRegistry = "yurasdockers";
def dashboardName = "dashboard";
def dashboardTag = "0.1-clck"

pipeline {
    agent { label 'pi' }
    // triggers {
    //     cron('H 4/* 0 0 1-5')
    // }
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
                        docker build -t ${dockerRegistry}/${dashboardName}:${dashboardTag} .
                        docker push ${dockerRegistry}/${dashboardName}:${dashboardTag}
                    '''
                }
            }
        }
        post {
        // Clean after build
        always {
            // sh 'docker logout'
            cleanWs(cleanWhenNotBuilt: true,
                    deleteDirs: true,
                    disableDeferredWipeout: true,
                    notFailBuild: true,
                    cleanWhenFailure: true,
                    cleanWhenSuccess: true)
        }
    }
}