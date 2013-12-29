class sonar (

  $repo_scheme   = $sonar::params::repo_scheme,
  $repo_domain   = $sonar::params::repo_domain,
  $repo_port     = $sonar::params::repo_port,
  $repo_user     = $sonar::params::repo_user,
  $repo_pass     = $sonar::params::repo_pass,
  $repo_path     = $sonar::params::repo_path,
  $repo_resource = $sonar::params::package,
  $db_host       = $sonar::params::db_host,
  $db            = $sonar::params::db,
  $db_user       = $sonar::params::db_user,
  $db_pass       = $sonar::params::db_pass,
  $plugins       = undef

) inherits sonar::params {

  anchor {'sonar::begin':
    before => Class['sonar::install']
  }
  class {'sonar::install':
    require => Anchor['sonar::begin']
  }
  class {'sonar::config':
    require => Class['sonar::install'],
    notify  => Class['sonar::service']
  }
  class {'sonar::service':
    require => Class['sonar::config']
  }
  class {'sonar::postconfig':
    require => Class['sonar::service']
  }
  anchor {'sonar::end':
    require => Class['sonar::postconfig']
  }
}
