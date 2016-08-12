include_recipe "monit"

package 'postgresql-client'

monitrc "test_docker_haproxy_postgresql-client"
monitrc "test_docker_pgbouncer_postgresql-client"