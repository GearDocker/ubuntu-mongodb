#!/bin/bash

for i in `ls /var/tmp/jiffy/*.tar.gz`
do 
    mkdir /var/tmp/jiffy/temp
    tar xvfz $i -C /var/tmp/jiffy/temp
    ln -s /var/tmp/jiffy/temp /var/chef-solo
    /var/chef-solo/run_order
    rm -rf /var/chef-solo
    rm -rf /var/tmp/jiffy/temp
done 
