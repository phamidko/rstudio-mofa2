FROM rocker/r-ver:4.0.5

LABEL licenses="GPL-2.0-or-later" \
      source="https://github.com/phamidko" \
      authors="Philip Hamid <phamiduk@gmail.com>"

ENV S6_VERSION=v2.1.0.2
ENV RSTUDIO_VERSION=1.4.1106
ENV PATH=/usr/lib/rstudio-server/bin:$PATH

ARG DEBIAN_FRONTEND=noninteractive
ARG ARG_TIDYVERSE


#
# https://github.com/rocker-org/rocker-versioned2
#
RUN /rocker_scripts/install_rstudio.sh
RUN /rocker_scripts/install_pandoc.sh
# RUN /rocker_scripts/install_tidyverse.sh
# RUN /rocker_scripts/install_python.sh


# additional installation
ADD scripts /
RUN chmod +x /*.sh

RUN /bootstrap.sh
# python, jupyter 
RUN /jupyter.sh 
RUN /scRNA-python.sh

# installing R packages related to mofa2
RUN /mofa2.sh

# Linux Write permission issue in mounted path. Add current user/group in build process.
# Must build with
# docker build -t <image_tag> --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) .
ARG USER_ID
ARG GROUP_ID
RUN addgroup --gid $GROUP_ID user
RUN usermod -aG user rstudio


EXPOSE 8787
EXPOSE 8888

# tag jupyter image 
# http://127.0.0.1:8888/rstudio/lab
#CMD ["jupyter lab --notebook-dir=/home/rstudio --ip=0.0.0.0 --no-browser --allow-root --port=8888 --NotebookApp.token='' --NotebookApp.password='' --NotebookApp.allow_origin='*' --NotebookApp.base_url=rstudio"]
#RUN echo ""
CMD ["/init"]

