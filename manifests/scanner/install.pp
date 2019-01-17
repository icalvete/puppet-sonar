class sonar::scanner::install {

  realize Package['unzip']

  wget::fetch {'download_sonar_scanner':
    source      => $sonar::scanner::url_scanner,
    destination => "/tmp/${sonar::scanner::package_scanner}",
    timeout     => 0,
    verbose     => false,
  }

  exec {'install_sonar_scanner':
    command => "/usr/bin/unzip /tmp/${sonar::scanner::package_scanner}",
    cwd     => $sonar::params::install_path,
    user    => 'root',
    unless  => "/usr/bin/test -d ${sonar::params::path_scanner}",
    require => [Package['unzip'], Wget::Fetch['download_sonar_scanner']]
  }
}

