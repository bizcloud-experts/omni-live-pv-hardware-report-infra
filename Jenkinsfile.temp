pipeline{
	agent { label 'ecs' }
	tools { 
		terraform 'terraform'
	}
	stages{
		stage('Set parameters') {
            steps {
                script{
                    echo "GIT_BRANCH: ${GIT_BRANCH}" 
                    if ("${GIT_BRANCH}".contains("develop")) {
                        env.ENVIRONMENT="dev"
                    } else if ("${GIT_BRANCH}".contains("master")){
                        env.ENVIRONMENT="prod"
                    } else if ("${GIT_BRANCH}".contains("stage")){
                        env.ENVIRONMENT="stg"
                }
            }
        }
		}
		stage('Terraform init'){
			steps{
				script{
				 if("${env.ENVIRONMENT}".contains("dev")){
					withAWS(credentials: 'omni-aws-creds'){
					sh "terraform init -backend-config 'bucket=omni-terraform-states' -backend-config 'region=us-east-1' -backend-config 'key=<project-name>/dev/terraform.tfstate' -migrate-state"
				}
				 }
				else if("${env.ENVIRONMENT}".contains("prod")){
					withAWS(credentials: 'omni-aws-creds'){
					sh "terraform init -backend-config 'bucket=omni-terraform-states' -backend-config 'region=us-east-1' -backend-config 'key=<project-name>/prod/terraform.tfstate' -migrate-state"
				} 
				}
				else if("${env.ENVIRONMENT}".contains("stg")){
					withAWS(credentials: 'omni-aws-creds'){
					sh "terraform init -backend-config 'bucket=omni-terraform-states' -backend-config 'region=us-east-1' -backend-config 'key=<project-name>/staging/terraform.tfstate' -migrate-state"
				} 
				}
	
			}
			}
		}
		
		stage('terraform Plan') {
 			steps {
               script {
				if("${env.ENVIRONMENT}".contains("dev")){
					withAWS(credentials: 'omni-aws-creds'){
					sh "terraform plan -no-color -var-file='tfvars/dev.tfvars'"
					}
				}
				else if("${env.ENVIRONMENT}".contains("prod")){
					withAWS(credentials: 'omni-aws-creds'){
					sh "terraform plan -no-color -var-file='tfvars/prod.tfvars'"
					}
				}
				else if("${env.ENVIRONMENT}".contains("stg")){
					withAWS(credentials: 'omni-aws-creds'){
					sh "terraform plan -no-color -var-file='tfvars/stg.tfvars'"
					}
				}
                    
               }
			
        }
      }
	stage('Waiting for Approvals') {
		when {
                anyOf {
					equals(actual: "${env.ENVIRONMENT}", expected: "dev")
					equals(actual: "${env.ENVIRONMENT}", expected: "prod")
					equals(actual: "${env.ENVIRONMENT}", expected: "stg")
                }
            }
      steps{
          input('Plan Validated? Please approve to apply changes in AWS?')
			  }
      }    	
   	
		
	stage('Terraform Apply'){
			steps{
				script{
				 if("${env.ENVIRONMENT}".contains("dev")){
					withAWS(credentials: 'omni-aws-creds'){
					sh "terraform apply -no-color -var-file='tfvars/dev.tfvars' --auto-approve"
					}
				}
				else if("${env.ENVIRONMENT}".contains("prod")){
					withAWS(credentials: 'omni-aws-creds'){
					sh "terraform apply -no-color -var-file='tfvars/prod.tfvars' --auto-approve"
					}
				}
				else if("${env.ENVIRONMENT}".contains("stg")){
					withAWS(credentials: 'omni-aws-creds'){
					sh "terraform apply -no-color -var-file='tfvars/stg.tfvars' --auto-approve"
					}
				}
			}
		}
			}
	}

	}
