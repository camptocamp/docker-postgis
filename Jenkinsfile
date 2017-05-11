#!groovy
@Library('c2c-pipeline-library') import static com.camptocamp.utils.*

selectNodes {
    it.kernel == 'Linux' && (it.memorysize_mb as Float) > 2500
}

dockerBuild {
  stage('Checkout') {
    checkout scm
  }

  def versions = sh (
    script: 'find * -maxdepth 0 -type d',
    returnStdout: true
  ).trim().tokenize()

  stage('Build Docker images') {

    withCredentials([[$class          : 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub',
                    usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
      sh 'docker login -u "$USERNAME" -p "$PASSWORD"'

      def branches = [:]
      for (int i=0; i<versions.size(); ++i) {
        def v = versions[i]
        branches["build-docker-${v}"] = {
          checkout scm

          sh "docker pull postgres:${v}"
          sh "docker build -t camptocamp/postgis:${v} ${v}"

          if (env.BRANCH_NAME == 'master') {
            docker.image("camptocamp/postgis:${v}").push()
          }
        }
      }
      parallel branches
    }
  }
}
