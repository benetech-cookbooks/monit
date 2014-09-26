directory node['monit']['conf_base'] do
  owner 'root'
  group 'root'
  mode 0755
  action :create
end

execute "cat /etc/ssl/certs/ssl-cert-snakeoil.pem /etc/ssl/private/ssl-cert-snakeoil.key > #{node['monit']['conf_base']}/monit.pem" do
  not_if { File.exists?("#{node['monit']['conf_base']}/monit.pem")} # This is not run inside /myapp
end

file "#{node['monit']['conf_base']}/monit.pem" do
  owner 'root'
  group 'root'
  mode 0600
  action :create
end