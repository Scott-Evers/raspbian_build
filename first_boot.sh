#!/bin/bash

# run this script as 'sudo /bin/bash first_boot.sh --branch=branch_name'


# parse arguments
for i in "$@"
do
    case $i in
        -u=*|--url=*)
        BRANCH="${i#*=}"
        shift # past argument=value
        ;;
        *)
            echo "Invalid argument specified: ${i}"  # unknown option
        ;;
    esac
done
if [[ -z "$BRANCH" ]]; then
    echo "ERROR: branch not specified"
    exit -1
fi
echo "Github branch name  = ${BRANCH}"


#update the OS with the latest BRANCHs and upgrade packages
apt update
apt upgrade -y

#install ansible and git
apt install ansible git -y

# download ansible playbook
git clone 

# run playbook
echo "Running Ansible playbook with version $(ansible --version)"