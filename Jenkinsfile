pipeline {
    agent any

    stages {
        stage('Build docker image') {
            steps {
                sh 'docker build -t nunidoron/ng-web .'
            }
        }
        stage('Testing') {
            steps {
                sh '''
                docker run -d --name ng-web-test -p 5002:5000 nunidoron/ng-web
                sleep 5
                curl localhost:5002
                docker kill ng-web-test
                '''
            }
        }
        stage('Push image') {
            steps {
                sh '''
                docker push nunidoron/ng-web
                '''
            }
        }
    }
}
