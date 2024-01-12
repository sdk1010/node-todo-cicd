pipeline{
    agent any
    stages{
    
        stage("code"){
         
            steps{
                
                git url: "https://github.com/sdk1010/node-todo-cicd.git", branch: "main"
                echo "Code successfully pulled from GitHub"
                
            }   
        }
        stage("build & test"){
         
            steps{
                
                sh "docker build -t node-todo-cicd-pipeline:latest ."
                echo "Image successfully built and tested."
                
            }   
        }
        stage("push"){
         
            steps{
                
                withCredentials([usernamePassword(credentialsId:"dockerHub",usernameVariable:"dockerHubUser",passwordVariable:"dockerHubPass")]){
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                    sh "docker tag node-todo-cicd-pipeline:latest ${env.dockerHubUser}/node-todo-cicd-pipeline:latest"
                    sh "docker push ${env.dockerHubUser}/node-todo-cicd-pipeline:latest"
                    echo "Image successfully pushed to DockerHub"
                }
            }   
        }
        stage("deploy"){
         
            steps{
                
                sh "docker-compose down && docker-compose up -d"
                echo "Deployment Completed"
                
            }   
        }
      
    }
}
