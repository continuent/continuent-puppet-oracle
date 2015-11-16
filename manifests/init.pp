class oracle ( $installFiles = '/vagrant/downloads',
               $oracleVersion='11',
               $oracleSysPassword='password',
               $oracleSystemPassword='password',
               $oracleSysManPassword='password',
               $oracleAllPassword='password',
               $oracleDBSNMPPassword='password',
               $oraclePdbPassword='password'
              )
{

  $versionSupported=['11','12']
  validate_re($oracleVersion, $versionSupported)

  include oracle::root_config
  include oracle::installer
  include oracle::listener
  include oracle::dbca
  include oracle::config
}
