# Sejourne-et-al-2026
Code used in Sejourne et al 2026 manuscript

Directories: 

ctnnd2_triple_nuclear_all_sets
- CSV: 
	- *Counts_Normalized_Pixel_Based_Unblinded.csv aggregated binned cell count dataframe with per-image data
	- *Counts_Normalized_Pixel_Based_Unblinded_Organized.csv aggregated binned cell count dataframe with per-animal mean data
	- *output*.csv per-image cell counts
	- Decoder_trinuc_all_sets.csv animal ID, genotype, sex, set, and age data
	- *Seg_*.csv UNET output including cell coordinate information
- ImageJ macros: 
	- Stitch_using-TileConfig-file.ijm stitches tiles from Olympus using MATL configuration file
	- 241019_rotate_crop.ijm
	- Z-projected_noLayers_Separate_PlanesChannels_Add_area_250114 automates batch max projection and channel separation	
- Python scripts: 
	- Denoise_2_restore_adjusted_for_3_z-stacks.ipynb script for running UNet denoising using weight files trained to convert 60X resonant scanner images to galvano quality images on the Olympus FV3000 microscope.
	- Move_restored_images_back_to_original_folders.ipynb automates image transfer after restoration
	- GS_Combine_Cell_count_and_Area_CSVs_constant_area.ipynb script for counting cells per image
	- Analyze_Cortical_UNET_All_Data-Normalized_to_Image_Height_GMS240115.ipynb script for aggregating UNET output csvs to binned cell count dataframes (run on each of the 4 cell type directory within "Data" folder)
- R-markdown: 
	- ctnnd2_triple_nuclear_all_sets_cleaned.Rmd binned analysis of cell type density within 10 equal-sized bins from pia to corpus callosum

ctnnd2_bulkseq: 
- R-markdown: 
	- ctnnd2_rnaseq_de_vc_cleaned.Rmd differential expression analysis of visual cortex bulk RNA sequencing data
	- ctnnd2_rnaseq_de_acc_cleaned.Rmd differential expression analysis of prefrontal cortex bulk RNA sequencing data
	
ctnnd2_hcr_ihc: 
- CSV:
	- *C3_merged_data.csv Mfge8 signal intensity
	- *C4_merged_data.csv Id4 and Tnc signal intensity
	- decoder_HCR_multilayer_set1.csv animal ID, genotype, sex, and age data
- ImageJ macros:
	- 01_lif_to_tif_20230126.ijm converts Leica image format to Tiff
	- 02_rotate_MAX_crop_250705.ijm automates batch max projection, rotation, and ROI cropping
	- 03_subtract_mask_250705.ijm automates batch masking of S100b signal to segment astrocytes
	- 04_divide_image_250720.ijm automates division of image into equal sized bins from pia to corpus callosum
- R-markdown:
	- HCR_multilayer_imagej_cleaned.Rmd binned analysis of normalized HCR signal within astrocytes

ctnnd2_neuron_counting: 
- CSV:
	- 202050825_CTNND2_ASTRO_Neuronal_layers_set2.csv cell counting data from QuPath
- ImageJ macros:  
	- 01_lif_to_tif_20250717.ijm converts Leica image format to Tiff
	- 02_rotate_MAX_crop_250705.ijm automates batch max projection, rotation, and ROI cropping
	- 03_subtract_background_250825.ijm automates batch background subtraction
- R-markdown:
	- neuronal_layer_counting_density.Rmd binned analysis of neuronal subtype spatial frequency distribution and density within layer-specific ROI

ctnnd2_ODP: 
- ImageJ macros: 
	- 01_20230126_lif_to_tif.ijm converts Leica image format to Tiff
	- 02_Adjust_Images_GSedits.ijm automates image adjustment including background subtraction, brightness adjustment, maximum projection, rotation
	- 03_BZ_width_measurement.ijm automates BZ width measurement


ctnnd2_oligo_counting: 
- CSV: 
	- ASPA_heights_widths.csv height and width data from ASPA/Pdgfra images
	- ASPA_Pdgfra_Celldata_20260406.csv OPC/MOL cell counting data from QuPath
	- Bcas1_heights_widths.csv height and width data from Bcas1/MBP images
	- merged_bcas1_mbp_data_cell.csv cell NFOL/MFOL counting data from ImageJ cell counter
- ImageJ macros: 
	- 01_rotate_MAX_crop_251016.ijm automates batch max projection, rotation, and ROI cropping
	- 02_subtract_background_color_change_251016.ijm automates batch background subtraction and LUT adjustment
- R-markdown:  
	- aspa_pdgfra_counting_20260412.Rmd binned analysis of oligo subtype spatial frequency distribution and density within whole image
	- bcas1_mbp_counting.Qmd binned analysis of oligo subtype spatial frequency distribution

ctnnd2_snrnaseq: 
- Python scripts: 
	- 260401_ctnnd2_preprocess_cleaned.ipynb filtering, quality control, and initial clustering of snrnaseq data
	- 260401_ctnnd2_norm_cluster_cleaned.ipynb manual annotation of initial clusters and DEG analysis within GLUT, GABA, OLIGO, and ASTRO clusters
	- 260402_SCVI_batch_effects_cleaned.ipynb batch correction, subclustering and manual annotation of cellular subtypes, identification of cellular subtype-defining genes, calculation of subtype proportions

ctnnd2_xenium: 
- CSV: 
	- *VC_subset_cells_stats.csv identification info for cells within hand-selected visual cortex ROI for computational analyses
	- *column_final.csv identification info for cells within hand-selected narrower visual cortex column ROI for figure visualization
- Python scripts: 
	- Anndata_to_MEX_cleaned.ipynb generates matrix exchange format (MEX) object from anndata object containing raw counts and manually annotated clusters. For use with Xenium panel builder. 
	- ctnnd2_xenium_{sampleID}_cleaned.ipynb converts zarr to anndata object for each sample and performs normalization and log-transformation 
	- scanpy_combined_samples_cleaned.ipynb combines sample-specific anndata objects to single object and performs batch correction with scVI
	- ctnnd2_tacco_combined_samples_cleaned uses optimal transport model (TACCO) to transfer annotations from annotated snrnaseq object to xenium object
	- ctnnd2_xenium_visualizations_cleaned.ipynb generates UMAPS, dotplots, and spatial scatter plots to visualize cellular subclusters and their defining genes. Also calculates subtype proportions.
	- xenium_dist_calc_astro_barplots_cleaned.ipynb generates spatial scatter plots of astrocyte subtypes, calculates the proportion of each subtype within 4 equal-sized bins from pia to corpus callosum
	- xenium_dist_calc_oligo_barplots_cleaned.ipynb generates spatial scatter plots of oligodendrocyte subtypes, calculates the proportion of each subtype within 4 equal-sized bins from pia to corpus callosum 

zbtb20_mbd_cutrun_glia: 
- narrowPeak: 
	- *all_peaks_calculated.narrowPeak output from CaRAS peak-calling run separately for WT and KO sample sets
- CSV: 
	- *known_results*.csv output from HOMER motif enrichment analysis for each of WT-only and KO-only promoter sets
- Shell scripts: 
	- run_caras_new.sh wrapper to run CaRAS pipeline on slurm cluster
	- run_master_script.sh wrapper to run MASTER.sh script (generated by CaRAS) on slurm cluster
	- run_findmotifs.sh wrapper to run HOMER motif analysis on WT-only and KO-only peaksets
	- bw_compare_zbtb20_merged.sh uses deeptools to subtract background (IgG reads) from signal (zbtb20 reads) bigwig files
	- bw_compare_mecp2_merged.sh uses deeptools to subtract background (GST-only reads) from signal (mbd/mecp2 reads) bigwig files
	- plotprofile_zbtb20_union_TSS_grouped_zbonly uses deeptools to plot Zbtb20 coverage at WT-only, KO-only, and intersect promoter sets
	- bw2matrix_ucsc_CpG_union_TSS uses deeptools to generate a matrix from background-subtracted zbtb20, mbd, and CpG frequency bigwig files 
	- makeheatmap_union_CpG_freq_TSS.sh uses deeptools to plot heatmap for Zbtb20 and MBD at CpG island promoters
	- plotprofile_union_CpG_freq_TSS_zbpergroup.sh uses deeptools to plot Zbtb20 coverage at CpG island promoters for each sample group separately
	- plotprofile_union_CpG_freq_TSS_mepergroup.sh uses deeptools to plot MBD coverage at CpG island promoters for each sample group separately

- R-markdown: 
	- UCSC_CpG_peaks.Rmd generates BED file with genomic locations of CpG islands overlapping promoters with Zbtb20 binding in any condition
	- chipseeker_caras_zbtb20wtvko_wt.Rmd uses Chipseeker package to annotate genomic features of loci bound by Zbtb20 in WT samples and calculate proportions of each feature type
	- chipseeker_caras_zbtb20wtvko_ko.Rmd uses Chipseeker package to annotate genomic features of loci bound by Zbtb20 in KO samples and calculate proportions of each feature type
	- pull_promoters_TSS.Rmd uses GenomicRanges package to generate BED files with genomic locations of TSSs within WT-only, KO-only, and union promoter sets
	- zbtb20_wtvko_snrnaseq_overlap.Rmd cross-references snrnaseq data to identify zbtb20-bound promoters with differential expression in Ctnnd2-KO
	- zbtb20_wtvko_snrnaseq_overlap_volcano.Rmd generates table and volcano plot of DEGs combining FC and FDR information from snrnaseq (Wilcoxon rank-sum test) and zbtb20 binding status from cut&run

- Python scripts: 
	- scvi_neun_subset_cleaned.ipynb subsets NeuN-negative (Rbfox3-negative) nuclei from snrnaseq data
	- merge_known_results_wt_ko.ipynb merges results from WT and KO HOMER motif enrichment analysis and generates dotplots to depict odds ratio and FDR

zbtb20_cutrun_astro: 
- narrowPeak: 
	- *all_peaks_calculated.narrowPeak output from CaRAS peak-calling run separately for Zbtb20 and H3K4me3 sample sets

- CSV: 
	- ASTRO_Wilcoxon_results_250106.csv output from differential expression analysis (Wilcoxon rank-sum) of astrocyte cluster from snrnaseq
	- *_genes_WT.csv astrocyte subtype-defining genes from snrnaseq

- R-markdown:
	- chipseeker_caras_zbtb20_cleaned.Rmd uses Chipseeker package to annotate genomic features of loci bound by Zbtb20 and calculate proportions of each feature type
	- chipseeker_caras_h3k4me3_cleaned.Rmd uses Chipseeker package to annotate genomic features of loci with H3k4me3 histone modification and calculate proportions of each feature type
	- pull_promoters_TSS_cleaned.Rmd uses GenomicRanges package to generate BED files with genomic locations of TSSs within Zbtb20 promoter set
	- zbtb20_snrnaseq_overlap_cleaned.Rmd cross-references snrnaseq data to identify zbtb20-bound promoters with astrocyte subtype enrichment and differential expression in Ctnnd2-KO

- Python scripts:
	- 260427_layer_enriched_dotplots_cleaned.ipynb plots expression of astrocyte subtype-defining genes in WT and KO astrocyte nuclei