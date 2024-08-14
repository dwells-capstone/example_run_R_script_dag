FROM quay.io/astronomer/astro-runtime:11.8.0

# Become root to install R packages into /usr/local/lib/R/site-library
USER root

# Install R packages
COPY requirements_r.txt /
COPY run_requirements_r.sh /

RUN R -e "install.packages('remotes', dependencies=TRUE, build_manual = FALSE, build_vignettes = FALSE, repos='https://cloud.r-project.org/'); if (!library(remotes, logical.return=TRUE)) quit(status=10)" && \
    chmod u+x /run_requirements_r.sh && \
    /run_requirements_r.sh && \
    rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# Set permissions for /usr/local/airflow/ recursively
RUN mkdir /usr/local/airflow/files && \
    chmod -R 777 /usr/local/airflow

# Set the user to astro
USER astro
