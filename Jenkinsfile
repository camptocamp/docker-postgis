node {
  stage 'Checkout' {
    checkout scm
  }

  def versions = sh (
    script: 'find * -maxdepth 0 -type d',
    returnStdout: true
  ).trim().tokenize()

  stage 'Build Docker images' {

    def branches = [:]
    for (int i=0; i<versions.size(); ++i) {
      def v = versions[i]
      branches["build-docker-${v}"] = {
        node('docker') {
          stage "Checkout SCM for ${v}" {
            checkout scm
          }

          stage "Build Docker image for ${v}" {
            // Use docker.build() ?
            sh "docker build -t camptocamp/postgis:${v} ${v}"
          }

          stage "Push Docker image for ${v}" {
            docker.withRegistry('', 'dockerhub') {
              // Use push() ?
              sh "docker push camptocamp/postgis:${v}"
            }
          }
        }
      }
    }

    parallel branches
  }
}
