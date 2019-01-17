class sonar (

  $admin_pass      = $sonar::params::admin_pass,
  $mysql           = true,
  $xmx             = $sonar::params::xmx,
  $xms             = $sonar::params::xms,
  $port            = $sonar::params::port,
  $db_host         = $sonar::params::db_host,
  $db              = $sonar::params::db,
  $db_user         = $sonar::params::db_user,
  $db_pass         = $sonar::params::db_pass,
  $plugins         = undef,
  $ldap            = false,
  $ldap_host       = $sonar::params::ldap_host,
  $ldap_suffix     = $sonar::params::ldap_suffix,
  $ldap_admin_user = $sonar::params::ldap_admin_user,
  $ldap_admin_pass = $sonar::params::ldap_admin_pass,

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
