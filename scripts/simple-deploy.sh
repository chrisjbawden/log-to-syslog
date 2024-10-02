#!/bin/bash
sleep 1
echo ""
echo checking environment ...
echo ""
# Function to check if Docker is installed and running
check_docker() {
    if ! [ -x "$(command -v docker)" ]; then
        echo "Error: Docker is not installed. Please install Docker."
        exit 1
    fi

    if ! sudo systemctl is-active --quiet docker; then
        echo "Error: Docker is not running. Please start Docker."
        exit 1
    fi
}

check_docker

echo ""
# Prompt user for the log directory to monitor
read -p "Enter the path to the log directory to monitor: " log_dir
if [ -z "$log_dir" ]; then
    echo "Error: Log directory is required."
    exit 1
fi

if [ ! -d "$log_dir" ]; then
    echo "Error: Directory does not exist. Please provide a valid directory."
    exit 1
fi
echo ""
# Prompt the user for a name for the Docker instance (default: log-to-syslog)
read -p "Enter the name for the Docker container (default: log-to-syslog): " docker_name
docker_name=${docker_name:-log-to-syslog}

echo ""
# Prompt the user for the syslog server IP (environment variable)
read -p "Enter the syslog server IP: " syslog_server_ip
if [ -z "$syslog_server_ip" ]; then
    echo "Error: Syslog server IP is required."
    exit 1
fi

echo ""

# Start the container with environment variables for the log source and syslog server IP
docker run -d \
  --name "$docker_name" \
  -e LOG_SOURCE="$log_source" \
  -e SYSLOG_SERVER_IP="$syslog_server_ip" \
  -v "$log_dir:/usr/share/logstash/monitor" \
  docker.elastic.co/logstash/logstash:8.15.2 \
  /bin/bash -c "/bin/bash -c "curl -sL https://raw.githubusercontent.com/chrisjbawden/log-to-syslog/refs/heads/main/scripts/deploy.sh | bash""

echo ""
sleep 2

echo "reviewing .. "

echo ""

# Confirm Docker run success
if [ $? -eq 0 ]; then
    echo "Docker container '$docker_name' started successfully with the configuration!"
else
    echo "Error: Failed to start Docker container."
fi


