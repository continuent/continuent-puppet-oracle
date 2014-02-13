class oracle::user {
  include oracle::packages
  
	Class['oracle::packages'] ->
	
  group {'dba':
    ensure =>  present
  } ->
  
	group {'oinstall':
    ensure => present
  } ->
  
	file {'/app':
    ensure => directory,
  } ->

  file {'/app/oracle':
    ensure => directory,
    mode => 0775,
  } ->

  file {'/etc/profile.d/oracle.sh':
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/oracle/profile'
  } ->

  user {'oracle':
    password => sha1('password'),
    gid => 'oinstall',
    groups => 'dba',
    home => '/app/oracle',
  } ->

	file {'/app/oracle/data':
    ensure => directory,
    owner => 'oracle',
    group => 'dba',
    mode => 0770,
  } ->

	file {'/app/oracle/local':
    ensure => directory,
    owner => 'oracle',
    group => 'oinstall',
    mode => 0775,
  }
}