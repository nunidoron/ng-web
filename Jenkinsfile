pipeline {
    agent any

    stages {
        stage('Build docker image') {
            steps {
                sh 'docker build -t nunidoron/ng-web:2.0 .'
            }
        }
        stage('Testing') {
            steps {
                sh '''
                docker run -d --name ng-web-test -p 5002:5000 nunidoron/ng-web:2.0
                sleep 5
                curl localhost:5002
                docker kill ng-web-test
                '''
            }
        }
        stage('Push image') {
            steps {
                sh '''
                docker push nunidoron/ng-web:2.0
                '''
            }
        }
    }
}
