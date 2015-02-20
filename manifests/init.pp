class oracle ( $installFiles = '/vagrant/downloads')
{
  include oracle::root_config
  include oracle::installer
  include oracle::listener
  include oracle::dbca
}
