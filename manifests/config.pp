class sonar::config {

  $db_host = $sonar::db_host
  $db      = $sonar::db
  $db_user = $sonar::db_user
  $db_pass = $sonar::db_pass
  $port    = $sonar::params::port

  file{'sonar_configuration':
    content => template("${module_name}/sonar.properties.erb"),
    path    => "${sonar::params::config_path}/sonar.properties",
    owner   => $sonar::params::user,
    group   => $sonar::params::group,
    mode    => '0644',
  }
}

