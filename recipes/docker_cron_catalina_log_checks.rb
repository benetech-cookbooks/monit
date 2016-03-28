include_recipe "monit"

require 'json'

golden_key = node.chef_environment

machine_class = node.name.split('.')[0].gsub(/[^a-zA-Z]/, '')
container_name = "#{golden_key}-tomcat-#{machine_class}"

# template "/etc/monit/conf.d/#{check_name}.conf" do
#   owner "root"
#   group "root"
#   mode 0644
#   source check_name + '.conf.erb'
#   variables (
#                 lazy {
#                   {
#                       :check_name => 'docker_' + golden_key + '-tomcat-pipe_container_log',
#                       :log_path => JSON.parse(`docker inspect #{container_name}`)[0]['LogPath'],
#                       :golden_key => golden_key,
#                       :container_name => container_name
#                   }
#                 }
#             )
#   notifies :restart, "service[monit]", :immediately
#   action :create
# end

monitrc 'docker_cron_catalina_log_checks' do
  variables (
                lazy {
                  {
                      :check_name => 'docker_' + golden_key + '-tomcat-pipe_container_log',
                      :log_path => JSON.parse(`docker inspect #{container_name}`)[0]['LogPath'],
                      :golden_key => golden_key,
                      :container_name => container_name
                  }
                }
            )
end