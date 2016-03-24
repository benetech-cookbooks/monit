include_recipe "monit"

golden_key = node.chef_environment
app_class_webapps = node['bookshare']['tomcat'].keys
httpd_config = node['bookshare']['httpd']

vars = {
    :app_class_webapps => app_class_webapps,
    :httpd_config => httpd_config
}

monitrc "test_docker_bookshare-httpd_http" do
  variables vars
end