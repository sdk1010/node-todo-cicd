pipeline{
    agent any
    stages{
        stage('Code'){
            steps{
            echo 'Getting code from github.'
            //git url:'https://github.com/LondheShubham153/node-todo-cicd.git', branch:'master'
            }
        }   
        stage('Build and Test'){
            steps{
            echo 'Building and Testing code.'
            sh "docker build -t node-cicd ."
            }
        }
        stage('Push'){
            steps{
            echo 'Pushing image to dockerhub.'
            withCredentials([usernamePassword(credentialsId:'DockerHub-ID',usernameVariable:'dockerHubUser',passwordVariable:'dockerHubPass')]){
            sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
            sh "docker tag node-cicd ${env.dockerHubUser}/node-cicd"
            sh "docker push ${env.dockerHubUser}/node-cicd"
            }
            }
        }
        stage('Scan'){
            steps{
                echo 'Scanning the code.'
            }
        }
         stage('Deploy'){
             steps{
                 echo 'Deploying the code to server.'
                 sh 'docker-compose down && docker-compose up -d'
             }
        }
        
    }
}
