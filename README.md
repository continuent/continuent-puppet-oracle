continuent-oracle
=================

A puppet module to configure Oracle that is compatible with Tungsten. This module pulls heavily from the https://github.com/agileinsider/oracle-in-a-box project.

This module will install either Oracle 11g or Oracle 12c. It requires the following packages from Oracle Technet to work. These must be in the location specfied by $installFiles

if ($oracle::oracleVersion == '11')
{
  $package1='linux.x64_11gR2_database_1of2.zip'
  $package2='linux.x64_11gR2_database_2of2.zip'
}
if ($oracle::oracleVersion == '12')
{
  $package1='linuxamd64_12c_database_1of2.zip'
  $package2='linuxamd64_12c_database_2of2.zip'
}


# Logging into Oracle

    $> sudo su - oracle
    $> sqlplus / as sysdba
