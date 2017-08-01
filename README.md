# Stoichiometry drives eco-evolutionary feedbacks
This repository contains open-source code, data, and text files for the eco-evo-stoich project to evaluate the effects of nutrient stoichiometry on the eco-evolutionary feedbacks between a cyanobacterial host and its phage.

## Project Questions

## Repository contents
### data
**Population Dynamics (pop-dynamics)**
`ts-counts_raw`: epi-fluorescent microscope field densities for each of ten images collected for each chemostat through 100 samplings (s1-s100). Columns 1-6 correspond to information about the image, organism, chemostat, nutrient treatment replicate, phage treatment type (phage amended [Infect] or non-phage amended [Control], and nutrient treatment type (N-limited [N] or P-Limited[P])

`ts-counts`: reduced microscopy data (ts-counts_raw) using the function `microsope.counts`. Each value represents the mean of ten images for each sampling date. Columns 1-6 correspond to information about the microbe (*Synechococcus* or phage), unique chemostat identifier, treatment replicate, phage treatment type (phage amended [Infect] or non-phage amended [Control], and nutrient treatment type (N-limited [N] or P-Limited[P]).

`cid-means`: *Synechococcus* and phage population counts as long form

`cstat-means`: *Synechococcus* and phage population counts as matrix with calculated standard error of the mean for each population. This file is used for the production of Figure 1 and Figure S2.

**Evolutionary dynamics (evo-dynamics)**
***Supplemental**
`NutrGR`: Reduced auto-fluorescence growth rates (GR) for triplicate cultures (biorep) following addition of nitrogen (N) or phosphorus (P; med.add) to the nutrient limiting media (media.base; NL = nitrogen-limited, PL = phosphorus-limited) used in the chemostat study.  

## Contributors
Dr. Jay T. Lennon and Dr. Megan L. Larsen
Department of Biology, Indiana University
