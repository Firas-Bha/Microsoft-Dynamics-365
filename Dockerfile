# Use the official Business Central image from Microsoft container registry
FROM mcr.microsoft.com/businesscentral/sandbox:latest

# Set environment variables
ENV ACCEPT_EULA=Y
ENV USESSL=N

# Copy your Business Central app files into the container
COPY . /source

# Set the working directory
WORKDIR /source

# Install Business Central Container Helper module and publish the app
RUN Install-Module -Name BCContainerHelper -Force -Scope CurrentUser; \
    Import-Module BCContainerHelper; \
    Get-BcContainerApiVersion -containerName $(hostname); \
    Publish-BcContainerApp -containerName $(hostname) -appFile "Default Publisher_PFEProject_1.0.0.6.app" -sync -install
