pipeline {
    
agent any  
tools {   //using plugins
  nodejs 'nodejs20'
  dockerTool 'docker'

}
stages{
    stage("git clone"){
        steps{
       git branch:'main', url:'https://github.com/aymenellouze/CI-CD-Documentation.git'
        }
    }
    stage('install docker'){
        steps{
            sh '''
            # Update package lists and install Docker
            apt-get update
            apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
            curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
            add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
            apt-get update
            apt-get install -y docker-ce
            
            # Add the jenkins user to the docker group
            usermod -aG docker jenkins

            '''
        }
    }
    //   stage("install dependencies"){
    //     steps{
     
           
    //       sh 'npm install'
       
    //     }
    // }
    // stage('sonarqube'){
        //     agent { 
        //         docker { 
        //             image 'sonarsource/sonar-scanner-cli' 
        //             args '-v /var/run/docker.sock:/var/run/docker.sock --network docker_compose_mynetwork'
        //         } 
        //     }
        //     steps{
        //           // sh 'sonar-scanner   -Dsonar.projectKey=a   -Dsonar.sources=.   -Dsonar.host.url=http://172.18.0.4:9000   -Dsonar.token=sqp_1d1cf157fdec8dcc21e9aa8bbd243e66eb444f8a'
             
        //      sh '''
             
        //       sonar-scanner \
        //       -Dsonar.projectKey=sonar \
        //       -Dsonar.sources=. \
        //       -Dsonar.host.url=http://sonarqube:9000 \
        //       -Dsonar.login=admin \
        //       -Dsonar.password=000000
        //      '''
        //         }
            
        // }
    //   stage("build the project"){
    //     steps{

    //         sh 'npm run build'
          
       
    //     }
    // }
// sss

    stage('install docker in the azure instnance with ansible') {
             agent { 
                docker { 
                    image 'cytopia/ansible:2.9-infra' 
                    args '-v //var/run/docker.sock:/var/run/docker.sock --network docker_compose_mynetwork' 
                } 
            }
            steps {
                    withCredentials([file(credentialsId: 'azkey', variable: 'key')]) {
                        
                     
                         sh '''
                        echo [server] > hosts
                        echo "20.124.197.100" >> hosts
                        cat hosts
                        ls
                        cat ${key} > go
                        chmod 400 go

                        ansible-playbook -i hosts -u azureuser --private-key go --ssh-common-args='-o StrictHostKeyChecking=no' playbook/playbook-docker.yaml

                        '''
                   }
                    
            }
 
        }
        stage('Uploading to Nexus') {
            steps {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                    sh 'docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                    sh ' docker tag prod  aymenellouzedocker/production:imagedocker'
                    sh ' docker push aymenellouzedocker/production:imagedocker'

            }}
        }
}
    
}