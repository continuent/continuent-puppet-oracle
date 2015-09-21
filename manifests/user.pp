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
  } ->


  user {'oracle':
    password => sha1('password'),
    gid => 'oinstall',
	  managehome => true,
    groups => ['dba'],
    home => '/home/oracle',
  } ->
  file {'/home/oracle/.bash_profile':
    owner => 'oracle',
    group => 'dba',
    mode => '0644',
    content => template('oracle/profile.erb')
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
