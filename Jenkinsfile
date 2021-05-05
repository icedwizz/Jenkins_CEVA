pipeline = {
    stage('Checkout') {
	    
        echo "Checking out repo.."
        checkout scm
       
    }
    //stage('Add Release to Git') {
	//bat "${WORKSPACE}/Scripts/addReleaseToGit.sh"
	//}
    stage('Get-Roles') {
        def roles = readFile("${WORKSPACE}/Roles/roles.csv")
        echo(roles)
    }
    stage('Get-Images') {
        def images = readFile("${WORKSPACE}/Images/semarchy.png")
        //echo(images)
    }

   // stage('Dev-Release') {
        //withEnv(["PATH+EXTRA=/cygwin64/bin"]) {
	//  bat "${WORKSPACE}/Scripts/devRelease.sh -apiKey=ubXtYtO.fQN3Z20wIpZEluUGN1XmySrUbt1Tls9JLBX -inputFile='Models/CEVAPhase1 [0.0].xml' -serverBase=http://localhost:8088/semarchy -dataLocation=DemoTest -modelName=DemoTest -modelEdition=0.0"
          
    //}
    stage('Build-Release') {
	   model_output = bat(
            script: "${WORKSPACE}/Scripts/buildRelease.sh -apiKey=ubXtYtO.fQN3Z20wIpZEluUGN1XmySrUbt1Tls9JLBX -serverBase=http://localhost:8088/semarchy -modelName=DemoTest -devModelEdition=0.1 -o='Models' -r='This is test. Building release for DemoTest [0.1]'",
            returnStout: true
       ).trim()
       echo model_output
	}
    
    stage('Git-Checkin') {
	bat "git status"
	bat "git add ."
	bat "git commit -m 'new model'"
	bat "git push -u origin main"
	//bat "https://github.com/icedwizz/Jenkins_CEVA"
		
	}
	

}

postFailure = {
    echo "Pipeline failed"
}

postAlways = {
    echo "I always run"
}

node {
    try {
        pipeline()
    } catch (e) {
        postFailure()
        throw e
    } finally {
        postAlways()
    }
}

