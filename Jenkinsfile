pipeline {
    agent any

    environment {
        APP_DIR = ''
    }

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out source code...'
                checkout scm
            }
        }

        stage('Find Application') {
            steps {
                script {
                    env.APP_DIR = sh(
                        script: '''
                            PACKAGE_FILE=$(find . \
                              -name package.json \
                              -not -path "*/node_modules/*" \
                              | head -1)

                            if [ -z "$PACKAGE_FILE" ]; then
                                echo "ERROR: package.json was not found"
                                exit 1
                            fi

                            dirname "$PACKAGE_FILE"
                        ''',
                        returnStdout: true
                    ).trim()

                    echo "Application directory: ${env.APP_DIR}"
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                dir("${env.APP_DIR}") {
                    echo 'Installing dependencies...'

                    script {
                        if (fileExists('package-lock.json')) {
                            sh 'npm ci'
                        } else {
                            sh 'npm install'
                        }
                    }
                }
            }
        }

        stage('Build') {
            steps {
                dir("${env.APP_DIR}") {
                    echo 'Building application...'
                    sh 'npm run build --if-present'
                }
            }
        }

        stage('Test') {
            steps {
                dir("${env.APP_DIR}") {
                    echo 'Running tests...'
                    sh 'npm test --if-present'
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }

        failure {
            echo 'Pipeline failed. Check the console output.'
        }

        always {
            cleanWs()
        }
    }
}
