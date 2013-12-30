define sonar::plugins {

  $plugin = "sonar::plugins::${name}"
  class {$plugin:
    notify => Class['sonar::service']
  }
}

