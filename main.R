# Load most commonly used libraries
list.of.packages <- c("RSocrata", "tidyverse", "magrittr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

library(RSocrata)
library(readr)
library(tidyverse)

# ---- begin ----
# Step One: Load Data:
source("code/load.R")

# ---- analysis ----
# Step Two: Analyzing data for report:
source("code/analysis.R")

# ---- knit ----
# Step Three: Render Reports
rmarkdown::render("rmd/README.Rmd", "github_document", "../README.md")
rmarkdown::render("rmd/README.Rmd", "pdf_document", "../analysis.pdf")
