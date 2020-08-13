#!/bin/sh
set -e

# prepend ansible-playbook to any command
set -- ansible-playbook "$@"

mkdir -p ~/.ssh
ssh-keyscan -p $TUNNEL_PORT $TUNNEL_HOST >> ~/.ssh/known_hosts

eval $(ssh-agent -s)
# this command exposes private key to the job output,
# should be refactored into the hidden variable
echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add -

echo "$ANSIBLE_VAULT_PASSWORD" > .vault && echo "Ansible password created"

export ANSIBLE_VAULT_PASSWORD_FILE=.vault

exec "$@"
