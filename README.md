#  Ecological Network assembly: how the regional meta web influence local food webs 

## Abstract

The idea that ecological networks are built in a sequence of colonization events is not new but has been applied mostly to competitive interactions. Similar processes act in trophic networks (food webs): a regional pool of species is the source from which species colonize local areas, called the meta-web.  Local food webs are realizations of meta-webs that result from assembly processes influenced by migration, habitat filtering, stochastic factors, and dynamical constraints imposed by food web structure. We analyse how the structure of a meta-web influence local food-webs with different spatial scales, using an assembly model, a random model and properties at three levels: emergent global properties that take into account the whole network (like modularity), sub-structural properties that consider several nodes (like motifs), and properties related to one node (like topological roles). Three independent data-sets were included: the marine Antarctic meta-web (34.8 million Km^2^), the Weddell Sea (3.5 million Km^2^) and Potter Cove (6.8 Km^2^) food-webs. Looking at the global properties, the meta-web present a structure very different from the random model while the local food-webs follow the same pattern and are very similar to the assembly model. The assembly model only takes into account migration, local extinction and secondary extinctions. For sub-structural properties meta-web and the local food-webs also showed the same pattern against the random model, but we found differences compared to the assembly model that does not increase the local stability of food webs. Topological roles also showed differences between the meta-web and local food-webs that are not explained by the assembly model. We found that a great portion of the structure of the food webs is determined by evolutionary processes that act on large temporal and spatial scales. On the contrary, dynamical processes that favour stability have a small influence, but habitat filtering or dispersal limitations seem to be important factors that determine food web structure. 

**Leonardo A. Saravia**, **Tomás  I. Marina**, **Marleen De Troch**, **Fernando R. Momo** 


* [raw manuscript source in markdown](https://github.com/lsaravia/MetawebsAssembly/blob/master/MetawebsAssembly.md) (figures and citations not rendered in this version)
* [Draft PDF](https://github.com/lsaravia/MetawebsAssembly/blob/master/MetawebsAssembly.pdf) (contains parsed citations and figures)
* [Bibliography](https://github.com/lsaravia/MetawebsAssembly/blob/master/MetawebsAssembly.bib) blob/master/MetawebsAssembly.bib

## R Markdown files description



* MetawebsAnalysis.Rmd :

		Modularity and Small-world-ness with package igraph 
		Plots of food-webs by modularity and trophic level, package NetIndices
		Analysis of 3-node motif

* MetaWebAssemblyModelAnalysis.Rmd: 
		
		Analysis of the meta-web assembly model.
		The R Package MetaWebAssemblyModels is needed to simulate the model 
		<https://github.com/lsaravia/MetaWebAssemblyModels>



## Folders

	| 
	+--- R: R code by L. Saravia
    	 