pipeline{
    agent any
    triggers{
        pollSCM('* * * * *')
    }
    parameters{
        choice(name: 'Branch_Name', choices: ['master', 'dev', 'qa'], description: 'Selecting branch to build')
    }
    stages{
        stage('clone'){
            agent {
                label 'openmrs-docker'
            }
            steps{
                git url: 'https://github.com/lahari104/openmrs-core.git',
                    branch: "${params.Branch_Name}"
            }
        }
        stage('docker image build and push'){
            agent {
                label 'openmrs-docker'
            }
            steps{
                sh """
                      docker image build -t openmrs:2.0 .
                      docker tag openmrs:2.0 lahari23/openmrs:openmrs-2.0
                      docker push lahari23/openmrs:openmrs-2.0
                      docker image rm -rf openmrs:2.0 lahari23/openmrs:openmrs-2.0
                      docker image ls
                """
            }
        }
        // stage('deploy to K8s'){
        //     agent {
        //         label ''
        //     }
        //     steps{
        //         sh """
        //               kubectl apply -f ./Kubernets
        //         """
        //     }
        // }
    }
}