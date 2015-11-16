class oracle::dbca {
  include oracle::listener

  Exec { path => ['/usr/local/sbin', '/usr/sbin', '/sbin', '/usr/local/bin', '/usr/bin', '/bin', '/app/oracle/local/product/11/db_1/bin'] }

	Class['oracle::listener'] ->

  file {'/app/oracle/install/dbca.rsp':
    owner => 'oracle',
    group => 'oinstall',
    mode => 0640,
    source => "puppet:///modules/oracle/$oracle::oracleVersion/dbca.rsp",
  } ->

  exec {'create_database':
    command => "/app/oracle/local/product/$oracle::oracleVersion/db_1/bin/dbca  -silent -responseFile /app/oracle/install/dbca.rsp; touch /app/oracle/install/dbca.complete",
    cwd => '/app/oracle/install',
    user => 'oracle',
    group => 'oinstall',
    creates => '/app/oracle/local/admin/oracle/pfile',
    provider => 'shell',
    timeout => 1200,
  } ->

  file {'/etc/oratab':
    owner => 'oracle',
    group => 'oinstall',
    mode => 0664,
    content => template('oracle/oratab.erb'),
  } ->

  file {'/etc/rc.d/init.d/oracle':
    owner => 'root',
    group => 'root',
    mode => 0755,
    content => template('oracle/init.oracle.erb')
  } ->

  exec {'register_oracle_startup_script':
    command => '/sbin/chkconfig --add oracle; /sbin/chkconfig oracle on',
    user => root,
  } ->

  exec {'start_oracle':
    command => '/etc/rc.d/init.d/oracle start',
    user => 'root',
    creates => '/var/lock/subsys/oracle',
  }
}
