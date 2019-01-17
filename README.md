# puppet-sonar

Puppet manifest to install and configure sonar

[![Build Status](https://secure.travis-ci.org/icalvete/puppet-sonar.png)](http://travis-ci.org/icalvete/puppet-sonar)

See [SonarQube site](https://github.com/icalvete/puppet-sonar.git)

## Requires:

* [hiera](http://docs.puppetlabs.com/hiera/1/index.html)
* https://github.com/puppetlabs/puppetlabs-java 

```puppet

  include ::java

  include sonar
  include sonar::scanner
```

```puppet
  class {'sonar':
  admin_pass => '******',
  db_host    => $sonar_db_host,
  db         => $sonar_db,
  db_user    => $sonar_db_user,
  db_pass    => $sonar_db_pass,
  xmx        => '2560',
  xms        => '1024',
  require    => [Mysql::User[$sonar_db_user], Mysql::Db[$sonar_db]]
}
```

**sonar-scanner.properties example**

Put the file with your code.

```
#Configure here general information about the environment, such as SonarQube server connection details for example
#No information about specific project should appear here

#----- Default SonarQube server
sonar.host.url=http://localhost:9999

#----- Default source code encoding
#sonar.sourceEncoding=UTF-8

# must be unique in a given SonarQube instance
sonar.projectKey=my:project
# this is the name and version displayed in the SonarQube UI. Was mandatory prior to SonarQube 6.1.
sonar.projectName=My Project
sonar.projectVersion=1.0

# Path is relative to the sonar-project.properties file. Replace "\" by "/" on Windows.
# This property is optional if sonar.modules is set.
sonar.sources=.
sonar.exclusions=vendor/**,storage/**,apps/**
```

**Apache vhost example to use it as proxy**

```
<IfModule mod_ssl.c>
<VirtualHost *:443>
  ServerName sonar.example.net

  #Enable SSL proxy
  SSLProxyEngine On
  SSLProxyVerify none
  SSLProxyCheckPeerCN off
  SSLProxyCheckPeerName off
  SSLProxyCheckPeerExpire off

  ProxyPass / http://127.0.0.1:9999/
  ProxyPassReverse / https://sonar.example.com/

  SSLEngine on
  SSLCertificateFile    /etc/ssl/certs/server.crt
  SSLCertificateKeyFile /etc/ssl/private/server.key
  SSLProtocol             all -SSLv2 -SSLv3
  SSLCipherSuite          ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA:ECDHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-RSA-AES256-SHA256:DHE-RSA-AES256-SHA:ECDHE-ECDSA-DES-CBC3-SHA:ECDHE-RSA-DES-CBC3-SHA:EDH-RSA-DES-CBC3-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:DES-CBC3-SHA:!DSS
  SSLHonorCipherOrder     on
  SSLCompression          off

  # HSTS (mod_headers is required) (15768000 seconds = 6 months)
  Header always set Strict-Transport-Security "max-age=15768000"

</VirtualHost>
</IfModule>
```

## Authors:

Israel Calvete Talavera <icalvete@gmail.com>
