class install_apache::service 
{
service { "httpd":
	ensure => "running",
	enable => "true",
	require => Package["httpd"]
}
}