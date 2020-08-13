# Ansible runner docker image

Designed to run for Oxid deployment pipeline

Variables required:

- ANSIBLE_VAULT_PASSWORD for ansible vault password
- SSH_PRIVATE_KEY for remote host connection
- TUNNEL_HOST for jump host name
- TUNNEL_PORT for jump host port

Example
```
docker run -v $(pwd):/app -e SSH_PRIVATE_KEY=$SSH_PRIVATE_KEY  -e ANSIBLE_VAULT_PASSWORD=$ANSIBLE_VAULT_PASSWORD -e  ANSIBLE_HOST_KEY_CHECKING=False --rm mprokopov/oxid-ansible-runner -i app/inventories/staging/hosts.ini app/deploy.yml -e='build_id=c1d51c766830ff9041c1f75f9ca06d753c64ea5d'```
