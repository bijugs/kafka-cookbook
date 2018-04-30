#
# Cookbook Name:: kafka
# Recipe:: _defaults
#

unless node['kafka']['gc_log_opts']
  node.default['kafka']['gc_log_opts'] = %W[
    -Xloggc:#{::File.join(node['kafka']['log_dir'], 'kafka-gc-pid-$$-$(hostname)-$(date +\'%Y%m%d%H%M\').log')}
    -XX:+UseGCLogFileRotation
    -XX:NumberOfGCLogFiles=20
    -XX:GCLogFileSize=20M
    -XX:+PrintGCDateStamps
    -XX:+PrintGCTimeStamps
  ].join(' ')
end

unless node['kafka']['config_dir']
  node.default['kafka']['config_dir'] = ::File.join(node['kafka']['install_dir'], 'config')
end

unless node['kafka']['version_install_dir']
  node.default['kafka']['version_install_dir'] = %(#{node['kafka']['install_dir']}-#{node['kafka']['version']})
end
