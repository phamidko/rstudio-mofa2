# Rstudio docker container for MOFA+

Multi-Omics Factor Analysis V2 (MOFA+) https://biofam.github.io/MOFA2/index.html

Docker image
```
docker pull phamiducla/rstudio:latest

```
From your host data directory, 
```
docker run  --rm -v ${PWD}:/data -d -p 3787:8787 -p 8888:8888 \
  -e PASSWORD=rstudio1 --name rstudio phamiducla/rstudio:latest

```
You can access to data and files from host to the docker. Windows User must run this command line in Powershell command. 

For Linux user, clone this repository and build docker image. It prevents file premission issue when you attempt to save the files inside container or rstudio. 
```
docker build --pull --no-cache -t <INSERT_IMAGE_TAG> \
  --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) .

```
## Rstudio Login
go to localhost:3787 in browser and login with rstudio (username) and rstudio1 (password from command argument)


In Rstudio script
```
setRepositories(ind=1:2)
sapply(c('BSgenome.Hsapiens.UCSC.hg38'),BiocManager::install)

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

## Jupyter Notebook
From terminal prompt, launch jupyter lab
```
jupyter lab --notebook-dir=/home/rstudio --ip=0.0.0.0 --no-browser --allow-root \
  --port=8888 --NotebookApp.token='' --NotebookApp.password='' --NotebookApp.allow_origin='*' \
  --NotebookApp.base_url=rstudio"
```