#Group: Base
#file: /opt/jiffy/gary/Public/Configs/Base/CHROOTFILES/root
#version: 2
#file_check_hash: 32799931427e8c5693c11223ae846fdb
#file_ref_hash: afc5499d01e0937f7860920b5c9e0f7f
directory '/root' do
    owner 'root'
    group 'root'
    mode '0755'
end

#Group: Base
#file: /opt/jiffy/gary/Public/Configs/Base/CHROOTFILES/etc
#version: 2
#file_check_hash: b7ad2889ee5c66bfc49de60a6bba8746
#file_ref_hash: 598d1c258926858ce239b6cf00df85bf
directory '/etc' do
    owner 'root'
    group 'root'
    mode '0755'
end

#Group: Base
#file: /opt/jiffy/gary/Public/Configs/Base/CHROOTFILES/bin
#version: 2
#file_check_hash: 32abf0333b8746d1b52fef1a238b3c17
#file_ref_hash: 3ef732f43f29ab2453f47fe4c8d6db67
directory '/bin' do
    owner 'root'
    group 'root'
    mode '0755'
end

#Group: Base
#file: /opt/jiffy/gary/Public/Configs/Base/CHROOTFILES/etc/security
#version: 2
#file_check_hash: 2e1f0a6701950c3365e8f8f15b7b6046
#file_ref_hash: c5299357ce105754e56de16b8522664a
directory '/etc/security' do
    owner 'root'
    group 'root'
    mode '0755'
end

#Group: Base
#file: /opt/jiffy/gary/Public/Configs/Base/CHROOTFILES/root/.bashrc
#version: 2
#file_check_hash: c3aaa3e2f77c162f86060a1a8a4979ae
#file_ref_hash: 227b9bbeb5ccab4d321e0de5ebb6c2ea
#md5sum_file: a3ddd76b952379d242caca163413a96e
#filename: .bashrc 
cookbook_file '/root/.bashrc' do
    source 'a3ddd76b952379d242caca163413a96e'
    owner 'root'
    group 'root'
    mode '0644'
end

#Group: Base
#file: /opt/jiffy/gary/Public/Configs/Base/CHROOTFILES/etc/DIR_COLORS.xterm
#version: 2
#file_check_hash: f25c78bbfb49b6123c8e855ee1e6a027
#file_ref_hash: 83aed4d5ae94baba700b71f5cf7b868a
#md5sum_file: 1ac93d69e495d5d8f0e9f82037708630
#filename: DIR_COLORS.xterm 
cookbook_file '/etc/DIR_COLORS.xterm' do
    source '1ac93d69e495d5d8f0e9f82037708630'
    owner 'root'
    group 'root'
    mode '0644'
end

#Group: Base
#file: /opt/jiffy/gary/Public/Configs/Base/CHROOTFILES/etc/bashrc
#version: 2
#file_check_hash: ed77880df3dc8d050b922e17d5f52965
#file_ref_hash: 74de76a39caac9b92a408b7063a26426
#md5sum_file: debabb0bc17d7af87149e819d80f2394
#filename: bashrc 
cookbook_file '/etc/bashrc' do
    source 'debabb0bc17d7af87149e819d80f2394'
    owner 'root'
    group 'root'
    mode '0644'
end

#Group: Base
#file: /opt/jiffy/gary/Public/Configs/Base/CHROOTFILES/etc/profile
#version: 2
#file_check_hash: 6ab46b4cce34e3c293993e6e885a8ceb
#file_ref_hash: 49bee89a45596e928fa00246639f8bcb
#md5sum_file: fcee290469dad1e8d79bd1cf13ccb524
#filename: profile 
cookbook_file '/etc/profile' do
    source 'fcee290469dad1e8d79bd1cf13ccb524'
    owner 'root'
    group 'root'
    mode '0644'
end

#Group: Base
#file: /opt/jiffy/gary/Public/Configs/Base/CHROOTFILES/etc/security/limits.conf
#version: 2
#file_check_hash: 5c2e11bb9c9caaace977fb2071a09919
#file_ref_hash: d4030f153dfabd3b4e332025ef184522
#md5sum_file: 698a10d30da17f2d5ca41a742cc0d4ea
#filename: limits.conf 
cookbook_file '/etc/security/limits.conf' do
    source '698a10d30da17f2d5ca41a742cc0d4ea'
    owner 'root'
    group 'root'
    mode '0644'
end

#Group: Base
#file: /opt/jiffy/gary/Public/Configs/Base/CHROOTFILES/bin/runurl
#version: 2
#file_check_hash: 8887588740ab70f7b1b58c1ab208baa1
#file_ref_hash: fd2a4d0a8988db4ef330547991941603
#md5sum_file: 799c301ca14d04f6999b9e2692451402
#filename: runurl 
cookbook_file '/bin/runurl' do
    source '799c301ca14d04f6999b9e2692451402'
    owner 'root'
    group 'root'
    mode '0755'
end

