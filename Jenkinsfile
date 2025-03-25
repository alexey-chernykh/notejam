pipeline {
    agent any
    environment {
        PROJECT_ID = 'docker'
        CLUSTER_NAME = 'jenkins'
        LOCATION = 'us-central-1a'
        CREDENTIALS_ID = 'kubernetes'
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
            sh "sed -i 's/pipeline:latest/pipeline:class: 'KubernetesEngineBuilder',\n
            projectId: env.PROJECT_ID,\n
            clusterName: env.CLUSTER_NAME,\n
            location: env.LOCATION,\n
            manifestPattern: 'deployment.yaml',\n
            credentialsId: env.CREDENTIALS_ID,\n
            verifyDeployments: true])"
            }
        }
    }
}
