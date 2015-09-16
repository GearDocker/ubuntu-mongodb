#execute "apt-get-update" do
#  command "apt-get update"
#  ignore_failure true
#  action :nothing
#end
#
#package "update-notifier-common" do
#  notifies :run, resources(:execute => "apt-get-update"), :immediately
#end
#
#execute "apt-get-update-periodic" do
#  command "apt-get update"
#  ignore_failure true
#  only_if do
#   File.exists?('/var/lib/apt/periodic/update-success-stamp') &&
#   File.mtime('/var/lib/apt/periodic/update-success-stamp') < Time.now - 86400
#  end
#end

package "python-setuptools"

%w{
pymongo
}.each do |pkg|
  easy_install_package pkg do
    action :install
  end
end

pkg_temp = "/var/tmp/sleepy.mongoose"

git pkg_temp do
  repository "https://github.com/10gen-labs/sleepy.mongoose.git"
  action :sync
end

execute "install sleep mongoose" do
  command "python setup.py install"
  cwd pkg_temp
  #not_if { File.exists?(installed_file_path) }
end


