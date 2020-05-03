pipeline {
  agent any
  stages {
    stage ('Build') {
      steps {
        sh 'docker-compose build --no-cache'
      }
    }
    stage ('Deploy Integration') {
      when {
        expression { BRANCH_NAME == 'integration' }
      }
      environment {
        NADEKO_CREDENTIALS = credentials('toriel_integration_credentials')
      }
      steps {
        sh 'docker-compose down'
        sh 'rm -f credentials.json'
        sh 'cp $NADEKO_CREDENTIALS credentials.json'
        sh 'docker-compose up -d'
      }
    }
    stage ('Deploy Master') {
      when {
        expression { BRANCH_NAME == 'master' }
      }
      environment {
        NADEKO_CREDENTIALS = credentials('toriel_master_credentials')
      }
      steps {
        sh 'docker-compose down'
        sh 'rm -f credentials.json'
        sh 'cp $NADEKO_CREDENTIALS credentials.json'
        sh 'docker-compose up -d'
      }
    }
  }
}
