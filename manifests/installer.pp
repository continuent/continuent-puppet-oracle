class continuent_oracle::installer {
  include continuent_oracle::params
  include continuent_oracle::root_config
  
  Exec { path => ['/usr/local/sbin', '/usr/sbin', '/sbin', '/usr/local/bin', '/usr/bin', '/bin'] }
	
	Class['continuent_oracle::root_config'] ->
	
  file {'/app/oracle/install':
    owner => 'oracle',
    group => 'oinstall',
    mode => 0770,
    ensure => directory,
  } ->
  
  exec {'unzip_installer':
    command => 'unzip -o /vagrant/downloads/linux.x64_11gR2_database_1of2.zip -d /app/oracle/install; unzip -o /vagrant/downloads/linux.x64_11gR2_database_2of2.zip -d /app/oracle/install',
    cwd => '/vagrant/downloads',
    user => 'oracle',
    group => 'oinstall',
    creates => '/app/oracle/install/database',
    provider => 'shell',
  } ->
  
  file {'/app/oracle/install/db_install.rsp':
    owner => 'oracle',
    group => 'oinstall',
    mode => 0640,
    source => 'puppet:///modules/continuent_oracle/db_install.rsp',
  } ->
  
  exec {'install_oracle':
    command => '/app/oracle/install/database/runInstaller -silent -ignoreSysPrereqs -ignorePrereq -noconfig -waitforcompletion -responseFile /app/oracle/install/db_install.rsp',
    cwd => '/app/oracle/install/database',
    user => 'oracle',
    group => 'oinstall',
    creates => '/app/oracle/local/product/11.2.0.1.0/db_in_box/root.sh',
    provider => 'shell',
  } ->
  
  exec {'post_install_root':
    command => '/app/oracle/local/product/11.2.0.1.0/db_in_box/root.sh',
    user => 'root',
    group => 'root',
    provider => 'shell',
  } ->
  
  exec {"post_install_cleanup":
    command => 'rm -Rf /app/oracle/install/database/*',
    user => 'root',
    group => 'root',
    provider => 'shell',
  }
}