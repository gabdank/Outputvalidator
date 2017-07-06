############################################################
# Dockerfile to build output validator 
# Based on Ubuntu 14.04
############################################################

# Set the base image to Ubuntu 14.04
FROM ubuntu:14.04

# File Author / Maintainer
MAINTAINER Idan Gabdank

# Update the repository sources list
# Install base packages: git, python, java
RUN apt-get update && apt-get install -y \
    git \
    python-dev

RUN mkdir image_software

# Get output validator repository
RUN cd /image_software && git clone https://github.com/ottojolanki/Outputvalidator.git
RUN cd /image_software/Outputvalidator && git fetch && git pull

ENTRYPOINT ["python", "/image_software/Outputvalidator/validate_output.py"]