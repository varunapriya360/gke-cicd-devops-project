FROM jenkins/jenkins:lts

USER root

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release \
    docker.io \
    kubectl \
    && rm -rf /var/lib/apt/lists/*

# Install gcloud
RUN curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg \
 && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" \
    > /etc/apt/sources.list.d/google-cloud-sdk.list \
 && apt-get update \
 && apt-get install -y google-cloud-cli \
 && rm -rf /var/lib/apt/lists/*

USER jenkins
