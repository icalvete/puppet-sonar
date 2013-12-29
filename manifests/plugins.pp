define sonar::plugins {

  $plugin = "sonar::plugins::${name}"
  include $plugin
}

