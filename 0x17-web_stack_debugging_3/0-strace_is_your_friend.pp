exec { 'replace_line':
  path    => '/bin',
  command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php; sudo service apache2 restart'
}
