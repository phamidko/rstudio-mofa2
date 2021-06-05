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

export RENV_VERSION=0.13.2
R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

R -e "\
  if (!requireNamespace('BiocManager', quietly = TRUE)) install.packages('BiocManager', repos = 'https://cran.r-project.org'); \
  sapply(c('GenomeInfoDbData','GO.db','TFBSTools','Rsamtools','rhdf5', 'dplyr', 'tidyr', 'reshape2', 'pheatmap', 'corrplot', 'ggplot2', 'ggbeeswarm', 'scales', 'GGally', 'doParallel', 'RColorBrewer','cowplot', 'ggrepel', 'foreach', 'reticulate', 'HDF5Array', 'DelayedArray','ggpubr', 'forcats', 'Rtsne', 'uwot','systemfonts', 'ragg', 'Cairo', 'ggrastr', 'basilisk', 'mvtnorm'),BiocManager::install); \
  install.packages(c('devtools', 'testthat', 'roxygen2','Seurat','Signac'), repos = 'https://cran.r-project.org'); "
