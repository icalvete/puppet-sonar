class sonar::params {

  $db_host    = hiera('sonar_db_host')
  $db         = hiera('sonar_db')
  $db_user    = hiera('sonar_db_user')
  $db_pass    = hiera('sonar_db_pass')
  $admin_pass = hiera('sonar_admin_pass')

  $port                = '9090'

  $service             = 'sonar'
  $config_path         = '/opt/sonar/conf'
  $user                = 'sonar'

  $runner_install_path = '/opt'
  $runner_path         = '/opt/sonar-runner'
  $runner_config_path  = "${runner_path}/conf"

  case $::operatingsystem {
    /^(Debian|Ubuntu)$/: {
      $installer   = '/usr/bin/dpkg'
      $pre_package = 'openjdk-7-jre'
      $group       = 'adm'
    }
    /^(CentOS|RedHat)$/: {
      $installer   = '/bin/rpm'
      $pre_package = 'java-1.6.0-openjdk'
      $group       = 'sonar'
    }
    default: {
      fail ("${::operatingsystem} not supported.")
    }
  }
}
