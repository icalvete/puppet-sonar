class sonar::runner::config {

  $db_host = $sonar::runner::db_host
  $db      = $sonar::runner::db
  $db_user = $sonar::runner::db_user
  $db_pass = $sonar::runner::db_pass
  $host    = $sonar::runner::host
  $port    = $sonar::params::port

  exec {'link_runner_path':
    command => '/bin/ln -s sonar-runner-* sonar-runner',
    cwd     => $sonar::params::runner_install_path,
    user    => 'root',
    unless  => "/usr/bin/test -d ${sonar::params::runner_path}"
  }

  common::add_env{'SONAR_RUNNER_HOME':
    key   => 'SONAR_RUNNER_HOME',
    value => $sonar::params::runner_path
  }

  file {'sonar_runner_configuration':
    content => template("${module_name}/sonar-runner.properties.erb"),
    path    => "${sonar::params::runner_config_path}/sonar-runner.properties",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Exec['link_runner_path']
  }
}

