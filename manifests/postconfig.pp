class sonar::postconfig {

  include mysql::client

  exec {'set_sonar_admin_pass':
    command  => "echo \"UPDATE users SET crypted_password=SHA1(CONCAT('--', salt, '--', '${sonar::admin_pass}\', '--')) WHERE login='admin'\" | /usr/bin/mysql -h ${sonar::db_host} -u${sonar::db_user} ${sonar::db} -p${sonar::db_pass}",
    provider => 'shell',
    user     => 'root',
    require  => Class['mysql::client']
  }
}

