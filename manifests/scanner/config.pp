class sonar::scanner::config {

  exec {'link_scanner':
    command => '/bin/ln -s sonar-scanner-* sonar-scanner',
    cwd     => $sonar::params::install_path,
    user    => 'root',
    unless  => "/usr/bin/test -d ${sonar::params::path_scanner}"
  }

  exec {'link_scanner_path':
    command => "/bin/ln -s ${sonar::params::path_scanner}/bin/sonar-scanner /usr/local/bin",
    cwd     => $sonar::params::install_path,
    user    => 'root',
    unless  => "/usr/bin/test -f /usr/local/bin/sonar-scanner"
  }

  common::add_env{'SONAR_RUNNER_HOME':
    key   => 'SONAR_RUNNER_HOME',
    value => $sonar::params::path_scanner
  }
}

