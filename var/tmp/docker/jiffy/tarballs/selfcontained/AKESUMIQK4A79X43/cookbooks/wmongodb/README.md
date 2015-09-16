wmongodb
========

Wrapper Cookbook for mongodb

node[:mongodb][:package_version] - Version of the MongoDB package to install, default is nil
node['mongodb']['config']['replSet'] - Define name of replicaset
node[:mongodb][:cluster_name] - Name of the cluster, all members of the cluster must reference to the same name, as this name is used internally to identify all members of a cluster.
node[:mongodb][:replica_priority] - Node priority.







mongodb::replicaset
