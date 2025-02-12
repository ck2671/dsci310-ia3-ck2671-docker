FROM rocker/rstudio:4.4.2
USER root

#install dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev

# Install remotes package to enable versioned package installs
RUN R -e 'install.packages("remotes", repos="https://cloud.r-project.org")'

# Install specific version of cowsay (or any package of your choice)
RUN R -e 'remotes::install_version("cowsay", version = "0.8.0", repos="https://cloud.r-project.org")'

# Switch back to rstudio user
USER rstudio

# Copy R script that uses cowsay
COPY script.R /home/rstudio/script.R

# Version 1.1
