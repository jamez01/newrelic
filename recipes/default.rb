enable_package "sys-apps/newrelic-sysmond" do
  version node['newrelic']['version']
end

package "sys-apps/newrelic-sysmond" do
  version node['newrelic']['version']
  action :install
end

template '/etc/newrelic/nrsysmond.cfg' do
  source 'nr.conf.erb'
  action :create
  variables({ :license_key => node['newrelic']['license'] })
  notifies :restart, resources(:service => ['newrelic-sysmond'], :delayed)
end

