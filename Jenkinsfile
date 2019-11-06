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
  

}

 
}
