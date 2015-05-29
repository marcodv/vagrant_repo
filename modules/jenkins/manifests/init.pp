class jenkins {
	$packages = ["jenkins", "java-1.7.0-openjdk"]
	package { $packages:
	ensure => "present"
	}
	service { "jenkins":
	ensure => "running",
	require => Package["java-1.7.0-openjdk"],
	require => Package["httpd"]
	}
}