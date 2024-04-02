# Pulling Ubuntu image
FROM ubuntu:20.04

# Updating packages and installing cron
RUN apt update && apt install -y curl cron
WORKDIR /app
RUN curl -L https://github.com/cloudquery/cloudquery/releases/download/cli-v5.0.0/cloudquery_linux_arm64 -o cloudquery
RUN chmod a+x cloudquery

# Install docker cli
RUN curl -L https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/arm64/docker-ce-cli_20.10.9~3-0~ubuntu-focal_arm64.deb -o docker-cli.deb
RUN dpkg -i docker-cli.deb

# Adding crontab to the appropriate location
ADD crontab /etc/cron.d/cron-spec

# Giving permission to crontab file
RUN chmod 0644 /etc/cron.d/cron-spec

# Running crontab
RUN crontab /etc/cron.d/cron-spec

# Copying script file into the container
COPY sync.sh /app/sync.sh

# Giving executable permission to the script file
RUN chmod +x /app/sync.sh

# Creating entry point for cron 
ENTRYPOINT ["cron", "-f"]