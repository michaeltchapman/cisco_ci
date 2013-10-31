package { 'squid-deb-proxy':
  ensure => present
}

service { 'squid-deb-proxy':
  ensure => running,
  enable => true
}

file { '/etc/squid-deb-proxy/squid-deb-proxy.conf':
  content => template('cisco_ci/squid-deb-proxy.conf.erb'),
  require => Package['squid-deb-proxy'],
  notify  => Service['squid-deb-proxy']
}

file {  '/etc/squid-deb-proxy/mirror-dstdomain.acl.d/puppet':
  content => 'apt.puppetlabs.com',
  require => Package['squid-deb-proxy'],
  notify  => Service['squid-deb-proxy']
}

file {  '/etc/squid-deb-proxy/mirror-dstdomain.acl.d/local':
  content => '%{::ipaddress}',
  require => Package['squid-deb-proxy'],
  notify  => Service['squid-deb-proxy']
}

file {  '/etc/squid-deb-proxy/mirror-dstdomain.acl.d/github':
  content => 'github.com',
  require => Package['squid-deb-proxy'],
  notify  => Service['squid-deb-proxy']
}
