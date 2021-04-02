# Manifest that creates a file in the given path, with other attributes
file { '/tmp/holberton':
  content => 'I love Puppet',
  owner   => 'www-data',
  group   => 'www-data',
  mode    => '0744',
}
