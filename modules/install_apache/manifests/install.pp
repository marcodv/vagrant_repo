class install_apache::install
{
case $::osfamily {
		RedHat: {
			$package_to_install = 'httpd'
			}
			Debian: {
			$package_to_install = 'apache'
			}
			}
			package { $package_to_install:
				ensure => "installed"
			}

}