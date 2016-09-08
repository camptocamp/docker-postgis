node('docker') {
  stage 'Checkout'
  checkout scm

  versions = sh (
    script: 'find * -maxdepth 0 -type d',
    returnStdout: true
  ).trim().split()

  versions.each {
    stage "Build Docker image for ${it}"
    // Use docker.build() ?
    sh "camptocamp/postgis:${it} ${it}"
  }
}
