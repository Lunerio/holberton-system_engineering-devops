# Edit the ssh config file
exec { 'ssh_pass':
  command => "/usr/bin/sed -i 's:#\s*PasswordAuthentication yes:PasswordAuthentication no:' /etc/ssh/ssh_config",
}
exec { 'ssh_key':
  command => "/usr/bin/echo 'IdentityFile ~/.ssh/holberton' >> /etc/ssh/ssh_config",
}
