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
                app = docker.build("zetzo/pipeline:{env.BUILD_ID}")
            }
        }
    }
    stage('Deploy to K8s') {
        steps{
            echo "Deployment started ..."
            sh 'ls -ltr'
            sh 'pwd'
            sh "sed -i 's/pipeline:latest/pipeline:class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'deployment.yaml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])"
            }
        }
    }
}
