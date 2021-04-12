# Puppet manifest to create server and add custom header
exec { 'update':
  command => 'apt-get update',
  path    => '/usr/bin/:/bin/',
}

package { 'nginx':
  ensure  => installed,
  require => Exec['update'],
}

file_line { 'new_header':
  ensure  => 'present',
  path    => '/etc/nginx/sites-available/default',
  after   => 'listen 80 default_server;',
  line    => 'add_header X-Served-By $hostname;',
  require => Package['nginx'],
}

exec { 'restart':
  command => 'sudo service nginx restart',
  path    => '/usr/bin/:/usr/sbin/',
}
