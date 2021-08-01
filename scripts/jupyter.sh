#!/bin/bash
set -e

echo "Jupyter Script ......................................................................."

apt-get update && apt-get install -f && apt-get install -y python3 python3-setuptools python3-dev python3-pip
apt-get install -y libcurl4-openssl-dev libssh2-1-dev libxml2-dev zlib1g-dev
apt-get install -y libcairo2-dev libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev libxt-dev libharfbuzz-dev libfribidi-dev

# Using Debian, as root
curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
apt-get install -y nodejs \
    && apt-get clean \
  	&& rm -rf /var/lib/apt/lists/*


# Install jupyter proxies for VS Code and RStudio
pip3 install jupyter && \
  pip3 install jupyter-server-proxy && \
  pip3 install jupyter-vscode-proxy && \
  pip3 install jupyter-rsession-proxy && \
  pip3 install jupyterlab && \
  jupyter labextension install @jupyterlab/server-proxy

# Configure container startup
# CMD ["sh","-c", "jupyter lab --notebook-dir=/home/rstudio --ip=0.0.0.0 --no-browser --allow-root --port=8888 --NotebookApp.token='' --NotebookApp.password='' --NotebookApp.allow_origin='*' --NotebookApp.base_url=rstudio"]