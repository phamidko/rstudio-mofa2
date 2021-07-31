# Multi-Omics Factor Analysis v2 (MOFA+) https://github.com/bioFAM/MOFA2
# MOFA python installation

apt-get update && apt-get install -f && apt-get install -y python3 python3-setuptools python3-dev python3-pip
apt-get install -y libcurl4-openssl-dev libssh2-1-dev libxml2-dev zlib1g-dev
apt-get install -y libcairo2-dev libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev libxt-dev libharfbuzz-dev libfribidi-dev



python3 -m pip install 'https://github.com/bioFAM/mofapy2/tarball/master'

# TODO Renv 
# On the host 
# export RENV_PATHS_CACHE_HOST=/opt/local/renv/cache
# export RENV_PATHS_CACHE_CONTAINER=/renv/cache
# export RENV_PATHS_CACHE=/renv/cache

# export RENV_VERSION=0.13.2
# # export BIOCONDUCTOR_VERSION=3.12
# R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
# R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

# install all necessary packages
R -f /install_package.R