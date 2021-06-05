#!/bin/bash
set -e

echo "Jupyter Script ......................................................................."
# Install jupyter proxies for VS Code and RStudio
pip3 install jupyter && \
  pip3 install jupyter-server-proxy && \
  pip3 install jupyter-vscode-proxy && \
  pip3 install jupyter-rsession-proxy && \
  jupyter labextension install @jupyterlab/server-proxy

# Configure container startup
# CMD ["sh","-c", "jupyter lab --notebook-dir=/home/rstudio --ip=0.0.0.0 --no-browser --allow-root --port=8888 --NotebookApp.token='' --NotebookApp.password='' --NotebookApp.allow_origin='*' --NotebookApp.base_url=rstudio"]