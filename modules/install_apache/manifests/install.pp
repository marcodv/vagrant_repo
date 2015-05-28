class install_apache::install
{
package { "httpd":
	ensure => "installed"
}
}