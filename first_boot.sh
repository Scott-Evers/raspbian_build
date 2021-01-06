#!/bin/bash

# run this script as 'sudo /bin/bash first_boot.sh --repo=github_repo_name'


# parse arguments
for i in "$@"
do
    case $i in
        -u=*|--url=*)
        REPO="${i#*=}"
        shift # past argument=value
        ;;
        *)
            echo "Invalid argument specified: ${i}"  # unknown option
        ;;
    esac
done
if [[ -z "$REPO" ]]; then
    echo "ERROR: Repo not specified"
    exit -1
fi
echo "Github repo name  = ${REPO}"


#update the OS with the latest repos and upgrade packages
apt update
apt upgrade -y

#install ansible and git
apt install ansible git -y

# download ansible playbook
git clone 

# run playbook
echo "Running Ansible playbook with version $(ansible --version)"