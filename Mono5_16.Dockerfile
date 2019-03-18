FROM mono:5.16

RUN apt-get update \
  && apt-get install -y curl apt-transport-https \
  && apt-get install -y --no-install-recommends gnupg dirmngr \
  && export GNUPGHOME="$(mktemp -d)" \
  # Import the public repository GPG keys
  && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
  # Register the Microsoft Product feed
  && sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/microsoft.list' \
  && apt-get update \
  && apt-get install -y powershell \
  && gpgconf --kill all \
  && rm -rf "$GNUPGHOME" \
  && apt-get purge -y --auto-remove gnupg dirmngr \
  && rm -rf /var/lib/apt/lists/* /tmp/*
