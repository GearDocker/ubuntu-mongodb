#Group: Ubuntu/Mongo/Install
#file: /opt/jiffy/gary/Public/Configs/Ubuntu/Mongo/Install/CHROOTFILES/test.txt
#version: 2
#file_check_hash: 85805b97de809f69fdd4c9dcf510a37b
#file_ref_hash: faae3a3a750300550173d653266ed852
#md5sum_file: d8e8fca2dc0f896fd7cb4cb0031ba249
#filename: test.txt 
cookbook_file '/test.txt' do
    source 'd8e8fca2dc0f896fd7cb4cb0031ba249'
    owner 'root'
    group 'root'
    mode '0644'
end

