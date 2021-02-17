pipeline {
	   
	    agent any
	
	    stages {
            stage('Checkout code') {
             steps {
            checkout scm
        }
    }
	        stage('TF Apply & Destroy') {
	            steps {
	                sh "ls"
	                sh '''
	                  curl -o tf.zip https://releases.hashicorp.com/terraform/0.14.6/terraform_0.14.6_linux_amd64.zip ; yes | unzip tf.zip
	                    ./terraform version
	                    ./terraform init
						cp /var/credentials.json .
						cp /var/id_rsa.pub .
                        if [ $action = 'plan' ]; then
                         ./terraform plan > plan.out
                        elif [ $action = 'apply' ]; then
                         ./terraform apply -auto-approve
                        elif [ $action = 'destroy' ]; then
                         ./terraform destroy -auto-approve
                        fi
	                '''
	            }
	        }
	    }
	}