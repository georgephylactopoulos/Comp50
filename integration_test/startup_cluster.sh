
erl < start_master.erl -sname master@localhost -master_name master -setcookie magic &

sleep 2

erl < start_monitor.erl -sname monitor -master_node master@localhost -master_name master -refresh_rate 100 -setcookie magic &
erl < start_health_check.erl -sname health -master_node master@localhost -master_name master -refresh_rate 1000 -copies 3 -setcookie magic > integration_test/health_output.txt &

erl < start_tablet.erl -sname t1@localhost -master_node master@localhost -master_name master -tablet_name t1 -setcookie magic &
erl < start_tablet.erl -sname t2@localhost -master_node master@localhost -master_name master -tablet_name t2 -setcookie magic &
erl < start_tablet.erl -sname t3@localhost -master_node master@localhost -master_name master -tablet_name t3 -setcookie magic &

