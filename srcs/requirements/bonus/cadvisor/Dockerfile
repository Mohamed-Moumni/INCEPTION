FROM    debian:buster

RUN apt update && apt install -y wget

RUN wget https://github.com/google/cadvisor/releases/download/v0.47.0/cadvisor-v0.47.0-linux-amd64

RUN mv cadvisor-v0.47.0-linux-amd64 cadvisor
# Install Cadvisor
RUN chmod +x cadvisor

# Set the entrypoint
CMD [ "./cadvisor" ]
