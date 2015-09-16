name "mongodb_attr"
description "mongodb_attr"
override_attributes(
   :mongodb => {
       :package_version => "2.6.4",
       :install_method => "mongodb-org",
	   :password => "oRJ1INL9nImSjexmIu7i",
       :config => {
              :auth => true
		  },
       :admin => {
	      :username => "admin",
	      :password => "oRJ1INL9nImSjexmIu7i"
       }
   }
)
