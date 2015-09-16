#!/bin/bash

locale-gen en_US.UTF-8
dpkg-reconfigure locales
export  LANG=en_US.UTF-8
export  LANGUAGE=en_US
export  LC_ALL=en_US.UTF-8

set -m

cmd="bash"

$cmd 

