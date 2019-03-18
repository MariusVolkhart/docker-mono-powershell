FROM mono:5.10

RUN apt-get update \
  && apt-get install -y curl apt-transport-https \
  # Import the public repository GPG keys
  && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
  # Register the Microsoft Product feed
  && sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-jessie-prod jessie main" > /etc/apt/sources.list.d/microsoft.list' \
  && apt-get update \
  && apt-get install -y powershell \
  && rm -rf /var/lib/apt/lists/* /tmp/*
