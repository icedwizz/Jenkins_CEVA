pipeline = {
    stage('Checkout') {
        echo "Checking out repo.."
        checkout scm
        echo "Checked out repo..."
    }
    stage('Get-Roles') {
        def roles = readFile("${WORKSPACE}/roles.csv")
        echo(roles)
    }
    stage('Get-Images') {
        def images = readFile("${WORKSPACE}/about-dialog-logo.png")
        //echo(images)
    }
    stage('Build-Release') {
		echo 'Build Release'
	}
    stage('Test') {
        echo 'Testing...'
    }
    stage('Dev-Release') {
        sh("dir")
        echo("${WORKSPACE"}")
        //sh("chmod +x ${WORKSPACE}/devRelease.sh")
        //sh("${WORKSPACE}/devRelease.sh")
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
