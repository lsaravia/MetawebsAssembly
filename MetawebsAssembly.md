# Ecological Network assembly: how the regional metaweb influences local food webs 

Leonardo A. Saravia ^1^ ^2^ ^6^, Tomás I. Marina ^1^ ^2^ ^3^, Marleen De Troch ^4^, Nadiah P. Kristensen ^5^, Fernando R. Momo ^1^ ^2^

1. Instituto de Ciencias, Universidad Nacional de General Sarmiento, J.M. Gutierrez 1159 (1613), Los Polvorines, Buenos Aires, Argentina.

2. INEDES, Universidad Nacional de Luján, CC 221, 6700 Luján, Argentina.

3. Centro Austral de Investigaciones Científicas (CADIC-CONICET).

4. Marine Biology, Ghent University, Krijgslaan 281/S8, B-9000, Ghent, Belgium.

5. Department of Biological Sciences, National University of Singapore, 14 Science Drive 4 Singapore 117543, Singapore.

6. Corresponding author e-mail lsaravia@campus.ungs.edu.ar, ORCID https://orcid.org/0000-0002-7911-4398


**keywords**: Metaweb, ecological network assembly, network assembly model, food web structure, modularity , trophic coherence, motif, topological roles, null models

**Running title**: The metaweb influence on local food webs.

\newpage


## Abstract 


1. Local food webs can be studied as the realisation of a sequence of colonising and extinction events, where a regional pool of species ---called the metaweb--- acts as a source for new species, these are shaped by evolutionary and biogeographical processes at larger spatial and temporal scales than local webs. Food webs are thus the result of assembly processes that are influenced by migration, habitat filtering, stochastic factors, and dynamical constraints.

2. We compared the structure of empirical local food webs to webs resulting from a probabilistic assembly model. The assembly model had no population dynamics but colonization and extinction events with the restriction that consumer species have preys present. We use for comparison a several network properties including modularity, mean trophic level, motifs, topological roles and others. We hypothesised that the structure of empirical food webs should differ from model webs in a way that reflected dynamical stability and other local constraints. Three data-sets were used: (1) the marine Antarctic metaweb, with 2 local food-webs (2) the 50 lakes of the Adirondacks; and (3) the arthropod community from Florida Keys' classic defaunation experiment.

3. Contrary to our expectation, we found that there were almost no differences between empirical webs and those resulting from the assembly model. Further, while empirical webs showed different motif representations compared to the assembly model, these were not motifs associated with increased stability. Species' topological roles showed differences between the metaweb and local food webs that were not explained by the assembly model, suggesting that species in empirical webs are selected by habitat or dispersal limitations. 

4. Our results suggest that there are not strong dynamical or habitat restrictions upon food web structure at local scales. Instead, the structure of local webs is inherited from the metaweb withou modifications.

5. Recently, it has been found in competitive and mutualistic networks that structures that are often attributed as causes or consequences of ecological stability are probably a by-product of the assembly processes (i.e. spandrels). We extended these results to trophic networks suggesting that this could be a more general phenomenon.


## Methods

We compiled 3 metawebs with its corresponding local food webs 60 from a variety of regions and ecosystems. We built the first metaweb from the Southern Ocean database compiled by @Raymond2011, selecting only species located at latitudes higher than 60°S. @Raymond2011 compiled information from direct sampling methods of dietary assessment, including gut, scat, and bolus content analysis, stomach flushing, and observed feeding. We considered that the metaweb is the regional pool of species defined by the biogeographic Antarctic region. As local food webs we included the two available well resolved datasets: the Weddell Sea and Potter cove food webs. The first includes species situated between 74°S and 78°S with a West-East extension of approximately 450 km and comprises all information about trophic interactions available for the zone since 1983 [@Jacob2011]; and the Potter Cove food web comes from a 4 km long and 2.5 km wide Antarctic fjord located at 62°14'S, 58°40'W, South Shetland Islands [@Marina2018]. To make datasets compatible, we first checked taxonomic names for synonyms, and second, we added species (either prey or predator) with their interactions to the metaweb when the local food webs contain a greater taxonomic resolution. This resulted in the addition of 258 species to the metaweb, which represent 33% of the total. We removed cannibalistic (self-links) and double arrows (i.e. A eats B and B eats A). We named this the Antarctic metaweb, which has 846 species, 6897 links and a connectance of 0.01. 

The second metaweb was collected from pelagic organisms of 50 lakes of the Adirondacks region [@Havens1992], which were sampled once during the summer 1984 [@Sutherland1989]. @Havens1992 determined the potential predator–prey interactions among the 211 species from previous diet studies, species that lacked a trophic links were deleted and feeding links were assumed when the species involved were present in a particular lake, this is the Lakes metaweb with  211 species, 8426 links and a connectance of 0.19.   

The third metaweb comes from the classic defaunation experiment performed in the Florida Keys [@Simberloff1969; @Piechnik2008], six islands of 11–25 meters in diameter were defaunated with insecticide. The arthropods were censused before the experiment and after it approximately once every 3 weeks during the first year and again 2 years after defaunation. For the metaweb and local webs we used only the first census that represent a complete community, @Piechnik2008 determined the trophic interactions among 211 species using published information and expert opinions. These last two dataset were obtained directly from the GATEWAy database [@Brose2019].

To describe food webs as networks each species is represented as a node or vertex and the trophic interactions are represented as edges or links between nodes. These links are directed, from the prey to the predator, as the flow of energy and matter. Two nodes are neighbours if they are connected by an edge and the degree $k_i$ of node $i$ is the number of neighbours it has. The food web can be represented by an adjacency matrix $A=(a_{ij})$ where $a_{ij}=1$ if species $j$ predates on species $i$, else is 0. Then $k_i^{in}=\sum_j{a_{ji}}$ is the number of preys of species $i$ or its in-degree, and $k_i^{out}=\sum_j{a_{ij}}$ is the number of predators of $i$ or its out-degree. The total number of edges is $E=\sum_{ij}a_{ij}$. 

### Models

To unravel the mechanisms of network assembly we considered a colonization-extinction model constrained by the network structure, with no consideration of population dynamics and interaction strength. Then we compared the empirical networks with such models using a null model approach: if we observe a deviation from the property obtained with the null model then mechanisms that are excluded from the model may be acting [@DeBello2012]. 

To consider network assembly mechanisms we used a metaweb assembly model (Figure 1), similar to the trophic theory of island biogeography [@Gravel2011]. In this model species migrate from the metaweb to a local web with a uniform probability $c$, and become extinct from the local web with probability $e$; a reminiscence of the theory of island biogeography [@MacArthur1967], but with the addition of network structure. Species migrate with their potential network links from the metaweb, then in the local web, species have a probaility of secondary extinction $se$ if none of its preys is present, this only applies to non-basal species. When a species goes extinct locally it may produce secondary extinctions modulated by $se$. We simulated this model in time and it eventually reaches an equilibrium that depends on the migration and extinction probabilities but also on the structure of the metaweb. The ratio of immigration vs. extinction $\alpha= c/e$ is hypothesized to be inversely related to the distance to the mainland [@MacArthur1967], and as extinction should be inversely proportional to population size [@Hanski1999], the ratio $\alpha$ is also hypothesized to be related to the local area. For details of the fitting and simulations see Appendix. 



## Acknowledgements

We are grateful to the National University of General Sarmiento for financial support. LAS would like to thank Susanne Kortsch that shared with us her source code for topological analysis and figures, and to Nadiah Kristensen for a constructive review of the manuscript. This work was partially supported by a grant from CONICET (PIO 144-20140100035-CO). 

## Authors’ contributions

LAS, TIM, MDT and FRM conceived the ideas and designed methodology; TIM and LAS collected the data; LAS wrote the code; LAS, TIM and NPK analysed the data; NPK, LAS and TIM led the writing of the manuscript. All authors contributed critically to the drafts and gave final approval for publication.

## Data Availability Statement

The source code and data is available at zenodo <https://doi.org/10.5281/zenodo.3370022> and Github <https://github.com/lsaravia/MetawebsAssembly/>.  


## References