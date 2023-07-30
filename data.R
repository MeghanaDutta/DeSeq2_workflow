# install airway package
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("airway")

# load the library 
library(airway)

# load airway dataset 
data(airway)

# get sample information 
sample_info <- as.data.frame(colData(airway))

# grab cell and dex columns 
sample_info <- sample_info[,c(2,3)]

# substitute trt from treatment and untrt for untreated in dex 
sample_info$dex <- gsub('trt', 'treated', sample_info$dex)
sample_info$dex <- gsub('untrt', 'untreated', sample_info$dex)

# change column names 
names(sample_info) <- c('cellLine', 'dexamethasone')

# save info file in required destination
write.table(sample_info, file = "/Users/meghanadutta/Documents/RNASeq_pipeline/sample_info.csv", sep = ',', col.names = T, row.names = T, quote = F)

# save counts data in a new file 
countsData <- assay(airway)
write.table(countsData, file = "/Users/meghanadutta/Documents/RNASeq_pipeline/counts_data.csv", sep = ',', col.names = T, row.names = T, quote = F)