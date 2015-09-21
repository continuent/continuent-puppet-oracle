class oracle ( $installFiles = '/vagrant/downloads',$oracleVersion='11')
{

  $versionSupported=['11','12']
  validate_re($oracleVersion, $versionSupported)

  include oracle::root_config
  include oracle::installer
  include oracle::listener
  include oracle::dbca
  include oracle::config
}
