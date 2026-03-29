pipeline {
    agent any

    environment {
        TF_DIR = "terraform"
        APP_DIR = "app"
    }

    stages {

        stage('Azure Login') {
            steps {
                withCredentials([
                    string(credentialsId: 'azure-client-id', variable: 'CLIENT_ID'),
                    string(credentialsId: 'azure-client-secret', variable: 'CLIENT_SECRET'),
                    string(credentialsId: 'azure-tenant-id', variable: 'TENANT_ID'),
                    string(credentialsId: 'azure-subscription-id', variable: 'SUBSCRIPTION_ID')
                ]) {
                    sh '''
                    az login --service-principal \
                    -u $CLIENT_ID \
                    -p $CLIENT_SECRET \
                    --tenant $TENANT_ID

                    az account set --subscription $SUBSCRIPTION_ID
                    '''
                }
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                cd $TF_DIR
                terraform init
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                cd $TF_DIR
                terraform plan -out=tfplan
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                sh '''
                cd $TF_DIR
                terraform apply -auto-approve tfplan
                '''
            }
        }

        stage('Get VM IP') {
            steps {
                script {
                    env.VM_IP = sh(
                        script: "cd terraform && terraform output -raw public_ip",
                        returnStdout: true
                    ).trim()
                }
            }
        }

        stage('Deploy App via SSH') {
            steps {
                sshagent(['azure-ssh-key']) {
                    sh '''
                    echo "Deploying to $VM_IP"

                    scp -o StrictHostKeyChecking=no $APP_DIR/index.html azureuser@$VM_IP:/var/www/html/index.html
                    scp -o StrictHostKeyChecking=no $APP_DIR/style.css azureuser@$VM_IP:/var/www/html/style.css
                    '''
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                echo "Checking website..."
                curl http://$VM_IP
                '''
            }
        }

    }

    post {
        success {
            echo "🎉 Deployment Successful!"
        }
        failure {
            echo "❌ Deployment Failed!"
        }
    }
}