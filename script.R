# load required libraries
library(DESeq2)
library(tidyverse)
library(airway)


# read in counts data
counts_data <- read.csv("counts_data.csv")


# read in sample info
sample_info <- read.csv("sample_info.csv")


# check if rows of sample_info match columns of counts_data 
all(colnames(counts_data) %in% rownames(sample_info))

# check if they are in same order 
all(colnames(counts_data) == rownames(sample_info))


# Construct the DESeqDataSet object
dseq <- DESeqDataSetFromMatrix(countData = counts_data,
                              colData = sample_info,
                              design = ~ dexamethasone)


# Filter low-count genes
dseq <- dseq[rowSums(counts(dseq)) >= 10, ]


# Set the reference level for dexamethasone
dseq$dexamethasone <- relevel(dseq$dexamethasone, ref = "untreated")


# Run DESeq and get results
dseq <- DESeq(dseq)
res <- results(dseq)

# Explore Results 
summary(res)

# Results with adjusted p-value threshold of 0.01
res0.01 <- results(dseq, alpha = 0.01)
summary(res0.01)

# Get name of the Results
resultsNames(dseq)

# plot a graph 
plotMA(res)


# Volcano plot 
# Convert DESeq2 results object to a data frame
res_df <- as.data.frame(res)

# Create a volcano plot
ggplot(res_df, aes(x = log2FoldChange, y = -log10(padj))) +
  geom_point(color = "blue", alpha = 0.6) +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed", color = "red") +
  labs(title = "Volcano Plot",
       x = "Log2 Fold Change",
       y = "-log10(adjusted p-value)") +
  theme_minimal()



