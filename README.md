#  Ecological Network assembly: how the regional meta web influence local food webs 

[![DOI](https://zenodo.org/badge/114162751.svg)](https://zenodo.org/badge/latestdoi/114162751)

## Abstract

Local food webs can be studied as the realization of a sequence of colonizing and extinction events, where a regional pool of species ---called the metaweb--- acts as a source for new species, these are shaped by evolutionary and biogeographical processes at larger spatial and temporal scales than local webs. Food webs are thus the result of assembly processes that are influenced by migration, habitat filtering, stochastic factors, and dynamical constraints. We compared the structure of empirical local food webs to webs resulting from a probabilistic assembly null model. The assembly model had no population dynamics but colonization and extinction events with the restriction that consumer species have prey present. We use for comparison several network properties including trophic coherence, modularity, motifs, topological roles, and others. We hypothesized that the structure of empirical food webs should differ from model webs in a way that reflected dynamical stability and other local constraints. Three data sets were used: (1) the marine Antarctic metaweb, with 2 local food-webs (2) the 50 lakes of the Adirondacks; and (3) the arthropod community from Florida Keys' classic defaunation experiment. Contrary to our expectation, we found that there were almost no differences between empirical webs and those resulting from the assembly null model. Few empirical food webs showed significant differences with network properties, motif representations and topological roles, compared to the assembly null model. Our results suggest that there are not strong dynamical or habitat restrictions upon food web structure at local scales. Instead, the structure of local webs is inherited from the metaweb without modifications. Recently, it has been found in competitive and mutualistic networks that structures that are often attributed as causes or consequences of ecological stability are probably a by-product of the assembly processes (i.e. spandrels). We extended these results to trophic networks suggesting that this could be a more general phenomenon.

**Leonardo A. Saravia**, **Tomás  I. Marina**, **Nadiah P. Kristensen**, **Marleen De Troch**, **Fernando R. Momo** 

* [BioRxiv Preprint](https://doi.org/10.1101/340430)

* [raw manuscript source in markdown](https://github.com/lsaravia/MetawebsAssembly/blob/master/MetawebsAssembly.md) (figures and citations not rendered in this version)



## R Markdown files description



* MetawebsAnalysis.Rmd :

		Calculations for empirical food webs: Modularity, Trophic Coherence, MEing, Trophic Level,  
		3-node motif and topological roles. 

* MetaWebAssemblyModelAnalysis.Rmd: 
		
		Analysis of the meta-web assembly model.
		The R Package meweasmo is needed to simulate the model 
		<https://github.com/lsaravia/meweasmo>



## Folders

	| 
	+--- R: R code by L. Saravia
    	 