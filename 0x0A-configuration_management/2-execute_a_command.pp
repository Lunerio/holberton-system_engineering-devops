# executes a given command
exec { 'kill':
  command => '/usr/bin/pkill killmenow',
}
