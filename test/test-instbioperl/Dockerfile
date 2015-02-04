# Docker container for installing BioPerl

FROM debian

MAINTAINER Takeru Nakazato, chalkless@gmail.com

RUN apt-get update && \
    apt-get install -y bioperl && \
    rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]

