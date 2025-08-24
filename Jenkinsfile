properties([
    parameters([
        string(
            defaultValue: 'dev',
            name: 'Environment',
            description: 'Terraform Environment (e.g., dev)'
        ),
        choice(
            choices: ['plan', 'apply', 'destroy'],
            name: 'Terraform_Action',
            description: 'Terraform Action to perform'
        )
    ])
])

pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-southeast-2'
    }

    stages {
        stage('Preparing') {
            steps {
                echo "Preparing Terraform Pipeline for ${params.Environment}..."
            }
        }

        stage('Git Pulling') {
            steps {
                git branch: 'master', url: 'https://github.com/ChaitanyaKumarReddy07/Chaitanya-EKS-terraform.git'
            }
        }

        stage('Init') {
            steps {
                withAWS(credentials: 'aws-creds', region: "${env.AWS_REGION}") {
                    sh 'terraform -chdir=eks/ init'
                }
            }
        }

        stage('Validate') {
            steps {
                withAWS(credentials: 'aws-creds', region: "${env.AWS_REGION}") {
                    sh 'terraform -chdir=eks/ validate'
                }
            }
        }

        stage('Terraform Action') {
            steps {
                withAWS(credentials: 'aws-creds', region: "${env.AWS_REGION}") {
                    script {
                        def tfCommand = "terraform -chdir=eks/ ${params.Terraform_Action} -var-file=${params.Environment}.tfvars"
                        
                        if (params.Terraform_Action == 'apply' || params.Terraform_Action == 'destroy') {
                            tfCommand += " -auto-approve"
                        }

                        sh tfCommand
                    }
                }
            }
        }
    }
}
