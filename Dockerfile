FROM ubuntu:latest
RUN apt-get update && apt-get install -y ansible

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
