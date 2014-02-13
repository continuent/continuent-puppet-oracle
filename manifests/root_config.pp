class oracle::root_config {
  include oracle::params
  include oracle::user
  
  file { '/etc/security/limits.d/10oracle.conf':
    owner => 'root',
    group => 'root',
    mode => '0600',
    source => 'puppet:///modules/oracle/limits.conf'
  }
  
  file { '/etc/oraInst.loc':
    owner => 'oracle',
    group => 'oinstall',
    mode => '0660',
    source => 'puppet:///modules/oracle/oraInst.loc',
    require => Class['oracle::user']
  }

	sysctl { 'kernel.sem':
		ensure => present,
		permanent => yes,
		value => '250 32000 100 128',
	}
	
	sysctl { 'kernel.shmmni':
		ensure => present,
		permanent => yes,
		value => '4096',
	}
	
	sysctl { 'fs.file-max':
		ensure => present,
		permanent => yes,
		value => '6815744',
	}
	
	sysctl { 'fs.aio-max-nr':
		ensure => present,
		permanent => yes,
		value => '1048576',
	}
	
	sysctl { 'net.ipv4.ip_local_port_range':
		ensure => present,
		permanent => yes,
		value => '9000 65500',
	}
	
	sysctl { 'net.core.rmem_default':
		ensure => present,
		permanent => yes,
		value => '262144',
	}
	
	sysctl { 'net.core.rmem_max':
		ensure => present,
		permanent => yes,
		value => '4194304',
	}
	
	sysctl { 'net.core.wmem_default':
		ensure => present,
		permanent => yes,
		value => '262144',
	}
	
	sysctl { 'net.core.wmem_max':
		ensure => present,
		permanent => yes,
		value => '1048576',
	}
}