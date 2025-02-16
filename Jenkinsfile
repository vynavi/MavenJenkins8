pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my-maven-app'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch:'main', url:'https://github.com/vynavi/MavenJenkins8.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    docker.image(DOCKER_IMAGE).inside {
                        sh 'mvn test'
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up after build'
        }
        success {
            echo 'Build and tests successful'
        }
        failure {
            echo 'Build or tests failed'
        }
    }
}
