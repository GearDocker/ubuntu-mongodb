require 'chef/node'
require 'yaml'
require 'chef/mixin/shell_out'

class Chef::ResourceDefinitionList::ReplicaHelper

  def self.read_replica_yml(node)
    yaml_file = node["shared"]["config"]["mongo_replica_file"]
    raw_config = File.read(yaml_file)
    instances = YAML.load(raw_config)
  end

  # create array of node objects for replica set
  def self.replicaset_members(node)
    
    replica_name = nil

    begin
       instances = self.read_replica_yml(node)
    rescue
       Chef::Log.warn "Cannot retrieve info from #{node["shared"]["config"]["mongo_replica_file"]}"
       instances = nil
    end

    priority = 500
    members = []

    unless instances.nil?
      instances.each do |name, instance|
        priority -= 5
        member = Chef::Node.new
        member.name(name)
        new_replica_name = instance["cluster"]+"_"+instance["instance"]

        if replica_name.nil?
          replica_name = new_replica_name
        else
          if replica_name != new_replica_name
            Chef::Log.error "This name has a different cluster name than the prior node"
          end
        end

        member.default['fqdn'] = instance["ipaddresses"]["private"]
        member.default['ipaddress'] = instance["ipaddresses"]["private"]
        member.default['hostname'] = name

        mongodb_attributes = {
          # here we could support a map of instances to custom replicaset options in the custom json
          'port' => node['mongodb']['port'],
          'config' => { 'port' => node['mongodb']['config']['port'] },
          'replica_name' => replica_name,
          'replica_arbiter_only' => false,
          'replica_build_indexes' => true,
          'replica_hidden' => false,
          'replica_slave_delay' => 0,
          'replica_priority' => priority,
          'replica_tags' => {}, # to_hash is called on this
          'replica_votes' => 1
        }
        member.default['mongodb'] = mongodb_attributes
        members << member
      end
    end

    #We want at least 1 node to create a replicaset or a basis for a replicaset
    members.empty? ? replicaset = false : replicaset = true

    #Chef::Log.info "Troubleshooting node objects that were created for mongo rs"
    #members.each do |member|
    #  fqdn = member["fqdn"]
    #  hostname = member["hostname"]
    #  port = member["mongodb"]["config"]["port"] 
    #  Chef::Log.info "mongodb hostname: #{hostname}, fqdn: #{fqdn}, port: #{port}"
    #end
    #return false,replica_name,members
        
    return replicaset,replica_name,members

  end

end
