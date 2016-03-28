include_recipe "monit"

golden_key = node.chef_environment

machine_class = node.name.split('.')[0].gsub(/[^a-zA-Z]/, '')
container_name = "#{golden_key}-tomcat-#{machine_class}"
log_path =  "/ephemeral-zfs/#{golden_key}-pipe-cron-scheduler-logs/epub3/EPUB3ConverterTask.log"

vars_cron_logs = {
    :check_name => 'docker_' + golden_key + '-tomcat-pipe_scheduler_log',
    :log_path => log_path,
    :golden_key => golden_key,
    :container_name => container_name
}

monitrc 'docker_cron_scheduler_log_checks' do
  variables vars_cron_logs
end