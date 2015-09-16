#
# Cookbook Name:: mongodb
# Recipe:: replicaset_yml
#
# Copyright 2014, Gary Leong
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "mongodb"
include_recipe "mongodb::mongo_gem"

#node.set['mongodb']['is_replicaset'] = true
#node.set['mongodb']['cluster_name'] = node['mongodb']['cluster_name']

service "mongod" do
  supports :restart => true, :reload => true
  action [:enable, :start]
end

unless node['mongodb']['is_shard']

  Chef::Log.info "Configuring replicaset with mongo nodes specified in yml file ..."

  #Making a libary call to read yml file and see if there are any members
  replicaset,replica_name,members = Chef::ResourceDefinitionList::ReplicaHelper.replicaset_members(node)

  Chef::Log.info "Node info is #{replicaset} ... "
  Chef::Log.info "Replica name is #{replica_name} ... "
  Chef::Log.info "Replica members are #{members} ... "

  if replicaset

     mongos_replica = []
     id = 0
     members.each do |member|
       id += 1
       fqdn = member["fqdn"]
       hostname = member["hostname"]
       port = member["mongodb"]["config"]["port"] 
       replica_name = member["mongodb"]["replica_name"]
       Chef::Log.info "mongodb replica_name: #{replica_name}, id: #{id}, fqdn: #{fqdn}, port: #{port}"

       replica = {}
       replica[:ip]   = fqdn
       replica[:port] = port
       replica[:id]   = id
       mongos_replica << replica
 
       if node["hostname"] == hostname
         Chef::Log.info "mongod.conf changed for: #{node["hostname"]} == #{hostname}"
         template node[:mongodb][:dbconfig_file] do
           source "mongodb.simple.repl.conf.erb"
           mode 0644
           owner "root"
           group "root"
           variables(
             :replica_name => replica_name
           )
           notifies :restart, "service[mongod]"
         end
       end
     end

     Chef::ResourceDefinitionList::MongoDB.configure_replicaset(node,replica_name,members)
     execute "sleep 120" do
       command "sleep 120"
       action :run
     end
     Chef::ResourceDefinitionList::MongoDB.configure_replicaset(node,replica_name,members)
  else
     Chef::Log.warn "No nodes found for a replica set ..."
  end

end

