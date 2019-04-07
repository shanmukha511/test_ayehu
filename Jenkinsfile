pipeline
{
  
agent 
{
label "UnixSlave"

}

parameters
{
 choice(name: 'Environment',choices: 'Dev\nUAT\nPRD',description: 'Please select Environment')
 string(name:  'servername',description: 'Please enter ip address of Machine where you want to deploy artifact')
 string(name:  'Jobname',description: 'Please Jobname to get ocation of artifact')
 
 
}

stages
{
stage("build")
{

 steps{

 sh "mvn clean package"


  
 }

}
  
stage("Docker")
 {
  steps
  {
  
   
   sh "docker info"
   sh "docker build -t tomcat:$BUILD_NUMBER ."
   sh "docker images"
   //sh "docker login --username shanmukha511 --password  raviteja511"
   sh "docker tag tomcat:$BUILD_NUMBER shanmukha511/tomcat"
   //sh "docker push shanmukha511/tomcat:tomcat3"
    
     withCredentials([usernamePassword(credentialsId: 'DockerHubCred', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push shanmukha511/tomcat:$BUILD_NUMBER'
   //sh "ssh -tt -v -o StrictHostKeyChecking=no root@${params.servername} 'sudo -i'"
   sh "ssh -tt -v -o StrictHostKeyChecking=no root@${params.servername} 'apt-get update'"
   sh "ssh -tt -v -o StrictHostKeyChecking=no root@${params.servername} 'curl -fsSL get.docker.com -o get-docker.sh|sh get-docker.sh'"
   sh "ssh -tt -v -o StrictHostKeyChecking=no root@${params.servername} 'docker pull shanmukha511/tomcat:tomcat3'"
   sh "ssh -tt -v -o StrictHostKeyChecking=no root@${params.servername} 'docker images'"
   sh "ssh -tt -v -o StrictHostKeyChecking=no root@${params.servername} 'docker run -it -d --name tomcat -p 8080:8888 shanmukha511/tomcat:tomcat3 /bin/bash'"
   sh "ssh -tt -v -o StrictHostKeyChecking=no  root@${params.servername} 'docker ps'"
     }
  }
 }


}

 
}
