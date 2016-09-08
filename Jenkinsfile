node {
  /* TODO: split versions properly
  stage 'Checkout'
  checkout scm

  versions = sh (
    script: 'find * -maxdepth 0 -type d',
    returnStdout: true
  ).trim().split()
  */
  def versions = [ '9.4', '9.5' ]

  def branches = [:]
  for (int i=0; i<versions.size(); ++i) {
    def v = versions[i]
    branches[v] = {
      stage "Build Docker image for ${v}"
      node('docker') {
        checkout scm

        // Use docker.build() ?
        sh "docker build -t camptocamp/postgis:${v} ${v}"
      }
    }
  }

  parallel branches
}
