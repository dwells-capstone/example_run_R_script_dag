#!/usr/bin/env Rscript

# This script is used to run an R script file.
# It takes the path to the R script file as a command line argument.
# The script sets the working directory to the directory containing the R script file,
# and then sources the R script file.

args = commandArgs(trailingOnly=TRUE)
setwd(dirname(args[1]))
source(args[1])