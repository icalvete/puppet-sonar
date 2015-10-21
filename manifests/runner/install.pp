class sonar::runner::install {

  common::down_resource {'sonar_runner_get_package':
    scheme   => $sonar::runner::repo_scheme,
    domain   => $sonar::runner::repo_domain,
    port     => $sonar::runner::repo_port,
    user     => $sonar::runner::repo_user,
    pass     => $sonar::runner::repo_pass,
    path     => $sonar::runner::repo_path,
    resource => $sonar::runner::repo_resource,
  }

  realize Package[$sonar::params::pre_package]
  realize Package['unzip']

  exec {'install_sonar_runner':
    command => "/usr/bin/unzip /tmp/${sonar::runner::repo_resource}",
    cwd     => $sonar::params::install_path,
    user    => 'root',
    unless  => "/usr/bin/test -L ${sonar::params::runner_path}",
    require => Package['unzip']
  }
}

