monit "mongodb" do
  pidfile "/var/lib/mongodb/mongod.lock"
  start "/etc/init.d/mongodb start"
  stop "/etc/init.d/mongodb stop"
  conditions [
      "if cpu > 90% for 5 cycles then restart",
      "if 5 restarts within 5 cycles then timeout"
  ]
end

cookbook_file "/etc/monit/conf.d/mem_monit" do
  source "mem_monit"
  mode 0644
  owner "root"
  group "root"
  notifies :restart, resources(:service => "monit")
end


