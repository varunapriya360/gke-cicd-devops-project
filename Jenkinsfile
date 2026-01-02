pipeline {
    agent any

    environment {
        PROJECT_ID = "gke-cicd-project"
        REGION     = "asia-south1"
        IMAGE      = "asia-south1-docker.pkg.dev/${PROJECT_ID}/cicd-repo/cicd-app:latest"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/varunapriya360/gke-cicd-devops-project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE} ."
                }
            }
        }

        stage('Push to Artifact Registry') {
            steps {
                script {
                    sh "gcloud auth configure-docker asia-south1-docker.pkg.dev --quiet"
                    sh "docker push ${IMAGE}"
                }
            }
        }

        stage('Deploy to GKE') {
            steps {
                script {
                    sh "gcloud container clusters get-credentials cicd-gke-cluster --region ${REGION}"
                    sh "kubectl apply -f k8s/"
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment completed successfully! 🎉'
        }
        failure {
            echo 'Deployment failed! Check logs. ❌'
        }
    }
}
