# Rstudio docker container for MOFA+

Multi-Omics Factor Analysis V2 (MOFA+) source https://biofam.github.io/MOFA2/index.html

From your host data directory, 
```
docker run  --rm -v ${PWD}:/data -d -p 3787:8787 -e PASSWORD=rstudio1 --name rstudio phamiducla/rstudio:latest
```
go to localhost:3737 in browser and login with rstudio (username) and rstudio1 (password from command arg)


