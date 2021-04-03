# Edit lines in ssh config file
include stdlib
file_line { 'add_key':
  path => '/etc/ssh/ssh_config',
  line => 'IdentityFile ~/.ssh/holberton',
}

file_line { 'no_pass':
  path  => '/etc/ssh/ssh_config',
  line  => 'PasswordAuthentication no',
  match => '^#.PasswordAuthentication yes',
}
