# From Local to regional and meta food web structure in Antarctica 

# Ecological Network structure across scales: from local to regional

## Abstract 

The idea that ecological networks are built in a sequence of colonization events is not new but has been applied mostly to competitive interactions. Similar processes act in trophic networks (food webs): a regional pool of species is the source from which species colonize local areas, called the meta-web.  Local food webs are realizations of meta-webs that result from assembly processes influenced by migration, habitat filtering, stochastic factors, and dynamical constraints imposed by food web structure. In the present study we analyse three spatial scales: the marine Antarctic meta-web representing an area of 34.8 million Km^2^, the regional Weddell Sea (3.5 million Km^2^) and the local Potter Cove (6.8 Km^2^). The meta-web was built using a dietary database of the Southern Ocean including species located at latitudes higher than 60°S. This set of species takes into account only the predator-prey interactions and does not have a real network structure. We analyse how this nested set of food-webs change across scales using properties at three levels: emergent global properties that take into account the whole network (like modularity), sub-structural properties that consider several nodes (like motifs), and properties related to one node (like topological roles). 
Among the global properties that are important for food webs stability and resilience there are: trophic coherence that is the tendency of nodes to fall into well defined trophic levels; a quantitative measure of the small-world topology, which refers to networks with a short mean path length between species and tightly interconnected clusters of nodes and modularity: the existence of subsets of species that interact more frequently among each other than with other species. As the intermediate level property, we analysed the frequency of three-node motifs that are important for food-webs. As node-level property we analysed topological roles quantified by the within node degree and the among-module connectivity. 
The meta-web had the highest modularity and small-world-ness with values significantly different from the random networks. The regional and local food webs presented a similar structure with progressively less modularity and small-world-ness. Coherence showed an opposite pattern with the meta web more similar to a random null model, and the local food web more different. Regarding motif frequency, the local, regional and meta-webs presented a similar general pattern: highest frequency was observed for the competition (exploitative and apparent, in this order) and omnivory motifs, which were over-represented with respect to random networks. On the contrary, the tri-trophic motif exhibited a lower frequency and was under-represented. Beside that there were some differences: in the local food web apparent competition was much higher than exploitative competition, and in the meta-web omnivory was higher than the others. Topological roles displayed a similar pattern across scales, with the difference that the local did not have module hubs, which means less connectivity within modules.
We expected the meta-web to be more similar to a random network regarding global properties related to stability and resilience, although only coherence showed that pattern. Coherence is related to local stability of food webs, this is consistent with the observed motif frequencies: the meta-web showed an excess of omnivory that is the most unstable motif of the four analysed. The meta-web also showed significant differences from a random structure regarding topological roles. We found that a great portion of the structure of the food webs is determined by evolutionary processes that act on large temporal and spatial scales, but non-adaptative selection or assembly processes also filter unstable structures at a local scale. Thus, there is a mixture of processes determining food web structure. 

**Leonardo A. Saravia** ^1^ ^2^, **Tomás  I. Marina** ^1^ ^2^ ^3^, **Marleen De Troch** ^4^, **Fernando R. Momo** ^1^ ^2^ 

1. Instituto de Ciencias, Universidad Nacional de General Sarmiento, J.M. Gutierrez 1159 (1613), 
Los Polvorines, Buenos Aires, Argentina.

2. INEDES, Universidad Nacional de Luján, CC 221, 6700 Luján, Argentina.

3. Consejo Nacional de Investigaciones Científicas y Técnicas (CONICET)

4. Marine Biology, Ghent University, Krijgslaan 281/S8, B-9000, Ghent, Belgium.

\newpage

## Introduction

<!--- What is known -->

The characterization of ecological systems as networks of interacting elements has a long history [@May1972;@Cohen1985;@Paine1966], much of these work has devoted to investigate network structure and its effects on the dynamics and stability [@Thebault2010]. In recent years, the application of network theory and new developments in random matrix theory has greatly expanded our capability to analyse ecological networks [@Guimaraes2016, @Allesina2015]. Besides, the analyses of the effects of ecological dynamical processes on food web structure are not so well developed. One such dynamical process is community assembly: how species from a regional pool colonize a site and interact to form local communities [@Carstensen2013]. Regional pools are shaped by evolutionary and biogeographical processes that imply large spatial and temporal scales [@Carstensen2013]. Then the assembly of local communities is influenced by dispersal, environmental filters, biotic interactions and stochastic events [@HilleRisLambers2012]. These processes have been studied by means of metacommunity theory, where different spatial assemblages are connected through dispersal of multiple species. Metacommunity theory provides a framework for assessing which are the roles of local and regional-scale dynamics [@Baiser2013;@Leibold2004]. 

<!--- What is unknown -->

Traditionally metacommunity theory has been applied to competitive interactions, trophic interactions received much less attention [@Baiser2016]. Recently, there was an increase in investigations that focused on food webs assembly, integrating it with island biogeography [@Gravel2011] and with metacommunity [@Pillai2011; @Liao2016]. These were mainly focused on complexity-stability effects [@Mougi2016]. Previous attempts to study the food web assembly process have used motifs as building blocks of local communities [@Baiser2016]. Motifs are sub-networks composed of species and links whose abundance deviates from the expected in a random network [@Milo2002]. Comparing motifs representation at different spatial scales---from regional to local---the process of assembly of interactions may be revealed [@Baiser2016], e.g. if the same processes structure of the food-web across scales, motifs representation should be the same. Besides, as local food-webs should have more tight links and stronger interaction rates, other structural properties should change as scale change [@Coll2011]. 

<!--- Your burning question/hypothesis/aim -->

<!--- Your experimental approach -->

There are several approaches to characterize the structure of an ecological networks: emergent or global properties that focus on averages over the entire network (e.g.  modularity or connectance), and more local properties that focuses on how one or several species are related to the whole. Global properties related to resilience and stability are fundamental to understand the response of ecological networks to global treats like climate change and biological invasions. One of these properties is the small-world pattern, associated with rapid responses to disturbances and resistance to secondary extinctions [@Montoya2002]. The small-world pattern is related to two global properties: the average distance between all species, called the path length, and the clustering coefficient, the probability that two species linked to the same species are linked. Then Small-­world patterns imply a high level of clustering compared with a random graph, and a small average path length similar to that seen in random graphs [@Watts1998]. This pattern comes from the general network theory, beyond ecological networks, and has been mostly applied to marine food webs [@Navia2016;@Bornatowski2017;@Gray2016; @Marina2018a]. 

<!--- Coherence -->
Since the early studies of @May1972 that found that larger and more connected ecosystems will be unstable there is a search of factors that would stabilize a food-web [@Garcia-Callejas2018], one of such properties is called trophic coherence [@Johnson2014]. Trophic coherence is based on the distances between the trophic levels of species and measures how well species fall into discrete trophic levels; thus more coherence implies a more hierarchical structure of the food-web and it is directly correlated with linear stability [@Johnson2014]. The advantage of coherence as an index of stability is that it does not make any assumptions about interaction strengths.

<!---Modularity -->

Food webs have highly non-random and structurally complex patterns that contain internal functional units or sub-modules [@Grilli2016]. These are groups of prey and predators that interact more strongly with each other than with species belonging to other sub-modules, the existence of these modules (also called compartments) acts buffering the propagation of extinctions throughout the network, thereby  increasing persistence [@Stouffer2011]. It is interesting to mention that small-world patterns and modularity act in opposite directions. The small-world structure favours that perturbations spread and dissipate rapidly [@Gray2016], and a high degree of modularity prevents the spread of perturbations [@Stouffer2011;@Krause2003]. The detection of these modules is an intermediate approach between the global and the local analysis. 

<!---Topological roles -->

There are important species in ecological networks that have disproportionately large effects on the whole ecosystem, like keystone species [@Paine1969], ecosystem engineers [@Jones1994] and network hubs [@Borthagaray2014]. Species can participate in different ways with respect to modularity: depending on how many feed links they have within their own module and/or between the modules [@Guimera2005; @Kortsch2015]. This participation has been called the species' topological role, theoretical and empirical results suggest this roles are related to species traits like wide niche breadth, environmental tolerance, apex position in local communities and high motility [@Borthagaray2014;@Guimera2010;@Rezende2009]. This is a local property at an individual species level. 


<!---How all these multilevel properties are related to network assembly -->


Thus our objective is to analyse the process of food-web assembly using three datasets collected at different spatial scales: the marine Antarctic meta-web representing an area of 34.8 million Km^2^ and it is mainly a dietary database [@Raymond2011]; the regional Weddell Sea that represent 3.5 million Km^2^ and is one of the most resolved marine food-webs obtained by a combination of field, laboratory analysis [@Jacob2011]; and the local Potter Cove that represent 6.8 Km^2^, this was build using the results of 20 years of research in the area [@Marina2018]. We analyse how this set of food-webs change across scales using properties at three levels: emergent global properties that take into account the whole network (modularity, coherence), sub-structural properties that consider several nodes (motifs), and properties related to one node (topological roles). 


## Methods

The three dataset used in this study represent a nested hierarchy but they were collected independently. The southern ocean database compiled by @Raymond2011 was used to construct the meta-web selecting only species located at latitudes higher than 60°S. @Raymond2011 compiled information from  direct sampling methods of dietary assessment, including gut, scat, and bolus content analysis, stomach flushing, and observed feeding. We consider that the meta-web is the regional pool the species defined by the biogeographic Antarctic region. The regional Weddell Sea dataset includes species situated between 74°S and 78°S with a length of approximately 450 km and comprises all information available for the zone since 1983 [@Jacob2011]. The local dataset comes from Potter Cove: a 4 km long and 2.5 km wide Antarctic fjord located at 62°14'S, 58°40'W, South Shetland Islands [@Marina2018]. For more information about these dataset please consult the original publications. To make compatible the datasets first we check taxonomic names for synonyms, and second we add species (either prey or predator) with their interactions to the meta-web when the local or regional food-webs contains more taxonomic resolution; instead if the meta-web contained more detailed records, only for predators we added them to the local food-web checking for its geographic range. We remove cannibalistic (self-links) and double arrows (i.d. A eats B and B eats A).  
  
### Analysis

We analysed the structural properties of the nested network hierarchy (Meta-web, regional, local) using properties that focus on different levels within the networks: emergent global properties that take into account the whole network, sub-structural properties that consider several nodes, and properties related to one node. To describe food-webs as networks each species is represented as a node or vertex and the feeding interactions are represented as edges or links between de nodes. This links in the case of food-webs are directed from the prey to the predator. Two nodes are neighbours if they are connected by an edge and the degree $k_i$ of node $i$ is the number of neighbours it has. The food web can be represented by an adjacency matrix $A=(a_{ij})$ where $a_{ij}=1$ if species $j$ predates species $i$, else is 0. Then $k_i^{in}=\sum_j{a_{ji}}$ is the number of preys of species $i$ or its in-degree, and $k_i^{out}=\sum_j{a_{ij}}$ is the number of predators of $i$ or its out-degree. The total number of edges is $E=\sum_{ij}a_{ij}$.

#### Small-world topology

The first emergent property we used is the small world pattern (SW), this property relates two other properties average distance between the nodes and the clustering which that measures the extent to which the neighbours of a node are also interconnected [@Watts1998]. We first calculated the minimum path length $L$: minimum path length between two nodes is the minimum number of edges that must be gone through to get from origin node to the target one. Then $L$ is mean value across all pairs of nodes of the minimum path length. The clustering coefficient of node $i$ was defined as 

$$c_i =\frac{2 E_i}{k_i (k_i -1)}$$ 

where $E_i$ is the number of edges between the neighbours of $i$. The clustering coefficient of the network $C$ is the average of $c_i$ over all nodes. The original definition of small world networks is conceptual [@Watts1998], a network $G$ is small world when if it has a similar path length but greater clustering than an Erdös-Rényi (E–R) random graph with the same number of nodes $n$ and edges $m$. An E-R network is constructed assigning at random the $m$ edges to the $n$ nodes with equal probability [@Erdos1959]. For the quantitative version of the SW pattern we followed @Humphries2008, we need to define:

$$\gamma_g = \frac{C_g}{C_{(rand)}}$$

and

$$\lambda_g = \frac{L_g}{L_{(rand)}}$$

where $C_g$ and $L_g$ are the clustering coefficient and the mean shortest path length of the network of interest $G$; $C_g$ and $C_{(rand)}$ are the same quantities for the corresponding E-R random network. Thus the quantitative small-world-ness is defined as:

$$S = \frac{\gamma_g}{\lambda_g}$$

and to determine if $S$ is statistically significant monte carlo methods are used. We constructed 1000 E-R networks with the same nodes $n$ and edges $m$ for the network of interest then we calculated $S$ for each random network and the lower and higher 99% quantiles of the $S$ distribution are called $ql,qh$:

$$CI = \frac{qh - ql}{2}$$

the upper 99% confidence limit is then $CL^{0.01}= 1 + CI$. Thus if a network has $S > CL^{0.01}$ is considered a small world network [@Humphries2008]. 

#### Coherence 

The second global property is called coherence [@Johnson2014], and is related to stability in the sense that small perturbations could get amplified or vanished, which is called local linear stability [@May1972;@Rohr2014]. We first need to define the trophic level of a node (species) $i$ is defined as the average trophic level of its prey plus 1. That is:

$$tp_i= 1 + \frac{1}{k_i^{in}}\sum_{j}{a_{ij} tp_j}$$ 

where $k_i^{in}=\sum_{j}a_{ji}$ is the number of preys of species $i$, basal species that do not have preys (then $k_i^{in}=0$) are assigned a $tp=1$. Then the trophic difference associated to each edge is defines as $x_{ij}=tp_i - tp_j$. The distribution of trophic differences, $p(x)$, has a mean $E^{-1} \sum_{ij} a_{ij} x_{ij} = 1$ by definition. The trophic coherence is measured by:

$$q = \sqrt{\frac{1}{E} \sum_{ij}a_{ij}x_{ij}^2 - 1}$$


that is the SD of the distribution of trophic distances, a food web will be more coherent when $q$ is closer to zero. When $q = 0$ the maximal coherence is achieved and corresponds to a layered network in which every node has an integer trophic level [@Johnson2014; @Johnson2017]. As a null model to compare coherence and trophic level we used the basal ensemble with the same number of species, links and basal species that the original food web. The basal ensemble satisfy the following constrain: for every non-basal species the proportion of the number of preys that connects to basal species is the same [@Johnson2017], and provides a null model similar to E-R random networks but where the expectation of the mean trophic level and coherence could be calculated analytically:

$$tp_{basal} = 1 + \left( 1 + \frac{B}{N}\right) \frac{E}{E_{basal}}$$

is the expected mean trophic level, where $B$ is the number of basal species, $N$ the total number of species, $E_{basal}$ the number of basal links and $E$ the total number of links.  The expected coherence of the basal ensemble is:

$$q_{basal} = \sqrt{\frac{E}{E_{basal}}-1}$$      

We report $q/q_{basal}$ and $tp/tp_{basal}$ for the three networks. 

#### Modularity 

The intermediate level property (i.e. between the whole network and the individual species) is modularity, that measures how densely sub-groups of species interact with one another compared to species of other sub-groups [@Newman2004]. These sub-groups are called compartments and to find the best partition we used a stochastic algorithm based on simulated annealing [@Reichardt2006]. Simulated annealing allows to maximize modularity without getting trapped in local maxima configurations [@Guimera2005], the index of modularity is then defined as: 

$$M = \sum_s \left(\frac{I_s}{E} - \left(\frac{d_s}{2E}\right)^2 \right)$$


where $s$ is the number of modules or compartments, $I_s$ is the number of links between species in the module $s$, $d_s$ is the sum of degrees for all species in module $s$ and $E$ is the total number of links for the network. To asses the significance of our networks we calculate Z-scores based on 1000 E-R networks with the same number of species and links. We calculated the z-score with the following equation:

$$z_i=\frac{M_{obs} - M_{(rand)}}{\sigma_{(rand)}}$$

where $M_{obs}$ is the observed modularity, $M_{(rand)}$ is the mean modularity from the E-R networks and $\sigma_{(rand)}$ is the standard deviation. It has been stressed that only networks with modularities larger that the random expectation should be called modular [@Reichardt2006]. We used the same formula to calculate z-scores for other quantities. A z-score greater than 2 is evidence than the observed quantity is significantly greater than its E-R counterpart, and a z-score less than 2 means that the quantity is significantly lower. 

#### Motifs 

We consider here three species subnetworks that have been explored theoretically and empirically [@McCann1998;@Prill2005;@Stouffer2007;@Stouffer2010;@Baiser2016], these are four of the thirteen possible three-species motifs: the tri-trophic chain, omnivory, apparent competition, and exploitative competition motifs (Figure 1).

![The four three-species motifs analysed: apparent competition, exploitative competition, tri-trophic chain, and omnivory. These four motifs have been explored both theoretically and empirically in ecological networks and are the most common motifs found](Figures/Fig1Motifs.png)

These are the only motifs present in all the networks analysed here. We compared the frequency of these motif to Erdös-Rényi (E–R) random graph with the same number of nodes $n$ and edges $m$. We performed 1000 simulations of E-R random networks and calculated the z-score of motif frequencies using the equation:  

$$z_i=\frac{N_{obs} - N_{(rand)}}{\sigma_{(rand)}}$$

where $N_{obs}$ is the observed number of a given motif, $N_{(rand)}$ is the mean count and $\sigma_{(rand)}$ is the standard deviation for the E-R networks.  


#### Topological roles 

As a local property that reflect the ecological role of each species we use topological roles. To identify topological roles we use the method of functional cartography [@Guimera2005]. The method is based on module membership and we used the previously described algorithm to detect them. The roles are characterized by two parameters: the standardized within-module degree $dz$ and the among-module connectivity participation coefficient $PC$.  The within-module degree is a z-score that measure how well a species is connected to other species within its own module:

$$dz_i = \frac{k_{is}-\bar{k_s} }{\sigma_{ks}}$$ 


where $k_{is}$ is the number of links of species $i$ within its own module $s$ and $\bar{k_s}$ and $\sigma_{ks}$ are the average and SD of $k_{is}$ over all species in $s$. The participation coefficient $PC$ estimates the distribution of the links of species $i$ among modules; thus it can be defined as:

$$PC_i =  1 - \sum_s \frac{k_{is}}{k_i}$$ 

where $k_i$ is the degree of species $i$ (i.e. the number of links), $k_{is}$ is the number of links of species $i$ to species in module $s$, and in this case $s$ runs over all the modules. Due to the stochastic nature of the module detection algorithm we made repeated simulations until the distribution of $PC_i$ and $dz_i$ has no statistical differences between two successive repetitions. To test that they come from the same distribution we used the k-sample Anderson-Darling test [@Scholz1987]. The we calculate the mean and 95% CI of $dz$ and $PC$.

To determine each species role the $dz-PC$ parameter space is divided into four regions, this was modified from @Guimera2005, using the same scheme that @Kortsch2015. There are two thresholds that define the roles: $dz=2.5$ and $PC=0.625$. If a species has at least 60% of links within its own module then $PC<0.625$ and if it also has $dz\ge 2.5$, it is classified as a module hub. These species a relatively high number of links, but inside his module. If a species has $dz<2.5$ and $PC<0.625$ is called peripheral or specialist, it means that it has relatively few links and most within its module. Species that have $dz<2.5$ and $PC\ge0.625$ are module connectors, they have relatively few links and most between modules. Finally is a species have $dz\ge 2.5$ and  $PC\ge0.625$ is classified as super-generalist because it has high between- and within-module connectivity. 

We combined the topological roles with the trophic level of each species and the compartments in one plot to give an integrated visualization of these sub-structural and local properties of the food web.

All the analysis and simulations were made in R version 3.4.3 [@RCoreTeam2017], the igraph package version 1.1.2 [@Csardi2006] for motifs and topological roles and the package NetIndices [@Kones2009] for trophic levels. All the source code and data is available at <https://github.com/lsaravia/MetawebsAssembly>.  


## Results


\scriptsize

------------------------------------------
Network            Local  Regional    Meta  
----------------- ------ --------- -------
Size                  91      437      859  

Links                 309     1908    9003  

Connectance        0.0373   0.0100  0.0122 

PathLength         1.8106   2.1965  2.5655 

Clustering         0.0989   0.0480  0.2164 

Modularity         0.3720   0.4784  0.4456 

Groups                5       5        7   

Small-World-ness   2.7536   4.6855  10.866

SWness 99%CI       2.0670   2.2683  1.711 

Modularity         0.8883  18.9697  85.750
z-score

Groups            -1.4993 -2.3960  -0.2533
z-score

Coherence          0.5319  0.4508   0.7037  

Coherence 
Ratio              0.4533  0.7524   0.8245  

Mean Trophic
level              2.1289  1.9831   1.9119  

Trophic level
Ratio              0.8209  0.9370   0.9225  

------------------------------------------

Table: Small-world-ness and modularity and coherence, z-scores are calculated against random networks and Ratios against a random network with the same number of basal species with an analytical expression (called the basal network)


------------------------------------------
                 Local  Regional      Meta   
-------------- ------- --------- ---------
Exploitative 
competition      830     42210    285866  

EC z-score     15.4971  592.2163 945.5640 

Apparent 
competition     1983      7842    126552  

AC z-score     63.2947  58.4367  320.3600 


Tri-trophic 
chain            578      3101     61739  

TT z-score     -7.8152  -48.7765 -69.3458 


Omnivory         124      892      36423  

OM z-score     15.3853  89.3244  1022.2137

------------------------------------------

Table: Motif counts and motif z-scores. The proportions for the three scales are different (Pearson's Chi-squared test of independence X-squared = 12612, df = 6, p-value < 2.2e-16)


\normalsize




![Local Food Web trophic level by compartments](Figures/LocalFoodWeb.png)

![Regional Food Web trophic level by compartments](Figures/RegionalFoodWeb.png)

![Meta Food Web trophic level by compartments](Figures/MetaFoodWeb.png)


![Network sub-structural properties across scales, *Meta* represent the marine predator-prey relationships of Antarctica (34.8 million Km^2^), *Regional* represent the Weddell Sea (3.5 million Km^2^), and *Local* a small fjord (6.8 Km^2^). A. Z-scores of four three node motif important for food-web stability. B. Topological roles based in within module degree and among module connectivity](Figures/Motif_TopoRoles_ByNetwork.png){ width=75% }



## Discussion

<!---Metaweb, regional, local food webs -->

* Food webs assembly evolutionary and dynamical constrains [@Poisot2012].

* We expect that at the metacommunity reflect the evolutionary constraints of the species interactions, and the regional and the local should be more influenced by assembly procesess and also strongly determined by the local environment. 


- Motif representation is equal across scales reflecting the influences of evolutionary forces in structuring food-webs, thus the hypothesis than nonadaptative selection is producing motifs patterns is not supported by our results. Moreover these motif patterns seem to be spandrels of adaptative forces ---consequences of adaptative selection and/or coevolution.   

During the assembly process the motif structures that are less dynamically stable tend to disappear from the food-web [@Borrelli2015a], this has been called nonadaptative systemic selection [@Borrelli2015]. This process is nonadaptative because the selection process is not adapting the system to local conditions [@Borrelli2015]. 

- Is this a property of marine food webs only? the same patterns of conservation of motif representation have been found in a similar analysis made for pitcher plant trophic networks.  

- Motif frequency is different this maybe due to nonadaptative systemic selection during the network assembly process

## References


