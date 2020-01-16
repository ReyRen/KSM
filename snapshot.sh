#!/bin/bash

if [ $# -eq 0 -o $# -gt 1 ];
then
	echo "Usage: Need a KVM domain!"
	exit 1
else
	echo "List current snapshot under: $1"
	virsh snapshot-list $1
fi
read -p "Do you want to create[c] or delete[d]:" REPLACE
case $REPLACE in
	[cC])
		REPLACE="create"
		echo "create a snapshot for $1"
		;;
	[dD])
		REPLACE="delete"
		echo "delete a snapshot for $1"
		;;
	*)
	echo "Input error, should be [c/d]."
	exit 1
esac

if [ $REPLACE == "create" ]
then
	read -p "Please give a snap name you want to create:" SNAPNAME
	read -p "Please give a short description you want to note:" DESCRIPTION
	echo "It will take for a few minutes....."
	sudo virsh snapshot-create-as --domain $1 --name $SNAPNAME --description $DESCRIPTION
	virsh snapshot-list $1
else
	...
fi

# create a snapshot
#virsh 
