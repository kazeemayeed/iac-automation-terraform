pipeline {
    agent any
    
    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
        TF_VAR_environment = "${params.ENVIRONMENT}"
    }
    
    parameters {
        choice(
            name: 'ENVIRONMENT',
            choices: ['dev', 'prod'],
            description: 'Environment to deploy to'
        )
        choice(
            name: 'ACTION',
            choices: ['plan', 'apply', 'destroy'],
            description: 'Terraform action to perform'
        )
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        
        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
                sh 'terraform fmt -check=true'
            }
        }
        
        stage('Terraform Plan') {
            steps {
                sh """
                    terraform plan \
                        -var-file="environments/\${ENVIRONMENT}/terraform.tfvars" \
                        -out=tfplan
                """
            }
        }
        
        stage('Terraform Apply') {
            when {
                expression { params.ACTION == 'apply' }
            }
            steps {
                input message: "Apply Terraform changes for ${params.ENVIRONMENT}?", ok: 'Apply'
                sh 'terraform apply tfplan'
            }
        }
        
        stage('Output Results') {
            steps {
                sh 'terraform output'
            }
        }
    }
    
    post {
        always {
            cleanWs()
        }
    }
}
