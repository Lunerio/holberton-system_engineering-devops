# Puppet manifest to create server and add custom header
exec { 'http header':
	command  => 'sudo apt-get update -y;
	sudo apt-get install nginx -y;
	sudo sed -i "/server_name _/a add_header X-Served-By $hostname;" /etc/nginx/sites-available/default
	sudo service nginx restart',
}
