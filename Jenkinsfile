pipeline{

  agent any
  
  tools {
       terraform 'terraform'
   }

  environment {
      AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
      AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY') 
  }

  stages{

         /*
         stage('hello AWS') {
            steps {
                withAWS(credentials: 'b57f33b1-e3db-432f-9a6d-562d3111b909', region: 'us-east-1')
            }
         }
        */    
         stage('Git Checkout'){
            steps{
                git branch: 'master', credentialsId: '800ca5af-10a8-4cb1-b360-e0fe920332ce', url: 'https://github.com/kapilkumaria/ci-jenkins-npm.git'
            }
         }
        
                          
                  
         stage('Docker Image Build and Tag the Image'){

             steps {
              sh "pwd"
              dir('dev'){ 
     /*         git branch: 'master', credentialsId: '800ca5af-10a8-4cb1-b360-e0fe920332ce', url: 'https://github.com/kapilkumaria/ci-jenkins-npm.git' */
              /*sh "sudo chmod 666 /var/run/docker.sock" */
              sh "pwd"
              sh "docker build -t my-nodeapp ."
              sh "docker tag my-nodeapp:latest 931058976119.dkr.ecr.us-east-1.amazonaws.com/my-nodeapp:latest"
              }
             }
         }


         stage('Retrieve An Authentication Token and Authenticate Docker Client'){
           steps{
              sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 931058976119.dkr.ecr.us-east-1.amazonaws.com"
           }
         }
                  
        
         stage('Push Image'){
          steps{
             sh "docker push 931058976119.dkr.ecr.us-east-1.amazonaws.com/my-nodeapp:latest"
              }
         }
         
          
            
         stage('Terraform init'){

           steps {
             sh "pwd"
             git branch: 'feature01', credentialsId: 'd65caf3a-ef40-43d3-b1a1-624e7dcc4ca4', url: 'https://github.com/kapilkumaria/Dev-Project1.git'
             dir('dev'){
             sh "pwd"
             sh 'terraform init'
          }
         }
        }
                
         stage('Terraform apply?'){
           steps {
             sh "pwd"
             dir('dev'){
             sh "pwd"
             input "Continue?"
             sh 'terraform apply -auto-approve'  
          }
         }
        }

                  
         stage('Terraform destroy?'){
          steps {
             sh "pwd"
             dir('dev'){
             sh "pwd"
             input "Continue?"
             sh 'terraform destroy -auto-approve'   
          }
         }
      }
  }

        
  post {
    always {
      cleanWs()
      }
  }
}




