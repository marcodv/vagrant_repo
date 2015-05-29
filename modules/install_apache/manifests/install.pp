class install_apache::install
{
package { "httpd":
	ensure => "installed"
}
file { "/var/www/html/index.html":
	ensure => present,
	source => "/vagrant/modules/install_apache/files/index.html",
	require => Package["httpd"]
	}
}