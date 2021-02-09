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


### Model


To consider network assembly mechanisms we used a metaweb assembly model (Figure 1), similar to the trophic theory of island biogeography [@Gravel2011]. In this model species migrate from the metaweb to a local web with a probability $c$, and become extinct from the local web with probability $e$; a reminiscence of the theory of island biogeography [@MacArthur1967], but with the addition of network structure. Species migrate with their potential network links from the metaweb, then in the local web, species have a probaility of secondary extinction $se$ if none of its preys is present, this only applies to non-basal species. When a species goes extinct locally it may produce secondary extinctions modulated by $se$ (Figure 1). We simulated this model in time and it eventually reaches an equilibrium that depends on the migration and extinction probabilities but also on the structure of the metaweb. The ratio of immigration vs. extinction $\alpha= c/e$ is hypothesized to be inversely related to the distance to the mainland [@MacArthur1967], and as extinction should be inversely proportional to population size [@Hanski1999], the ratio $\alpha$ is also hypothesized to be related to the local area. For details of the fitting and simulations see Appendix. 
This model only considers colonization-extinction, and secondary extinctions events model constrained by network structure, with no consideration of population dynamics and interaction strength. Then, this simple model acts as a null model, if we observe a deviation from a property obtained with the null model then mechanisms that are excluded from the model may be acting [@DeBello2012]. 

![Schematic diagram of the metaweb assembly model: species migrate from the metaweb with a probability $c$ to a local network carrying their potential links; here they have a probability of extinction $e$. Additionally, predators become extinct if their preys are locally extinct with probability $se$. We simulate 1000 local networks and calculate network properties. From the distribution of these topological properties we calculate 1% confidence intervals to compare with empirical networks](Figures/MetaWebAssemblyModelFigure.pdf)


### Structural network properties

To describe food webs as networks each species is represented as a node or vertex and the trophic interactions are represented as edges or links between nodes. These links are directed, from the prey to the predator, as the flow of energy and matter. Two nodes are neighbours if they are connected by an edge and the degree $k_i$ of node $i$ is the number of neighbours it has. The food web can be represented by an adjacency matrix $A=(a_{ij})$ where $a_{ij}=1$ if species $j$ predates on species $i$, else is 0. Then $k_i^{in}=\sum_j{a_{ji}}$ is the number of preys of species $i$ or its in-degree, and $k_i^{out}=\sum_j{a_{ij}}$ is the number of predators of $i$ or its out-degree. The total number of edges is $E=\sum_{ij}a_{ij}$. 


The first property we analysed is the small-world pattern, which examines the average of the shortest distance between nodes and the clustering coefficient of the network [@Watts1998]. This property is associated with increased resilience and resistance to secondary extinctions [@Sole2001; @Bornatowski2017]. We first calculated the characteristic path length that is the shortest path between any two nodes. Then $L$ is the mean value of the shortest path length across all pairs of nodes. 
The clustering coefficient of node $i$ was defined as 

$$cc_i =\frac{2 E_i}{k_i (k_i -1)}$$ 

where $E_i$ is the number of edges between the neighbours of $i$. The clustering coefficient of the network $CC$ is the average of $cc_i$ over all nodes. The original definition of small-world networks is conceptual [@Watts1998], a network $G$ is small-world when it has a similar mean shortest path length but greater clustering than an Erdös-Rényi random network with the same number of nodes $n$ and edges $m$. For the quantitative version of the small-world pattern, we followed @Humphries2008; we need to define:

$$\gamma_g = \frac{CC_g}{CC_{null}}$$

and

$$\lambda_g = \frac{L_g}{L_{null}}$$

where $CC_g$ and $L_g$ are the clustering coefficient and the mean shortest path length of the network of interest $G$; $CC_{null}$ and $L_{null}$ are the same quantities for the null model. Thus, quantitative small-world-ness is defined as:

$$S = \frac{\gamma_g}{\lambda_g}$$

and to determine if $S$ is statistically significant Monte Carlo methods were used [@Crowley1992]. We built 1000 null model networks using the metaweb assembly model fitted to the empirical network; then we calculated $S$ for each random network and the lower and higher 99% quantiles of the $S$ distribution are called $ql,qh$:

$$CI = \frac{qh - ql}{2}$$
 
the upper 99% confidence limit is then $CL^{0.01}= 1 + CI$. Thus, if a network has $S > CL^{0.01}$ it is considered a small-world network [@Humphries2008]. We also calculated the small-world-ness and the CI using the metaweb assembly model as a null model.

The second property is trophic coherence [@Johnson2014], that is related to stability in the sense that small perturbations could get amplified or vanished, which is called local linear stability [@May1972;@Rohr2014]. We first needed to estimate the trophic level of a node $i$, defined as the average trophic level of its preys plus 1. That is:

$$tp_i= 1 + \frac{1}{k_i^{in}}\sum_{j}{a_{ij} tp_j}$$ 

where $k_i^{in}=\sum_{j}a_{ji}$ is the number of preys of species $i$, basal species that do not have preys (then $k_i^{in}=0$) are assigned a $tp=1$. Then the trophic difference associated to each edge is defined as $x_{ij}=tp_i - tp_j$. The distribution of trophic differences, $p(x)$, has a mean $E^{-1} \sum_{ij} a_{ij} x_{ij} = 1$ by definition. Then the trophic coherence is measured by:

$$q = \sqrt{\frac{1}{E} \sum_{ij}a_{ij}x_{ij}^2 - 1}$$


that is the standard deviation of the distribution of all trophic distances. A food web is more coherent when $q$ is closer to zero, thus the maximal coherence is achieved when $q = 0$, and corresponds to a layered network in which every node has an integer trophic level [@Johnson2014; @Johnson2017]. To compare coherence and trophic level we generated 1000 null model networks with at least one basal species and the same number of species and links---or approximately the same---than the network of interest. Then we calculated the 99% confidence interval using the 0.5% and 99.5% quantiles of the distribution of $q$; we also calculated the confidence interval for the mean trophic level $tp$. We calculated the z-scores as:

$$z_i=\frac{q_{obs} - q_{null}}{\sigma_{qnull}}$$

where $q_{obs}$ is the observed coherence, $q_{null}$ is the mean coherence from the null model networks and $\sigma_{qnull}$ is the standard deviation. The same formula is used for $tp$. The z -score thus measures the significance of deviations of the empirical network from the null hypothesis. If the distribution of the quantity ($q$, $tp$) under the null model is normal, a z-score greater than 2 is evidence that the observed quantity is significantly greater than its random counterpart, and a z-score less than -2 means that the quantity is significantly lower. If the distribution under the null model is skewed this is not necessarily true and thus we must rely on confidence intervals. 

Another property related to stability is modularity, since the impacts of a perturbation are retained within modules minimizing impacts on the food web [@Fortuna2010; @Grilli2016]. It measures how strongly sub-groups of species interact between them compared with the strength of interaction with other sub-groups [@Newman2004]. These sub-groups are called compartments. To find the best partition, we used a stochastic algorithm based on simulated annealing [@Reichardt2006]. Simulated annealing allows maximizing modularity without getting trapped in local maxima configurations [@Guimera2005]. The index of modularity was defined as: 

$$M = \sum_s \left(\frac{I_s}{E} - \left(\frac{d_s}{2E}\right)^2 \right)$$

where $s$ is the number of modules or compartments, $I_s$ is the number of links between species in the module $s$, $d_s$ is the sum of degrees for all species in module $s$ and $E$ is the total number of links for the network. To assess the significance of our networks we calculate the 99% confidence intervals and z-scores based on 1000 null model networks as previously described. 


Finally, we calculate the average of the maximal real part of the eigenvalues of the Jacobian [@Grilli2016] this is a measure related to quasi sign-stability (QSS) which  is the proportion of randomly parameterised systems that are locally stable [@Allesina2008a]. Following previous analysis [@Monteiro2016;@Borrelli2015a], we estimate the value by drawing the unknown magnitudes of the Jacobian matrix from a uniform distribution ranging from -10 to 0 for the predator-prey interaction, from 0 to 0.1 for the prey-predator interaction, and from 0 to -1 for the self-regulation effect. This impies that the predator effect on the prey is bigger than the effect of the prey on the predattor, and that the self-regulation or self-damping effect scales the dynamic's return time. We sampled 1000 jacobians estimate the maximal real part of the eigenvalues and take the average, we repeat this procedure for each of the 1000 null model networks and estimate the 99% confidence intervals as previously.


## Acknowledgements

We are grateful to the National University of General Sarmiento for financial support (Proyect 30/1139). LAS would like to thank Susanne Kortsch that shared with us her source code for topological analysis and figures. This work was partially supported by a grant from CONICET (PIO 144-20140100035-CO). 

## Authors’ contributions

LAS, TIM, MDT and FRM conceived the ideas and designed methodology; TIM and LAS collected the data; LAS wrote the code; LAS, TIM and NPK analysed the data; NPK, LAS and TIM led the writing of the manuscript. All authors contributed critically to the drafts and gave final approval for publication.

## Data Availability Statement

The source code and data is available at zenodo <https://doi.org/10.5281/zenodo.3370022> and Github <https://github.com/lsaravia/MetawebsAssembly/>.  


## References