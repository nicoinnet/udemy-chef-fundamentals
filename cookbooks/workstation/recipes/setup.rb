package 'vim-enhanced'
package 'emacs-nox'
package 'nano'

package 'tree' do
  action :install
end

package 'git' do
  action :install
end

package 'ntp'

#ipaddress = node['ipaddress']
#totalMemory = node['memory']['total']
#hostname = node['hostname']

file '/etc/motd' do
  action :create
  content "This server is the property of Chef.
  HOSTNAME: #{node['hostname']}
  IPADDRESS: #{node['ipaddress']}
  CPU: #{node['cpu']['0']['mhz']}
  MEMORY: #{node['memory']['total']}
"
  owner 'root'
  group 'root'
  mode '0644'
end

service 'ntpd' do
  action [ :enable, :start]
end
