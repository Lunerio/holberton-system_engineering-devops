#This manifest gives more max open files for holberton user
exec { 'max_open_hard' :
  command => 'sed -i s/5/50000/ /etc/security/limits.conf',
  path    => ['/bin', '/usr/bin', '/usr/sbin']
}
exec { 'max_open_soft' :
  command => 'sed -i s/4/50000/ /etc/security/limits.conf',
  path    => ['/bin', '/usr/bin', '/usr/sbin']
}
