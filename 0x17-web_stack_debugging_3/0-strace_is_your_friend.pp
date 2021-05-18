exec { 'replace_line':
  path    => '/bin',
  command => 'sed -i s/phpp/php/ /var/www/html/wp-settings.php'
}
