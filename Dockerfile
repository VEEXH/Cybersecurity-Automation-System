# Use Ubuntu as the base image
FROM ubuntu:latest

# Update the system and install the necessary packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    ansible \
    sudo \
    curl

# Install the Kubernetes command-line tool (kubectl)
RUN curl -LO https://dl.k8s.io/release/v1.22.0/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

# Copy the Ansible playbook, the Linux hardening script, and the Python script to the image
COPY playbook.yml /home/playbook.yml
COPY harden.sh /home/harden.sh
COPY automate.py /home/automate.py

# Set the working directory to /home
WORKDIR /home

# Run the Ansible playbook, the Linux hardening script, and the Python script when the container starts
CMD ["sh", "-c", "ansible-playbook playbook.yml && ./harden.sh && python3 automate.py"]
