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

file '/etc/motd' do
  action :create
  content "This server is the property of Chef."
  owner 'root'
  group 'root'
  mode '0644'
end

service 'ntpd' do
  action [ :enable, :start]
end
