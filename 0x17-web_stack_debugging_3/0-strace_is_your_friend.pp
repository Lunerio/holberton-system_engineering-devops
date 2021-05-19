# shall it be the comment here....
exec { 'replace_line':
  command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php; sudo service apache2 restart',
  path    => '/bin'
}
