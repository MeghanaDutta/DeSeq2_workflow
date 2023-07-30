# install airway package
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("airway")

# Load required packages
library(airway)  # Load the airway package
library(dplyr)   # For data manipulation


# load airway dataset 
data(airway)


# Get sample information as a data frame
sample_info <- as.data.frame(colData(airway))

# Extract required columns and rename
sample_info <- sample_info %>%
  select(cellLine = cell, dexamethasone = dex) %>%
  mutate(dexamethasone = ifelse(dexamethasone == "trt", "treated", "untreated"))

# Save sample information to CSV
sample_info_file <- "/Users/meghanadutta/Documents/RNASeq_pipeline/sample_info.csv"
write.csv(sample_info, file = sample_info_file, row.names = FALSE)

# Save counts data to CSV
counts_data_file <- "/Users/meghanadutta/Documents/RNASeq_pipeline/counts_data.csv"
write.csv(assay(airway), file = counts_data_file, row.names = TRUE)

