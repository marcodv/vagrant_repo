class install_apache::service 
{
service { $package_to_install:
	ensure => "running",
	enable => "true",
	require => Package[$package_to_install]
}
}