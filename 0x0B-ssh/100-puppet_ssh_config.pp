# using Puppet to make changes to ssh configuration file
file_line {'Turn off passwd auth':
    path  => '/etc/ssh/ssh_config',
    line  => '    PasswordAuthentication no',
    match =>  'PasswordAuthentication yes',
}
file_line {'Declare identity file':
    path => '/etc/ssh/ssh_config',
    line => '    IdentityFile ~/.ssh/holberton',
}
