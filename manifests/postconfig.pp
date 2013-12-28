class sonar::postconfig {

  include mysql::client

  exec {'set_sonar_admin_pass':
    command  => "echo \"UPDATE users SET crypted_password='${sonar::params::admin_pass}' where login='admin'\" | /usr/bin/mysql -h ${sonar::params::db_host} -u${sonar::params::db_user} ${sonar::params::db} -p${sonar::params::db_pass}",
    provider => 'shell',
    user     => 'root',
    unless   => "echo \"SELECT * from users where login='admin'\" | /usr/bin/mysql -h ${sonar::params::db_host} -u${sonar::params::db_user} ${sonar::params::db} -p${sonar::params::db_pass} | /bin/grep ${sonar::params::admin_pass}",
    require  => Class['mysql::client']
  }
}

