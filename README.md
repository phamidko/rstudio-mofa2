# Rstudio docker container for MOFA+

Multi-Omics Factor Analysis V2 (MOFA+) source https://biofam.github.io/MOFA2/index.html

Docker image
```
docker pull phamiducla/rstudio:latest
docker pull phamiducla/rstudio:jupyter
```
From your host data directory, 
```
docker run  --rm -v ${PWD}:/data -d -p 3787:8787 -e PASSWORD=rstudio1 --name rstudio phamiducla/rstudio:latest

docker run  --rm -v ${PWD}:/data -d -p 3787:8787 8888:8888 -e PASSWORD=rstudio1 --name rstudio phamiducla/rstudio:jupyter
```

You can access to data and files from host to the docker.

go to localhost:3737 in browser and login with rstudio (username) and rstudio1 (password from command argument)


In Rstudio script
```
setRepositories(ind=1:2)
BiocManager::install("MOFA2")

library(Seurat)
library(ggplot2)
library(MOFA2)
```

## Root user
Enter root user passoword from command argument which is rstudio1

```
rstudio@6929df934634:~$ sudo -i
[sudo] password for rstudio:
root@6929df934634:~#
```

