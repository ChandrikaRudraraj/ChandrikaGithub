pipeline {
    agent any
    
    environment {
        // Set Salesforce DX alias for authentication
        SFDX_ALIAS = 'myorg'
        // Set the GitHub repository URL
        GITHUB_REPO_URL = 'https://github.com/SFDCData99/ChandrikaGithub.git'
        // Set the branch of the GitHub repository
        GITHUB_BRANCH = 'main'
        SFDX_PATH = '/opt/cli/sf/bin/sfdx'
        SERVER_KEY_FILE='/var/lib/jenkins/workspace/pipeline4/manifest/execute/server.key'
    }
    
    stages {
        
        
        stage('Checkout') {
            steps {
                // Checkout code from GitHub repository
                git branch: "${env.GITHUB_BRANCH}", url: "${env.GITHUB_REPO_URL}"
            }
        }
        
        stage('Deploy') {
            steps {
                withCredentials([string(credentialsId: 'SFDCClientID', variable: 'varsfdcclientid')]) {
    
                    // Authenticate with Salesforce CLI
                    sh "${env.SFDX_PATH} force:auth:jwt:grant --clientid ${varsfdcclientid} --jwtkeyfile ${env.SERVER_KEY_FILE}  --username tools@gmail.com --setdefaultdevhubusername -a ${SFDX_ALIAS}"
                
                    // Deploy Salesforce metadata
                    sh "${env.SFDX_PATH} force:source:deploy -u ${SFDX_ALIAS} -p force-app/main/default"
            }
}
        }
    }
    
    post {
        always {
            // Clean up Salesforce DX authentication
            sh "${env.SFDX_PATH} force:auth:logout -u ${SFDX_ALIAS} -p"
        }
    }
}
