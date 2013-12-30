class sonar::plugins::cpp (

  $repo_scheme   = $sonar::params::cpp_plugin_repo_scheme,
  $repo_domain   = $sonar::params::cpp_plugin_repo_domain,
  $repo_port     = $sonar::params::cpp_plugin_repo_port,
  $repo_user     = $sonar::params::cpp_plugin_repo_user,
  $repo_pass     = $sonar::params::cpp_plugin_repo_pass,
  $repo_path     = $sonar::params::cpp_plugin_repo_path,
  $repo_resource = $sonar::params::cpp_plugin_package,
  $target        = "${sonar::params::path}/extensions/plugins"

) {

  include sonar::params

  common::down_resource {'sonar_cpp_plugin':
    scheme   => $repo_scheme,
    domain   => $repo_domain,
    port     => $repo_port,
    user     => $repo_user,
    pass     => $repo_pass,
    path     => $repo_path,
    resource => $repo_resource,
    target   => $target
  }
}

