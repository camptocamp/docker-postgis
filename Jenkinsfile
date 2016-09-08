node {
  stage 'Checkout'
  checkout scm

  def versions = sh (
    script: 'find * -maxdepth 0 -type d',
    returnStdout: true
  ).trim().split()

  stage 'Build Docker images'
  def branches = [:]
  for (int i=0; i<versions.size(); ++i) {
    def v = versions[i]
    branches["build-docker-${v}"] = {
      node('docker') {
        checkout scm

        // Use docker.build() ?
        sh "docker build -t camptocamp/postgis:${v} ${v}"
      }
    }
  }

  parallel branches
}
