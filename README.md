# Rstudio docker container for MOFA+

Multi-Omics Factor Analysis V2 (MOFA+) source https://biofam.github.io/MOFA2/index.html

Docker image
```
docker pull phamiducla/rstudio:latest
```
From your host data directory, 
```
docker run  --rm -v ${PWD}:/data -d -p 3787:8787 -e PASSWORD=rstudio1 --name rstudio phamiducla/rstudio:latest
```

You can access to data and files from host to the docker.

go to localhost:3737 in browser and login with rstudio (username) and rstudio1 (password from command arg)


In Rstudio script

setRepositories(ind=1:2)
BiocManager::install("MOFA2")

library(Seurat)
library(ggplot2)
library(MOFA2)
