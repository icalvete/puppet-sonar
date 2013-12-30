class sonar::config {

  $db_host = $sonar::db_host
  $db      = $sonar::db
  $db_user = $sonar::db_user
  $db_pass = $sonar::db_pass

  file {'sonar_configuration':
    ensure => present,
    content => template("${module_name}/sonar.properties.erb"),
    path    => "${sonar::params::config_path}/sonar.properties",
    owner   => $sonar::params::user,
    group   => $sonar::params::group,
    mode    => '0644',
  }

  if $sonar::plugins {
    sonar::plugins {$sonar::plugins:}
  }

  if $sonar::ssl {
    file {'sonar_keystore':
      ensure => present,
      source => "puppet:///modules/sp/sonar_keys/keystore",
      path   => "${sonar::params::path}/.keystore",
      owner  => $sonar::params::user,
      group  => $sonar::params::group,
      mode   => '0644',
    }
  }
}

