class oracle {
  include oracle::root_config
  include oracle::installer
  include oracle::listener
  include oracle::dbca
}