class sonar::install {

  apt::source { 'sonar':
    location => 'http://downloads.sourceforge.net/project/sonar-pkg/deb',
    release  => '',
    repos    => 'binary/',
  }

  package { 'sonar':
    ensure          => present,
    install_options =>  ['--allow-unauthenticated', '-f'],
    require         => Apt::Source['sonar']
  }
}

