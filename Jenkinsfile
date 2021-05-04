pipeline = {
    stage('Checkout') {
	    
        //echo "Checking out repo.."
        //checkout scm
       
    }
    stage('Add Release to Git') {
	bat "${WORKSPACE}/Scripts/addReleaseToGit.sh"
	}
    stage('Get-Roles') {
        def roles = readFile("${WORKSPACE}/Roles/roles.csv")
        echo(roles)
    }
    stage('Get-Images') {
        def images = readFile("${WORKSPACE}/Images/semarchy.png")
        //echo(images)
    }

    stage('Dev-Release') {
        //withEnv(["PATH+EXTRA=/cygwin64/bin"]) {
	   bat "${WORKSPACE}/Scripts/devRelease.sh -apiKey=ubXtYtO.fQN3Z20wIpZEluUGN1XmySrUbt1Tls9JLBX -inputFile='Models/CEVAPhase1 [0.0].xml' -serverBase=http://localhost:8088/semarchy -dataLocation=DemoTest -modelName=DemoTest -modelEdition=0.0"
            echo 'Release to QA'
    	}
	stage('Build-Release') {
		bat "(${WORKSPACE}/Scripts/buildRelease.sh -apiKey=ubXtYtO.fQN3Z20wIpZEluUGN1XmySrUbt1Tls9JLBX -serverBase=http://localhost:8088/semarchy -modelname=DemoTest -devModelEdition=0.1 -o=Models -r='This is test. Building release for DemoTest [0.1]'"
		echo 'Build Release'
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

