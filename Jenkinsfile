pipeline {
    agent any
    environment {
        PROJECT_ID = 'laba3-kiykiz-21-1-chernykh'
        CLUSTER_NAME = 'autopilot-cluster-1'
        LOCATION = 'us-central-1a'
        CREDENTIALS_ID = 'jenkins-service'
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build image') {
            steps {
                script {
                    echo "Building Docker image: zetzo/pipeline:${env.BUILD_ID}"
                    app = docker.build("zetzo/pipeline:${env.BUILD_ID}")
                }
            }
        }
        stage('Deploy to K8s') {
            steps {
                script {
                    echo "Deployment started ..."
                    sh 'ls -ltr'
                    sh 'pwd'
                    sh """
                        sed -i 's|pipeline:latest|pipeline:${env.BUILD_ID}|' deployment.yaml
                    """
                }
            }
        }
    }
}
