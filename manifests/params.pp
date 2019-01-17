class sonar::params {
  $admin_pass = lookup(
    'sonar_admin_pass',
    String,
    'first',
    'admin'
  )
  $xmx = lookup(
    'sonar_xmx',
    String,
    'first',
    '1024'
  )
  $xms = lookup(
    'sonar_xms',
    String,
    'first',
    '512'
  )
  $host = lookup(
    'sonar_host',
    String,
    'first',
    '127.0.0.1'
  )
  $port = lookup('
    sonar_port',
    String,
    'first',
    '9999'
  )
  $sport = lookup(
    'sonar_sport',
    String,
    'first',
    '9998'
  )
  $db_host = lookup(
    'sonar_db_host',
    String,
    'first',
    '127.0.0.1'
  )
  $db = lookup(
    'sonar_db',
    String,
    'first',
    'sonar'
  )
  $db_user = lookup(
    'sonar_db_user',
    String,
    'first',
    'sonar'
  )
  $db_pass = lookup(
    'sonar_db_pass',
    String,
    'first',
    'sonar'
  )
  $skey = lookup(
    'sonar_skey',
    String,
    'first',
    'sonar'
  )

  $ldap_host  = lookup(
    'ldap_host',
    String,
    'first',
    '127.0.0.1'
  )
  $ldap_suffix = lookup(
    'ldap_suffix',
    String,
    'first',
    'example.net'
  )
  $ldap_admin_user = lookup(
    'ldap_admin_user',
    String,
    'first',
    'ldap'
  )
  $ldap_admin_pass = lookup(
    'ldap_admin_pass',
    String,
    'first',
    'ldap'
  )

  $service = 'sonar'
  $user    = 'sonar'

  $package_scanner = 'sonar-scanner-cli-3.3.0.1492-linux.zip'
  $url_scanner     = "https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/${package_scanner}"

  $install_path        = '/opt'
  $path                = "${install_path}/sonar"
  $path_scanner        = "${install_path}/sonar-scanner"
  $config_path         = "${path}/conf"
  $config_path_scanner = "${path_scanner}/conf"

  case $::operatingsystem {
    /^(Debian|Ubuntu)$/: {
      $installer   = '/usr/bin/dpkg'
    }
    default: {
      fail ("${::operatingsystem} not supported.")
    }
  }
}
