class sonar::params {

  $host                    = hiera('sonar_host')
  $port                    = hiera('sonar_port')
  $sport                   = hiera('sonar_sport')
  $db_host                 = hiera('sonar_db_host')
  $db                      = hiera('sonar_db')
  $db_user                 = hiera('sonar_db_user')
  $db_pass                 = hiera('sonar_db_pass')
  $skey                    = hiera('sonar_skey')
  $admin_pass              = hiera('sonar_admin_pass')

  $ldap_host               = hiera('ldap_host')
  $ldap_suffix             = hiera('ldap_suffix')
  $ldap_admin_user         = hiera('ldap_admin_user')
  $ldap_admin_pass         = hiera('ldap_admin_pass')

  $service                 = 'sonar'
  $user                    = 'sonar'

  $install_path            = '/opt'
  $path                    = "${install_path}/sonar"
  $config_path             = "${path}/conf"

  $runner_install_path     = '/opt'
  $runner_path             = '/opt/sonar-runner'
  $runner_config_path      = "${runner_path}/conf"

  $php_plugin_repo_scheme  = 'http'
  $php_plugin_repo_domain  = 'repository.codehaus.org'
  $php_plugin_repo_port    = false
  $php_plugin_repo_user    = false
  $php_plugin_repo_pass    = false
  $php_plugin_repo_path    = 'org/codehaus/sonar-plugins/php/sonar-php-plugin/1.2'
  $php_plugin_package      = 'sonar-php-plugin-1.2.jar'

  $ldap_plugin_repo_scheme = 'http'
  $ldap_plugin_repo_domain = 'repository.codehaus.org'
  $ldap_plugin_repo_port   = false
  $ldap_plugin_repo_user   = false
  $ldap_plugin_repo_pass   = false
  $ldap_plugin_repo_path   = 'org/codehaus/sonar-plugins/sonar-ldap-plugin/1.3'
  $ldap_plugin_package     = 'sonar-ldap-plugin-1.3.jar'

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
