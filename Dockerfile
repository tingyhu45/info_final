FROM rocker/tidyverse

# use of caching and speed up builds
RUN Rscript -e "install.packages('here')"
RUN Rscript -e "install.packages('maps')"
RUN Rscript -e "install.packages('mapdata')"
RUN Rscript -e "install.packages('ggplot2')"
RUN Rscript -e "install.packages('dplyr')"
RUN Rscript -e "install.packages('table1')"

# make a project directory in the container
# we will mount our local project directory to this directory
RUN mkdir /project

# copy contents of local folder to project folder in container
COPY ./ /project/

# make R scripts executable
RUN chmod +x /project/R/*.R


# make container entry point bash
CMD /bin/bash

#WORKDIR /project

#CMD make report