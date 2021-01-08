#!/bin/bash

# run this script as 'sudo /bin/bash first_boot.sh --branch=branch_name'


# parse arguments
for i in "$@"
do
    case $i in
        -b=*|--branch=*)
        BRANCH="${i#*=}"
        shift # past argument=value
        ;;
        -r=*|--role=*)
        ROLE="${i#*=}"
        shift # past argument=value
        ;;
        *)
            echo "Invalid argument specified: ${i}"  # unknown option
        ;;
    esac
done
if [[ -z "$ROLE" ]]; then
    echo "ERROR: ROLE not specified"
    exit -1
fi
if [[ -z "$BRANCH" ]]; then
    BRANCH=basic
    echo "INFO: No branch specified.  Defaulting to 'basic'"
fi




#update the OS with the latest BRANCHs and upgrade packages
# apt update        # temporarilty commented for development
# apt upgrade -y        # temporarilty commented for development

#install ansible and git
apt install ansible git -y

# download ansible playbook
echo "Cloning git branch $BRANCH"
git clone --branch $BRANCH git://github.com/Scott-Evers/raspian_build.git

# run playbook
echo "Running Ansible playbook with version $(ansible --version)"
ansible-playbook raspian_build/$ROLE/default.yaml