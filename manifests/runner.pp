class sonar::runner (

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

) inherits sonar::params {

  anchor {'sonar::runner::begin':
    before => Class['sonar::runner::install']
  }
  class {'sonar::runner::install':
    require => Anchor['sonar::runner::begin']
  }
  class {'sonar::runner::config':
    require => Class['sonar::runner::install'],
  }
  anchor {'sonar::runner::end':
    require => Class['sonar::runner::config']
  }
}
