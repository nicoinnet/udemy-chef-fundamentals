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

template '/etc/motd' do
  action :create
  source 'motd.erb'
  variables(
      :name => '-- Chef --'
  )
  owner 'root'
  group 'root'
  mode '0644'
end

service 'ntpd' do
  action [ :enable, :start]
end

user 'user1' do
  comment 'user1'
  uid '123'
  home '/home/user1'
  shell '/bin/bash'
end

group 'admins' do
  members 'user1'
  append true
end
