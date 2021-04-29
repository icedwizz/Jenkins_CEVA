pipeline = {
    stage('Checkout') {
	    
        echo "Checking out repo.."
        checkout scm
       
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
	    bat "${WORKSPACE}/Scripts/test1.sh"
            echo 'Release to QA'
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

