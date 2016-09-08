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
  versions.each {
    branches[$it] = {
      node('docker') {
        checkout scm

        // Use docker.build() ?
        sh "docker build -t camptocamp/postgis:${it} ${it}"
      }
    }
  }

  parallel branches
}
