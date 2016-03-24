include_recipe "monit"

app_class_webapps = node['bookshare']['tomcat'].keys
httpd_config = node['bookshare']['httpd']

vars = {
    :app_class_webapps => app_class_webapps,
    :httpd_config => httpd_config
}

monitrc "test_docker_tomcat_app_http" do
  variables vars
end