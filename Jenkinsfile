pipeline {
    agent any

    environment {
        PATH = "/usr/local/bin:${env.PATH}"
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Check Files') {
            steps {
                sh '''
                    pwd
                    ls -la
                    ls -la app
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ecommerce-app:latest ./app'
            }
        }

        stage('Verify Docker Image') {
            steps {
                sh 'docker images | grep ecommerce-app'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully.'
        }

        failure {
            echo 'Pipeline failed. Check the console output.'
        }
    }
}
