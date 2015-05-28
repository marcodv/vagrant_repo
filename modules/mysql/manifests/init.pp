class mysql {

$package_to_install = ["mysql-server", "mysql", "perl-DBD-MySQL", "perl-DBI"]

	package { $package_to_install:
	 ensure => "installed"
	}
	
	service { "mysqld":
	 ensure => "running",
	 require => Package["mysql-server"]
	}	
}