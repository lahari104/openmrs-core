pipeline{
    agent{
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
                sh """mvn package"""
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