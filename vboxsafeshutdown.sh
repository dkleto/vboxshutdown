#!/bin/bash

# Quick script to safely shutdown VMs by saving their state. This script 
# will be run as part of the shutdown script to avoid corrupting the VMs.

for vm in $(vboxmanage list runningvms | sed s/\"//g | sed s/{.*}//)
    do 
        echo Saving state of $vm 
        vboxmanage controlvm $vm savestate
    done

vmlist=$(vboxmanage list runningvms | sed s/\"//g | sed s/{.*}//)

echo $vmlist
