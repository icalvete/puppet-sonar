define sonar::plugins {

  $plugin = "sonar::plugins::${name}"
  class {$plugin:
    require => Class['sonar::install'],
    notify  => Class['sonar::service']
  }
}

