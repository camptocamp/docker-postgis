node('docker') {
  stage 'Checkout'
  checkout scm

  stage 'Build Docker image'
  sh './build.sh'
}
