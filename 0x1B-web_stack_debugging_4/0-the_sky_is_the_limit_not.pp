# This manifest runs sed on the server to change a value
exec { 'sed_and_restart':
  command => 'sed -i s/15/4096/ /etc/default/nginx; service nginx restart',
  path    => ['/bin', '/usr/bin', '/usr/sbin']
}
