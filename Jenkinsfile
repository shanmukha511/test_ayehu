pipeline
{
  
agent 
{
label "master"

}

  environment {
        VER = VersionNumber([versionNumberString : '${BUILD_YEAR}.${BUILD_MONTH}.${BUILD_DAY}.TEST-API${BUILDS_ALL_TIME}', projectStartDate : '2018-11-25']);
        
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

		  rtUpload (
    serverId: 'Artifactory-1',
    spec: '''{
          "files": [
            {
              "pattern": "/var/jenkins_home/workspace/Ayehu/target/AyehuWebApplication.war",
              "target": "test_maven/"
            }
         ]
    }''',
 
    // Optional - Associate the uploaded files with the following custom build name and build number,
    // as build artifacts.
    // If not set, the files will be associated with the default build name and build number (i.e the
    // the Jenkins job name and number).
    buildName: 'testbuild',
    buildNumber: $VER
)

     }
  }
 }

}

 

