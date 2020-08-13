all: Dockerfile
	docker build . -t mprokopov/oxid-ansible-runner

run: Dockerfile
	docker run --rm -it mprokopov/oxid-ansible-runner bash

push: Dockerfile
	docker push mprokopov/oxid-ansible-runner
