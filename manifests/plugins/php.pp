class sonar::plugins::php (

  $repo_scheme   = $sonar::params::php_plugin_repo_scheme,
  $repo_domain   = $sonar::params::php_plugin_repo_domain,
  $repo_port     = $sonar::params::php_plugin_repo_port,
  $repo_user     = $sonar::params::php_plugin_repo_user,
  $repo_pass     = $sonar::params::php_plugin_repo_pass,
  $repo_path     = $sonar::params::php_plugin_repo_path,
  $repo_resource = $sonar::params::php_plugin_package,
  $target        = "${sonar::params::path}/extensions/plugins"

) {

  include sonar::params
  include php5::pear

  common::down_resource {'sonar_php_plugin':
    scheme   => $repo_scheme,
    domain   => $repo_domain,
    port     => $repo_port,
    user     => $repo_user,
    pass     => $repo_pass,
    path     => $repo_path,
    resource => $repo_resource,
    target   => $target
  }

  package {'php5-xdebug':
    ensure => present
  }

  php5::pear::channel {'pear.phpunit.de':}
  php5::pear::channel {'pear.symfony.com':}
  php5::pear::channel {'pear.phpmd.org':}
  php5::pear::channel {'pear.pdepend.org':}

  php5::pear::install_package {'phpunit/PHPUnit':
    require => Php5::Pear::Channel['pear.phpunit.de', 'pear.symfony.com']
  }

  php5::pear::install_package {'phpmd/PHP_PMD':
    require => Php5::Pear::Channel['pear.phpunit.de']
  }

  php5::pear::install_package {'pdepend/PHP_Depend':
    require => Php5::Pear::Channel['pear.pdepend.org']
  }

  php5::pear::install_package {'PHP_CodeSniffer':}
}

