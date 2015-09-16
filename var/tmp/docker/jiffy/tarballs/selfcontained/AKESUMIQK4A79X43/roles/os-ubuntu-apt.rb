name "os-ubuntu-apt"
description "apt_update"
override_attributes(
   :apt => {
       :unattended_upgrades => {
           :auto_fix_interrupted_dpkg => true
       }
   }
)
