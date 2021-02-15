pipeline {
	   
	    agent any
	
	    stages {
            stage('Checkout code') {
             steps {
            checkout scm
        }
    }
	        stage('Preparation') {
	            steps {
	                sh "ls"
	                sh '''
	                  curl -o tf.zip https://releases.hashicorp.com/terraform/0.14.6/terraform_0.14.6_linux_amd64.zip ; yes | unzip tf.zip
	                    ./terraform version
	                   
	                '''
	            }
	        }
	        stage('Terraform Init') {
	            steps {
	                sh "./terraform init"
	            }
	        }
	        stage('Terraform Plan') {
	            steps {
	                sh "./terraform plan"
	            }
	        }
	        stage('Terraform Apply') {
	            steps {
	                sh "./terraform apply -auto-approve"
	            }
	        }
	    }
	}


