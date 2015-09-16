name "mongoreplica_attr"
description "mongoreplica_attr"
default_attributes(
   :shared => {
       :config => { 
          :mongo_replica_file => "/opt/shared/configs/mongo.yml"
       },
       :ruby_gems => { 
          :mongo => "1.11.1",
          :bson_ext => "1.11.1",
       }
   }
)

