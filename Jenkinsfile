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
                sh """/opt/maven/bin/mvn package"""
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