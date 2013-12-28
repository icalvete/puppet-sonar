class sonar::install {

  common::down_resource {'sonar_get_package':
    scheme   => $sonar::repo_scheme,
    domain   => $sonar::repo_domain,
    port     => $sonar::repo_port,
    user     => $sonar::repo_user,
    pass     => $sonar::repo_pass,
    path     => $sonar::repo_path,
    resource => $sonar::repo_resource,
  }

  realize Package[$sonar::params::pre_package]

  exec {'sonar_install_package':
    cwd     => '/tmp/',
    command => "${sonar::params::installer} -i ${sonar::repo_resource}",
    require => [Package[$sonar::params::pre_package], Common::Down_resource['sonar_get_package']],
    unless  => "/usr/bin/test -d ${sonar::params::config_path}"
  }
}

