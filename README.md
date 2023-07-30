# DeSeq2_workflow
### DESeq2 Analysis of Human Airway Smooth Muscle Cells

#### Overview:
This repository contains the code and data for a DESeq2 analysis of human airway smooth muscle cells to identify significant gene expression alterations between dexamethasone-treated and untreated cells. Dexamethasone is a commonly used glucocorticoid that may impact gene expression in these cells.

#### Research Objective:
The primary objective of this analysis is to investigate the effects of dexamethasone treatment on human airway smooth muscle cells and identify genes that exhibit significant changes in expression levels.

#### Dataset:
The RNA-seq data used in this analysis was obtained from human airway smooth muscle cells treated with dexamethasone and untreated controls. The dataset is available [provide data source or accession number if applicable].

#### Methods:
1. Differential Expression Analysis: DESeq2, a widely used R/Bioconductor package, was employed to perform the differential expression analysis. This method takes into account the inherent variability in RNA-seq data and provides statistical rigor in identifying significant gene expression changes between treatment groups.

2. Statistical Significance: Genes were considered significantly differentially expressed based on predefined criteria (e.g., adjusted p-value < 0.01 and log2 fold change > 1 or <-1).

#### Results:
The analysis revealed a set of genes that exhibited significant alterations in expression levels upon dexamethasone treatment. These genes are potential candidates for further investigation into the molecular mechanisms underlying the response of airway smooth muscle cells to dexamethasone.

#### Repository Structure:
- `data/: Contains the processed data used in the analysis.
- `scripts/`: Includes R scripts used for data preprocessing, DESeq2 analysis, and visualization.
- `results/`: Contains output files, such as tables of differentially expressed genes and plots.


#### Future Work:
Potential future work includes functional enrichment analysis, pathway analysis, and validation of key findings using experimental methods.
