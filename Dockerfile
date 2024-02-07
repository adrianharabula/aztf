FROM mcr.microsoft.com/azure-cli:latest

# TERRAFORM ENV VARIABLES
ENV TERRAFORM_VERSION=1.7.2
ENV TERRAFORM_URL "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"

# Install Terraform
RUN wget $TERRAFORM_URL && unzip *.zip && mv terraform /usr/bin/ && rm *.zip

# Install git
RUN apk add git

## Add non-root user and run commands as non-root
ARG USER=nonroot
ENV HOME /home/$USER
RUN adduser -D $USER  
USER $USER
WORKDIR $HOME
