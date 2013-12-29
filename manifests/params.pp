class sonar::params {

  $host                   = hiera('sonar_host')
  $port                   = hiera('sonar_port')
  $db_host                = hiera('sonar_db_host')
  $db                     = hiera('sonar_db')
  $db_user                = hiera('sonar_db_user')
  $db_pass                = hiera('sonar_db_pass')
  $admin_pass             = hiera('sonar_admin_pass')

  $service                = 'sonar'
  $config_path            = '/opt/sonar/conf'
  $user                   = 'sonar'

  $install_path           = '/opt'
  $runner_install_path    = '/opt'
  $runner_path            = '/opt/sonar-runner'
  $runner_config_path     = "${runner_path}/conf"

  $php_plugin_repo_scheme = 'http'
  $php_plugin_repo_domain = 'repository.codehaus.org'
  $php_plugin_repo_port   = false
  $php_plugin_repo_user   = false
  $php_plugin_repo_pass   = false
  $php_plugin_repo_path   = 'org/codehaus/sonar-plugins/php/sonar-php-plugin/1.2'
  $php_plugin_package     = 'sonar-php-plugin-1.2.jar'

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
