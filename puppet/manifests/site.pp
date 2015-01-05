class { 'java':
  distribution => 'jdk',
}

#from https://ask.puppetlabs.com/question/6640/warning-the-package-types-allow_virtual-parameter-will-be-changing-its-default-value-from-false-to-true-in-a-future-release/

if versioncmp($::puppetversion,'3.6.1') >= 0 {

  $allow_virtual_packages = hiera('allow_virtual_packages',false)

  Package {
    allow_virtual => $allow_virtual_packages,
  }
}

node 'cc' {
  include java
  class { 'hadoop::cluster::master':
    format_namenode => 'yes',
    launch_dfs => 'yes',
    launch_yarn => 'yes',
    launch_history_server => 'yes',
  }
}

node 'nc1', 'nc2' {
  include java
  include hadoop::cluster::slave
}

