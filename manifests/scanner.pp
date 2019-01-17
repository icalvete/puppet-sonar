class sonar::scanner () inherits sonar::params {

  anchor {'sonar::scanner::begin':
    before => Class['sonar::scanner::install']
  }
  class {'sonar::scanner::install':
    require => Anchor['sonar::scanner::begin']
  }
  class {'sonar::scanner::config':
    require => Class['sonar::scanner::install'],
  }
  anchor {'sonar::scanner::end':
    require => Class['sonar::scanner::config']
  }
}
