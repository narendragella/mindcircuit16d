pipeline {
    agent any
tools{
	maven 'maven3'
}
    stages {
        stage('GIT REPO') {
            steps {
                echo 'cloning repo'
				git branch: 'main', url: 'https://github.com/narendragella/mindcircuit16d.git'
            }
        }
		stage('build') {
            steps {
                echo 'build the artifact by using mven  tool'
				sh 'mvn clean install'
            }
        }
		stage('DEPLOY') {
            steps {
                echo 'deploying the artifact into tomcat '
				deploy adapters: [tomcat8(alternativeDeploymentContext: '', credentialsId: '6df2cd21-561a-4c27-98d1-973cb47362d2', path: '', url: 'ec2-184-73-131-103.compute-1.amazonaws.com:9000/')], contextPath: 'tomcat2', war: '**/*.war'
            }
        }
    }
}
