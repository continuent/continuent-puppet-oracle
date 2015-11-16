class oracle::listener {
  include oracle::installer

  Exec { path => ['/usr/local/sbin', '/usr/sbin', '/sbin', '/usr/local/bin', '/usr/bin', '/bin', '/app/oracle/local/product/11/db_1/bin'] }

	Class['oracle::installer'] ->

  file {'/app/oracle/install/netca.rsp':
    owner => 'oracle',
    group => 'oinstall',
    mode => 0640,
    source => "puppet:///modules/oracle/$oracle::oracleVersion/netca.rsp",
  } ->

  exec {'install_listener':
    command => "sudo -u oracle -i /app/oracle/local/product/$oracle::oracleVersion/db_1/bin/netca /silent /responsefile /app/oracle/install/netca.rsp",
    cwd => '/app/oracle/install',
    group => 'oinstall',
    creates => "/app/oracle/local/product/$oracle::oracleVersion/db_1/network/admin/listener.ora",
    provider => 'shell',
    timeout => 0,
  }
}
