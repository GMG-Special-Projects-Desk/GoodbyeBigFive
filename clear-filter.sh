#!/bin/bash
if [[ $1 == "--help" ]]; then
	echo "This script will clear your PF filter"
    exit 1
fi
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

pfctl -d
pfctl -F all
pfctl -e