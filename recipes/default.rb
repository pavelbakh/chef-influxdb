#
# Cookbook Name:: influxdb
# Recipe:: default
#
# Copyright (C) 2015 SoftDirect Ltd
# Copyright (C) 2015 Pavel Bakhmetev
#
# All rights reserved - Do Not Redistribute
#

platform_provider = case node.platform_family
when 'rhel'
  package_name = node.kernel.machine == 'x86_64' ? "influxdb-#{node[:influxdb][:version]}-1.x86_64.rpm" : "influxdb-#{node[:influxdb][:version]}-1.i686.rpm"
  remote_file "/tmp/#{package_name}" do
    source "#{node[:influxdb][:package_baseurl]}#{package_name}"
    mode 0644
  end

  package "influxdb" do
    action :install
    source "/tmp/#{package_name}"
    provider Chef::Provider::Package::Rpm
  end

else
  Chef::Log.fatal "Not a supported platform family: #{node.platform_family}"
  raise
end

group node['influxdb']['group']

user node['influxdb']['user'] do
  home node['influxdb']['home']
  gid  node['influxdb']['group']
  shell "/bin/bash"
  system true
end

limits_config 'influxdb' do
  limits node.influxdb.limits.inject([]) { |a,(k,v)| a << v; a }
end

template "/opt/influxdb/shared/config.toml" do
  source "config.toml.erb"
  owner node['influxdb']['user']
  group node['influxdb']['group']
  mode 0644

#  notifies :restart, resources(:service => 'influxdb')
end


service 'influxdb' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
#  subscribes :restart, "template[#{node.influxdb.config_file}]"
end
