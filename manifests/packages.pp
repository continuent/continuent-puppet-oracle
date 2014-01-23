class continuent_oracle::packages {
  package {'binutils':
    ensure => installed
  }

  package {'compat-libcap1':
    ensure => installed
  }

  package {'compat-libstdc++-33':
    ensure => installed
  }

  package {'elfutils-libelf':
    ensure => installed
  }

  package {'glibc':
    ensure => installed
  }

  package {'glibc-common':
    ensure => installed
  }

  package {'gcc':
    ensure => installed
  }

  package {'gcc-c++':
    ensure => installed
  }

  package {'libaio':
    ensure => installed
  }

  package {'make':
    ensure => installed
  }

  package {'sysstat':
    ensure => installed
  }

  package {'unixODBC':
    ensure => installed
  }

  package {'unzip':
    ensure => installed
  }
}