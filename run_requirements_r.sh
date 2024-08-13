#!/bin/bash

# This script installs R packages specified in the requirements_r.txt file.
# It sets IFS to a semi-colon/(':').
# It reads each line of the file, where each line contains the package name and version separated by a semi-colon/(':') in the format "package:version".
# For each package, it uses the R command to install the specified version from the R package repository.
# If the installation fails, it displays an error message and exits with a non-zero status code.

IFS=":"

# Read requirements_r.txt file line by line
while IFS=":" read -r package version; do
  # Skip lines starting with #
  case "$package" in \#*) continue ;; esac
  # Install package from CRAN using remotes package
  Rscript -e "remotes::install_version('$package', version = '$version', build_manual = FALSE, build_vignettes = FALSE, repos ='https://cloud.r-project.org/')" || { echo "Failed to install $package:$version"; exit 1; }
done < "/requirements_r.txt"
