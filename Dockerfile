FROM r-base:3.6.0
RUN apt-get update && apt-get install -y \
    vim
