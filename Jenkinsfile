pipeline {
    agent any

    environment {
        AWS_REGION = 'us-west-2'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://gitlab.com/your-repo.git'
            }
        }
        stage('Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Plan') {
            steps {
                sh 'terraform plan'
            }
        }
        stage('Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
