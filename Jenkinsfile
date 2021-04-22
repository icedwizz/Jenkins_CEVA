pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
		 script {
                	def excelFormat = CSVFormat.EXCEL
			def records = readCSV file: 'dir/roles.csv', format: excelFormat
			assert records[0][0] == 'key'
			assert records[1][1] == 'b'

			def content = readCSV text: 'key,value\na,b', format: CSVFormat.DEFAULT.withHeader()
			assert records[1].get('key') == 'a'
			assert records[1].get('value') == 'b'
				
			}	
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
