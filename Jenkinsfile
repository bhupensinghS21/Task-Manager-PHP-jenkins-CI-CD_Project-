pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub-creds'
        DOCKER_IMAGE = 'bhupendradocker7773/task-app'
    }

    stages {

        stage('Build Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE:latest .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: DOCKERHUB_CREDENTIALS,
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {
                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                }
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push $DOCKER_IMAGE:latest'
            }
        }

        stage('Deploy Container') {
            steps {
                sh 'docker rm -f bsweb || true'
                sh '''
                docker run -d \
                --name bsweb \
                --network task-network \
                -p 8080:80 \
                $DOCKER_IMAGE:latest
                '''
            }
        }
    }

    post {
        success {
            mail to: 'YOUR_EMAIL@gmail.com',
                 subject: 'SUCCESS: Docker Image Deployed',
                 body: 'Your app was successfully built and deployed.'
        }
        failure {
            mail to: 'YOUR_EMAIL@gmail.com',
                 subject: 'FAILED: Jenkins Pipeline',
                 body: 'Build failed. Check Jenkins logs.'
        }
    }
}
