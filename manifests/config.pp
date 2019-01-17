class sonar::config {

  file {'sonar_configuration':
    ensure => present,
    content => template("${module_name}/sonar.properties.erb"),
    path    => "${sonar::params::config_path}/sonar.properties",
    owner   => $sonar::params::user,
    group   => $sonar::params::group,
    mode    => '0644',
  }
}

