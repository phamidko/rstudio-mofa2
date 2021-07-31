install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))
remotes::install_github('rstudio/renv@0.13.2')

install.packages("BiocManager", repos="https://cran.rstudio.com")
BiocManager::install(version="3.12", update=TRUE, ask=FALSE)

BiocManager::install('devtools')

sapply(c('BiocStyle','GenomeInfoDbData','GO.db','TFBSTools','Rsamtools','rhdf5', 'dplyr', 'tidyr', 'reshape2', 'pheatmap', 'corrplot', 'ggplot2', 'ggbeeswarm', 'scales', 'GGally', 'doParallel', 'RColorBrewer','cowplot', 'ggrepel', 'foreach', 'reticulate', 'HDF5Array', 'DelayedArray','ggpubr', 'forcats', 'Rtsne', 'uwot','systemfonts', 'ragg', 'Cairo', 'ggrastr', 'basilisk', 'mvtnorm'),BiocManager::install)
install.packages(c('hdf5r','rmarkdown', 'testthat', 'roxygen2','Seurat','Signac'), repos = 'https://cran.r-project.org')