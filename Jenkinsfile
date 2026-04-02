pipeline {
    agent any

    stages {

        stage('Build Image') {
            steps {
                sh 'docker build -t task-app .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh 'docker rm -f task-app || true'
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                docker run -d \
                --name task-app \
                --network task-network \
                -p 8080:80 \
                task-app
                '''
            }
        }
    }
}
