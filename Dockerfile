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
RUN /mofa2.sh
# jupyter 
RUN /jupyter.sh 

RUN /scRNA-python.sh

EXPOSE 8787
EXPOSE 8888

# http://127.0.0.1:8888/rstudio/lab
#CMD ["jupyter lab --notebook-dir=/home/rstudio --ip=0.0.0.0 --no-browser --allow-root --port=8888 --NotebookApp.token='' --NotebookApp.password='' --NotebookApp.allow_origin='*' --NotebookApp.base_url=rstudio"]
#RUN echo ""
CMD ["/init"]

