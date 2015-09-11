class oracle::config {


  file {'/tmp/archive_log.sh':
    owner => 'root',
    group => 'root',
    mode => 0777,
    source => "puppet:///modules/oracle/archive_log.sh",
  } ->
  exec {'enable_archivelog':
    command => "sudo -u oracle -i /tmp/archive_log.sh",
    cwd => '/tmp',
    group => 'oinstall',
    require => Exec['start_oracle'],
    creates => "/tmp/archivelog.lck",
    provider => 'shell',
    timeout => 0,
  }
}
