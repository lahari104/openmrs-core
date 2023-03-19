pipeline{
    agent{
        label 'node-1'
    }
    triggers{
        pollSCM('* * * * *')
    }
    stages{
        stage('clone'){
            steps{ 
                git url: 'https://github.com/lahari104/openmrs-core.git',
                    branch: 'harsha'
            }
        }
        stage('build'){
            steps{
                withSonarQubeEnv('sonarqube') {
                sh 'mvn clean package sonar:sonar -Dsonar.organization=openmrs-core'
              }
            }
        }
        stage('archive artifacts'){
            steps{
                archiveArtifacts artifacts: '**/target/*.war', 
                                 followSymlinks: false
            }
        }
        stage('Junit'){
            steps{
                junit '**/surefire-reports/*.xml'
            }
        }
    }
}