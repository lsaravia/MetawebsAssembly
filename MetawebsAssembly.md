# From Local to regional and meta food web structure in Antarctica 

# Ecological Network structure across scales: from local to regional

## Abstract 

The idea that ecological networks are built in a sequence of colonization events is not new but has been applied mostly to competitive interactions. Similar processes act in trophic networks (food webs): a regional pool of species is the source from which species colonize local areas, called the meta-web.  Local food webs are realizations of meta-webs that result from assembly processes influenced by migration, habitat filtering, stochastic factors, and dynamical constraints imposed by food web structure. In the present study we analyse three spatial scales: the marine Antarctic meta-web representing an area of 34.8 million Km^2^, the regional Weddell Sea (3.5 million Km^2^) and the local Potter Cove (6.8 Km^2^). The meta-web was built using a dietary database of the Southern Ocean including species located at latitudes higher than 60°S. This set of species takes into account only the predator-prey interactions and does not have a real network structure. We analyse how this nested set of food-webs change across scales using properties at three levels: emergent global properties that take into account the whole network (like modularity), sub-structural properties that consider several nodes (like motifs), and properties related to one node (like topological roles). 
Among the global properties that are important for food webs stability and resilience there are: trophic coherence that is the tendency of nodes to fall into well defined trophic levels; a quantitative measure of the small-world topology, which refers to networks with a short mean path length between species and tightly interconnected clusters of nodes and modularity: the existence of subsets of species that interact more frequently among each other than with other species. As the intermediate level property, we analysed the frequency of three-node motifs that are important for food-webs. As node-level property we analysed topological roles quantified by the within node degree and the among-module connectivity. 
The meta-web had the highest modularity and small-world-ness with values significantly different from the random networks. The regional and local food webs presented a similar structure with progressively less modularity and small-world-ness. Coherence showed an opposite pattern with the meta-web more similar to a random null model, and the local food web being more different. Regarding motif frequency, the local, regional and meta-webs presented a similar general pattern: highest frequency was observed for the competition (exploitative and apparent, in this order) and omnivory motifs, which were over-represented with respect to random networks. On the contrary, the tri-trophic motif exhibited a lower frequency and was under-represented. Beside that there were some differences: in the local food web apparent competition was much higher than exploitative competition, and in the meta-web omnivory was higher than the others. Topological roles displayed a similar pattern across scales, with the difference that the local did not have module hubs, which means less connectivity within modules.
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

The characterization of ecological systems as networks of interacting elements has a long history [@May1972;@Cohen1985;@Paine1966], much of these work has been devoted to investigate network structure and its effects on the dynamics and stability [@Thebault2010]. In recent years, the application of network theory and new developments in random matrix theory has greatly expanded our capability to analyse ecological networks [@Guimaraes2016, @Allesina2015]. Besides, the analyses of the effects of ecological dynamical processes on food web structure are not so well developed. One such dynamic process is community assembly: how species from a regional pool colonize a site and interact to form local communities [@Carstensen2013]. Regional pools are shaped by evolutionary and biogeographical processes that imply large spatial and temporal scales [@Carstensen2013]. More specifically, the assembly of local communities is influenced by dispersal, environmental filters, biotic interactions and stochastic events [@HilleRisLambers2012]. These processes have been studied by means of metacommunity theory, where different spatial assemblages are connected through dispersal of multiple species. Metacommunity theory provides a framework for assessing which are the roles of local and regional-scale dynamics [@Baiser2013;@Leibold2004]. 

<!--- What is unknown -->

Traditionally metacommunity theory has been applied to competitive interactions, while trophic interactions received much less attention [@Baiser2016]. Recently, there was an increase in investigations that focused on food webs assembly, integrating it with island biogeography [@Gravel2011] and with metacommunity [@Pillai2011; @Liao2016]. These were mainly focused on complexity-stability effects [@Mougi2016]. Previous attempts to study the food web assembly process have used motifs as building blocks of local communities [@Baiser2016]. Motifs are sub-networks composed of species and links whose abundance deviates from the expected in a random network [@Milo2002]. By comparing motifs representation at different spatial scales---from regional to local---the process of assembly of interactions may be revealed [@Baiser2016], e.g. if the same processes structure the food-web across scales, motifs representation should be the same. Besides, as local food-webs should have more tight links and stronger interaction rates, other structural properties should change as scale changes [@Coll2011]. 

<!--- Meta-web processes: habitat filtering, dispersal limitation, dynamic instability, spatial scale -->
<!--- Your burning question/hypothesis/aim -->

The objective of the present study is to analyse the process of food-web assembly using three datasets collected at different spatial scales: the marine Antarctic meta-web representing an area of 34.8 million Km^2^ and it is mainly a dietary database [@Raymond2011]; the regional Weddell Sea that represent 3.5 million Km^2^ and is one of the most resolved marine food-webs obtained by a combination of field, laboratory analysis [@Jacob2011]; and the local Potter Cove that represent 6.8 Km^2^, this was build using the results of 20 years of research in the area [@Marina2018]. We analyse how this set of networks change across scales from the meta-web to the two selected food-webs. 

<!--- Your experimental approach -->

There are several approaches to characterize the structure of an ecological networks: emergent or global properties that focus on averages over the entire network (e.g.  modularity or connectance), and more local properties that focuses on how one or several species are related to the whole. Global properties related to resilience and stability are fundamental to understand the response of ecological networks to global treats like climate change and biological invasions. One of these properties is the small-world pattern, associated with rapid responses to disturbances and resistance to secondary extinctions [@Montoya2002]. The small-world pattern is related to two global properties: the average distance between all species, called the path length, and the clustering coefficient, the probability that two species linked to the same species are linked. Then Small-­world patterns imply a high level of clustering compared with a random graph, and a small average path length similar to that seen in random graphs [@Watts1998]. This pattern comes from the general network theory, beyond ecological networks, and has been mostly applied to marine food webs [@Navia2016;@Bornatowski2017;@Gray2016; @Marina2018a]. 

<!--- Coherence -->
Since the early studies of @May1972 that stated that larger and more connected ecosystems will be unstable, there is a search for factors that would stabilize a food-web [@Garcia-Callejas2018], one of such properties is called trophic coherence [@Johnson2014]. Trophic coherence is based on the distances between the trophic levels of species and measures how well species fall into discrete trophic levels; thus more coherence implies a more hierarchical structure of the food-web and it is directly correlated with linear stability [@Johnson2014]. The advantage of coherence as an index of stability is that it does not make any assumptions about interaction strengths. Related to coherence is the mean trophic level, that was also used as an ecosystem health indicator [@Pauly1998], and that predicts that food webs with higher trophic levels are less stable [@Borrelli2014]. 


<!---Modularity -->

Food webs have highly non-random and structurally complex patterns that contain internal functional units or sub-modules [@Grilli2016]. These are groups of prey and predators that interact more strongly with each other than with species belonging to other sub-modules, the existence of these modules (also called compartments) act to buffer the propagation of extinctions throughout the network, thereby increasing its persistence [@Stouffer2011]. It is interesting to mention that small-world patterns and modularity act in opposite directions. The small-world structure favours that perturbations spread and dissipate rapidly [@Gray2016], and a high degree of modularity prevents the spread of perturbations [@Stouffer2011;@Krause2003]. The detection of these modules is an intermediate approach between the global and the local analysis. 

<!---Topological roles -->

There are important species in ecological networks that have disproportionately large effects on the whole ecosystem, like keystone species [@Paine1969], ecosystem engineers [@Jones1994] and network hubs [@Borthagaray2014]. Species can participate in different ways with respect to modularity: depending on how many feed links they have within their own module and/or between the modules [@Guimera2005; @Kortsch2015]. This participation has been called the species' topological role; theoretical and empirical results suggest this roles are related to species traits like wide niche breadth, environmental tolerance, apex position in local communities and high motility [@Borthagaray2014;@Guimera2010;@Rezende2009]. This is a local property at an individual species level. 

<!---Motifs -->
When we consider several linked species this forms a sub-network, when the abundance of one of these sub-networks deviates significantly compared to a random network is called a motif [@Milo2002]. We analyse here the three species sub-networks that have been explored theoretically and empirically [@Prill2005;@Stouffer2007;@Baiser2016], these are four of the thirteen possible three-species sub-networks: the tri-trophic chain, omnivory, apparent competition, and exploitative competition (Figure 1).

![The four three-species sub-networks analysed: apparent competition, exploitative competition, tri-trophic chain, and omnivory. These four sub-networks have been explored both theoretically and empirically in ecological networks and are the most common sub-networks found in food webs](Figures/Fig1Motifs.png)

These motifs can be used to show the process of assembly of interactions [@Baiser2016] by comparing the representation of motifs at each scale (i.e over-represented, under-represented, or random). When the same processes structure of the food-web across scales, motifs representation should be the same. Ecological interactions occur at the local scale so the differences may show the importance of local interactions in the assembly of the food web. During the assembly process the motif structures that are less dynamically stable tend to disappear from the food-web [@Borrelli2015a], this has been called nonadaptative systemic selection [@Borrelli2015]. This process is nonadaptative because the selection process is not adapting the system to local conditions [@Borrelli2015].   

<!---How all these multilevel properties are related to network assembly -->
To our knowledge, the combination of network properties at three different levels has not been applied in food web studies up to now. All these properties would change from the meta-web to a more localized scale where interactions are realized; we will compare them against a random network null model, that represent the absence of ecological mechanisms. We expect that global properties related to resilience and stability should be close to the null model at the meta-web scale and different at the local food-webs; more stable motifs should be more frequent at local food-webs and the frequency of topological roles should change if habitat filtering or dispersal limitation is acting at local food-webs. 


## Methods

The three dataset used in this study encompass a wide range of spatial scales and they were collected independently. The Southern Ocean database compiled by @Raymond2011 was used to construct the meta-web selecting only species located at latitudes higher than 60°S. @Raymond2011 compiled information from direct sampling methods of dietary assessment, including gut, scat, and bolus content analysis, stomach flushing, and observed feeding. We considered that the meta-web is the regional pool of species defined by the biogeographic Antarctic region. Next we analysed two local food webs: the Weddell Sea dataset includes species situated between 74°S and 78°S with a West-East extension of approximately 450 km, comprises all information about trophic interactions available for the zone since 1983 [@Jacob2011]. The Potter Cove dataset comes from a 4 km long and 2.5 km wide Antarctic fjord located at 62°14'S, 58°40'W, South Shetland Islands [@Marina2018]. These food web datasets comprise benthic and pelagic habitats of the Antarctic ecosystem, few aggregated low-trophic level groups (e.g. detritus, diatoms, phytoplankton, zooplankton) and an exceptionally high resolution of the macroalgae community (i.e. 24 biological species of red, brown and green macroalgae). The macroalgae community is responsible for the majority of the primary production and supports a large fraction of secondary production in Antarctic fjords [@Quartino2008a, @Valdivia2015]. The higher trophic levels comprise: invertebrate (e.g. ascidians, sponges, isopods, amphipods, bivalves, gastropods, cephalopods, echinoderms) and vertebrate predator groups (e.g. demersal and pelagic fishes, penguins, seals and whales). For more information about these datasets we refer to the original publications. To make datasets compatible, first we checked taxonomic names for synonyms, and second, we added species (either prey or predator) with their interactions to the meta-web when the local food-webs contains more taxonomic resolution. When the meta-web contained more detailed records, only for predators we added them to the local food-web checking for its geographic range. We remove cannibalistic (self-links) and double arrows (i.d. A eats B and B eats A).  


<!---Cambiar Regional y local porque ambas son locales!!!!!!!!!!! -->

  
### Analysis

We analysed the structural properties of the networks using properties that focus on different levels within the networks: emergent global properties that take into account the whole network, sub-structural properties that consider several nodes, and properties related to one node. To describe food-webs as networks each species is represented as a node or vertex and the feeding interactions are represented as edges or links between de nodes. This links in the case of food-webs are directed from the prey to the predator. Two nodes are neighbours if they are connected by an edge and the degree $k_i$ of node $i$ is the number of neighbours it has. The food web can be represented by an adjacency matrix $A=(a_{ij})$ where $a_{ij}=1$ if species $j$ predates species $i$, else is 0. Then $k_i^{in}=\sum_j{a_{ji}}$ is the number of preys of species $i$ or its in-degree, and $k_i^{out}=\sum_j{a_{ij}}$ is the number of predators of $i$ or its out-degree. The total number of edges is $E=\sum_{ij}a_{ij}$. 

#### Null models 

We considered two null models, the Erdös-Rényi random graph [@Erdos1959], and the meta-web assembly model. An Erdös-Rényi network is constructed assigning at random the $m$ edges to the $n$ nodes with equal probability [@Erdos1959; @Baiser2016]. We restrict the random model eliminating double arrows and cannibalistic links. To calculate trophic level and the coherence parameter (see below) we further restrict to random webs with at least one basal node, if not these calculation were not possible. The random model represent the absence of any mechanism, thus when we test our networks against it we do not obtain information about any hypothesized mechanism. 

To consider the mechanism of network assembly we designed a dynamic meta-web assembly model. In this model species migrate from the meta-web to a local web with a uniform probability $g$, and become extinct from the local web with probability $e$, this is reminiscent of the theory of island biogeography [@MacArthur1967;@Gravel2011], but we added network structure. Species migrate with their potential networks links from the meta-web, thus in the local web species can only survive if there exist at least one its preys or if it is a basal species. Then when a species go extinct locally it may produce secondary extinctions; we check that the local predators maintain at least one prey if not they become extinct independent of the probability $e$. We simulate this model in time and it eventually reach an equilibrium that depends on the migration and extinctions probabilities but also on the structure of the meta-web. For the random model we simulate networks with the  same number of nodes $n$ and edges $m$ than the empirical networks, for the meta-web model we fitted the parameters $g$ and $e$ to obtain networks with $n$ and $m$ close to the empirical networks, for details of the simulations see appendix. 

#### Small-world topology

The first emergent property we used is the small world pattern (SW), this property relates two other properties average distance between the nodes and the clustering that quantifies the extent to which the neighbours of a node are also interconnected [@Watts1998]. We first calculated the minimum path length $L$: minimum path length between two nodes is the minimum number of edges that must be gone through to get from origin node to the target one. Then $L$ is the mean value across all pairs of nodes of the minimum path length. The clustering coefficient of node $i$ was defined as 

$$c_i =\frac{2 E_i}{k_i (k_i -1)}$$ 

where $E_i$ is the number of edges between the neighbours of $i$. The clustering coefficient of the network $C$ is the average of $c_i$ over all nodes. The original definition of small world networks is conceptual [@Watts1998], a network $G$ is small world when if it has a similar path length but greater clustering than an Erdös-Rényi random network with the same number of nodes $n$ and edges $m$. For the quantitative version of the SW pattern we followed @Humphries2008, we need to define:

$$\gamma_g = \frac{C_g}{C_{null}}$$

and

$$\lambda_g = \frac{L_g}{L_{null}}$$

where $C_g$ and $L_g$ are the clustering coefficient and the mean shortest path length of the network of interest $G$; $C_g$ and $C_{null}$ are the same quantities for the corresponding null model. Thus the quantitative small-world-ness is defined as:

$$S = \frac{\gamma_g}{\lambda_g}$$

and to determine if $S$ is statistically significant monte carlo methods are used. We constructed 1000 null model networks with the same number of nodes $n$ and edges $m$---or approximately the same---than the empirical network; then we calculated $S$ for each random network and the lower and higher 99% quantiles of the $S$ distribution are called $ql,qh$:

$$CI = \frac{qh - ql}{2}$$

the upper 99% confidence limit is then $CL^{0.01}= 1 + CI$. Thus if a network has $S > CL^{0.01}$ is considered a small world network [@Humphries2008]. 

#### Coherence 

The second global property is called coherence [@Johnson2014], and is related to stability in the sense that small perturbations could get amplified or vanished, which is called local linear stability [@May1972;@Rohr2014]. We first need to estimate the trophic level of a node (species) $i$ that is defined as the average trophic level of its prey plus 1. That is:

$$tp_i= 1 + \frac{1}{k_i^{in}}\sum_{j}{a_{ij} tp_j}$$ 

where $k_i^{in}=\sum_{j}a_{ji}$ is the number of preys of species $i$, basal species that do not have preys (then $k_i^{in}=0$) are assigned a $tp=1$. Then the trophic difference associated to each edge is defines as $x_{ij}=tp_i - tp_j$. The distribution of trophic differences, $p(x)$, has a mean $E^{-1} \sum_{ij} a_{ij} x_{ij} = 1$ by definition. The trophic coherence is measured by:

$$q = \sqrt{\frac{1}{E} \sum_{ij}a_{ij}x_{ij}^2 - 1}$$


that is the SD of the distribution of trophic distances, a food web will be more coherent when $q$ is closer to zero. When $q = 0$ the maximal coherence is achieved and corresponds to a layered network in which every node has an integer trophic level [@Johnson2014; @Johnson2017]. To compare coherence and trophic level we generated 1000 null model networks with at least one basal species and the same number of species and links---or approximately the same---than the network of interest. Then we calculated the 99% CI using the 0.5% and 99.5% quantiles the distribution of $q$ and $tp$; and the z-scores as:

$$z_i=\frac{q_{obs} - q_{null}}{\sigma_{qnull}}$$

where $q_{obs}$ is the observed coherence, $q_{null}$ is the mean coherence from the null model networks and $\sigma_{qnull}$ is the standard deviation. The same formula is used for $tp$. The z -score thus measures the significance of deviations of the real network from the null hypothesis. If the distribution of the quantity ($q$, $tp$) under the null model is normal, a z-score greater than 2 is evidence than the observed quantity is significantly greater than its random counterpart, and a z-score less than 2 means that the quantity is significantly lower. If the distribution under the null model is skewed this is not necessarily true and thus we must rely on confidence intervals. 

#### Modularity 

The intermediate level property (i.e. between the whole network and the individual species) is modularity, that measures how densely sub-groups of species interact with one another compared to species of other sub-groups [@Newman2004]. These sub-groups are called compartments and to find the best partition we used a stochastic algorithm based on simulated annealing [@Reichardt2006]. Simulated annealing allows to maximize modularity without getting trapped in local maxima configurations [@Guimera2005], the index of modularity is then defined as: 

$$M = \sum_s \left(\frac{I_s}{E} - \left(\frac{d_s}{2E}\right)^2 \right)$$


where $s$ is the number of modules or compartments, $I_s$ is the number of links between species in the module $s$, $d_s$ is the sum of degrees for all species in module $s$ and $E$ is the total number of links for the network. To asses the significance of our networks we calculate the 99% confidence interval and z-scores based on 1000 null model networks as previously described. 

#### Motifs 

We consider here four of thirteen possible three-species subnetworks: the tri-trophic chain, omnivory, apparent competition, and exploitative competition motifs (Figure 1). These are the only motifs present in all the networks analysed in the present study. We compared the frequency of these motifs to 1000 null model networks as previously described. We calculated the 99% confidence interval and the z-score of motif counts using the equation:  

$$z_i=\frac{N_{obs} - N_{null}}{\sigma_{null}}$$

where $N_{obs}$ is the observed number of a given motif, $N_{null}$ is the mean count and $\sigma_{null}$ is the standard deviation for the null model networks. To determine if the proportions of motifs change across networks we use the Pearson's Chi-squared test with simulated p-value based on 10000 Monte Carlo replicates.


#### Topological roles 

As a local property that reflect the ecological role of each species we use topological roles. To identify topological roles we use the method of functional cartography [@Guimera2005]. The method is based on module membership and we used the previously described algorithm to detect them. The roles are characterized by two parameters: the standardized within-module degree $dz$ and the among-module connectivity participation coefficient $PC$.  The within-module degree is a z-score that measure how well a species is connected to other species within its own module:

$$dz_i = \frac{k_{is}-\bar{k_s} }{\sigma_{ks}}$$ 


where $k_{is}$ is the number of links of species $i$ within its own module $s$ and $\bar{k_s}$ and $\sigma_{ks}$ are the average and SD of $k_{is}$ over all species in $s$. The participation coefficient $PC$ estimates the distribution of the links of species $i$ among modules; thus it can be defined as:

$$PC_i =  1 - \sum_s \frac{k_{is}}{k_i}$$ 

where $k_i$ is the degree of species $i$ (i.e. the number of links), $k_{is}$ is the number of links of species $i$ to species in module $s$, and in this case $s$ runs over all the modules. Due to the stochastic nature of the module detection algorithm we made repeated simulations until the distribution of $PC_i$ and $dz_i$ has no statistical differences between two successive repetitions. To test that they come from the same distribution we used the k-sample Anderson-Darling test [@Scholz1987]. Then we calculate the mean and 95% CI of $dz$ and $PC$.

To determine each species' role the $dz-PC$ parameter space is divided into four regions, this was modified from @Guimera2005, using the same scheme of @Kortsch2015. There are two thresholds that define the roles: $dz=2.5$ and $PC=0.625$. If a species has at least 60% of links within its own module then $PC<0.625$ and if it also has $dz\ge 2.5$, it is classified as a module hub. These species a relatively high number of links, but inside his module. If a species has $dz<2.5$ and $PC<0.625$ is called peripheral or specialist, it means that it has relatively few links and most within its module. Species that have $dz<2.5$ and $PC\ge0.625$ are module connectors, they have relatively few links and most between modules. Finally if a species has $dz\ge 2.5$ and $PC\ge0.625$ it is classified as super-generalist because it has high between- and within-module connectivity. To test if the proportion of species with each of the roles changes for the different networks we made a Pearson's Chi-squared test with simulated p-value based on 10000 Monte Carlo replicates.

We combined the topological roles with the trophic level of each species and the compartments in one plot to give an integrated visualization of these sub-structural and local properties of the food web.

All analyses and simulations were made in R version 3.4.3 [@RCoreTeam2017], the igraph package version 1.1.2 [@Csardi2006] for motifs and topological roles and the package NetIndices [@Kones2009] for trophic levels. All the source code and data is available at <https://github.com/lsaravia/MetawebsAssembly>.  


## Results

### Global network properties

The networks have values for connectance, numbers of species (size) and links (Table 1), that are well inside the range found for marine food webs [@Marina2018a]. Assuming a power-law relationship between species and area the exponent is 0.14 also compatible with other experimental results [@Rosindell2007]. All networks present the small-world structure as their small-world-ness index is larger than the 99% CI (Table 1). By definition a network is more coherent when its $q$ index is closer to zero, all networks have a significant smaller $q$ value (Table S1); thus they are more coherent than a random network. The regional an local networks have similar values and both are smaller than the meta-web, thus they are more locally stable as they are more coherent. Mean trophic level is always lower than its random counterpart, and similar between networks. For these two last metrics local z-scores are smaller for the local food-web and greater for regional and meta-web, this means that smaller networks present more variability than larger ones. Modularity is greater and significant for meta-web and regional networks and not significant and smaller for the local networks. Modularity shows an opposite pattern with coherence, more modularity imply less coherence, and in consequence less stability.  

\scriptsize

----------------------------------------------
Network             Potter    Weddell     Meta  
----------------- -------- ---------- --------
Size                   91        437       859  

Links                  309       1908     9003  

Area (Km^2^)           6.8      3.5e6   34.8e6

Connectance         0.0373     0.0100   0.0122 

PathLength          1.8106     2.1965   2.5655 

Clustering          0.0989     0.0480   0.2164 

Small-World-ness    2.7536     4.6855   10.866

SWness random       2.0670     2.2683   1.711
99%CI        

SWness assembly     0.4182     0.2081
99%CI           

Coherence           0.5319     0.4508   0.7037  

Coherence          *-0.5376  *-2.0767  *-3.535
random 
z-score    

Coherence          -0.2546   *-3.3322 
assembly
z-score    

Mean Trophic        2.1289     1.9831   1.9119
level         

Trophic level      *-0.2701  *-0.8567 *-1.6021
random
z-score        

Trophic level       1.2792     1.0847
assembly
z-score        


Modularity          0.3720    0.4784   0.4456 

Modularity          0.8883   *18.9697  *85.750
random
z-score

Modularity         -0.3773    0.3805          
assembly 
z-score
----------------------------------------------

Table: Network global properties across scales, *Meta* represents the marine predator-prey relationships of Antarctica, *Weddell* is the Weddell Sea food web, and *Potter* the Potter Cove food web (). Z-scores are calculated against 1000 random networks or 1000 networks generated with the meta-web assembly model. Quantities marked with '*' are significant at 1% level. A negative z-score means that the quantity is smaller than the expectation for null model networks; a positive z-score means that is greater.


### Sub-structural properties (motifs)

The representation of three species sub-networks showed the same patterns in all networks (Figure 2 A, Table 2). Exploitative competition, apparent competition, and omnivory are over-represented, the three trophic chains are under-represented and all these patterns are significant (Table S2). The z-scores are lower for smaller sized networks showing that smaller networks are more variable. The motifs proportions for the three scales are different (Chi-squared = 12612, p-value < 9.999e-05), this means that local and regional networks are not a random sample of the meta-web. 

![Network sub-structural properties across scales, *Meta* represents the marine predator-prey relationships of Antarctica (34.8 million Km^2^), *Regional* represents the Weddell Sea (3.5 million Km^2^), and *Local* a small fjord (6.8 Km^2^). A. Z-scores of four three node motif important for food-web stability. B. Topological roles based in within module degree and among module connectivity](Figures/Motif_TopoRoles_ByNetwork.png){ width=75% }


------------------------------------------
                 Local  Regional      Meta   
-------------- ------- --------- ---------
Exploitative 
competition      *830    *42210    *285866  

EC z-score     15.4971  592.2163  945.5640 

Apparent 
competition     *1983     *7842    *126552  

AC z-score      63.2947  58.4367  320.3600


Tri-trophic 
chain            *578      *3101    *61739  

TT z-score     -7.8152  -48.7765 -69.3458 


Omnivory        *124      *892      *36423  

OM z-score     15.3853  89.3244  1022.2137

------------------------------------------

Table: Motif counts and z-scores across scales, *Meta* represents the marine predator-prey relationships of Antarctica, *Regional* represents the Weddell Sea food web, and *Local* a small fjord food web (Potter Cove). Z-scores were calculated against 1000 random networks. Quantities marked with '*' are significant at 1% level. A negative z-score means that the quantity is smaller than the expectation for random networks; a positive z-score means that is greater. The proportions for the three scales are different (Chi-squared = 12612, df = 6, p-value < 2.2e-16)


\normalsize

### Node level properties (Topological roles)

The proportion of species with the four topological roles is different as the spatial scale changes (Chi-squared = 79.308, p-value = 9.999e-05). This is observed as a higher presence of module connectors (few links, mostly between modules) in regional network, and the lack of module hubs (high number of links inside its module) in the local network (Figure 2 B). This last characteristic of the local network can be related to its low modularity value (Table 1). The plot of topological roles combined with trophic levels and modularity reveals some unexpected details of the food webs (Figure 3): in the meta-web there are densely connected compartments but some compartments have few low connected species (module connectors or module specialists).We run the compartimentalization algorithm several times to check if this was a consistent result and always the same structure was obtained. This asymmetry in the number of species by module maybe a characteristic of meta-webs. The second surprising result is that we observed in the regional network hub connectors with a basal trophic level. These are aggregated nodes that represent generic preys, e.g. fish or zooplankton, they only have incoming links or predators and they cannot have outgoing links or preys because they comprise a lot of species. Different fish species are present in the regional food with correctly specified preys and predators, but this reflects the fact that for some predators there is insufficient knowledge of its preys and aggregated nodes must be added to the food-web. Thus the existence of these basal hub connectors is a spurious result of aggregating prey species. The other non-aggregated hub connectors are highly mobile species with an intermediate trophic level like krill (Table S3). The variation of maximum trophic levels is also observed in Figure 3, and both local and meta-web have similar values whereas the regional food-web has lower values. 


![Food Web structure showing trophic level by compartments (modules) and topological roles. The topological roles are classified with reference to random networks: *Hub connectors* have a high number of between module links, *Module connectors* have a low number of links mostly between modules,  *Module hubs* have a high number of links inside its module. *Module specialists* have a low number of links inside its module. The size of the species nodes is proportional to the log of its degree](Figures/AllTopoRoles_TL_MOD.png)





## Discussion

We expect that the meta-web structure reflects the evolutionary constraints of the species interactions and local and the regional networks should be more influenced by assembly processes and also strongly determined by the local environment. 
Our results suggest that the structure of the meta-web does not change significantly as we change the scale with respect to the random network model, but there are indeed some evidences that the processes of dynamical assembly, habitat filtering and dispersal limitation are acting. Thus food-webs are mainly shaped by evolutionary forces and are also constrained by dynamical assembly processes.

Global level network properties showed the same patterns across scales and most of them are significantly different of the null random network model. Modularity for the local food-web is the only property not different from the null model, some studies showed that modularity enhance local stability [@Stouffer2011] but later was demonstrated that this strongly depends on the interaction strengths configuration [@Grilli2016] and on the existence of external perturbations [@Gilarranz2017]. This is consistent with the values we find for coherence, that is a proxy of dynamical local stability. Regional and local food-webs are more coherent than the meta-web, because dynamical stability is not expected to be maximized at the level of the meta-web. Then the local food-web is more stable but not modular. We cannot define if this effect is the product of dynamical pruning---the selection of more stable structures due to the dynamical assembly of the food-web---or if the consequence of the meta-web structure.

All networks have a significant value of small-world-ness but the local and regional food-webs have lower values. In general food webs do not show small-world structure [@Dunne2002a; @Marina2018a] this suggest that small-world property is inherited from the meta-web to regional and local food-webs and that this property is not influenced by a greater percentage of realized interactions. If small-world-ness would be determinant for an increased resilience and robustness to secondary extinctions [@Bornatowski2017], this value should be bigger at local and regional food-webs, not the contrary.

Motifs also have the same representation patterns, but smaller scale food-webs should have motifs patterns that increase its persistence. The expected pattern that enhances persistence is over-representation of omnivory and tri-trophic chain and under-representation of apparent competition and exploitative competition [@Stouffer2010]. Other studies showed that tri-trophic chains, exploitative competition, and apparent competition should be expected more frequently, but the last one was based on the stability of isolated three species sub-networks [@Borrelli2015a] and the assumption that during the assembly process these 3 species sub-networks are selected because of their intrinsic stability [@Borrelli2015]. The fact that tri-trophic (or n-trophic) interactions cannot account fully for the properties of the food webs [@Cohen2009a] make the results based on isolated modules less convincing. Our results showed and over-representation of omnivory, exploitative competition and apparent competition, this configuration is not the most stable one (based on @Stouffer2010), an hypothetical explanation is that the structure observed in the meta-web is maintained at local food-webs. Thus this tri-trophic motifs are undesired consequences of evolutionary or coevolutionary forces, this kind of structures that are a sub-product of process that happen at a different level have been called spandrels of assembly [@Sole2006a].   
Even though the local food-webs showed the same representation pattern, the assembly process is not random, there are differences in the frequencies of motifs as the scale change, this implies that other dynamical processes that influence the presence or absence of species like habitat filtering or dispersal limitation are acting and probably modify interaction strengths.  

As expected all the networks have a short mean trophic level [@Williams2002;@Borrelli2014], which points in the same direction as small-world structure: perturbations can spread quickly trough the food web. Different hypothesis were posed to explain this pattern: the low efficiency of energy transfer between trophic levels, productivity and the size of the ecosystems [@Young2013]. These have contradictory support, reviewed by @Ward2017. Recently has been proposed that maximum trophic level could be related to productivity and ecosystem size depending on the context but related to energy fluxes that promote omnivory [@Ward2017]. A different mechanism based on dynamic stability of the whole web was proposed: food-webs with smaller trophic levels (between 2 and 4) that have more omnivore chains are more probable to be stable which increase the probability of being observed in nature [Borrelli2014]. These two mechanism are compatible with our finding of an over-representation of the omnivory motif, but these mechanisms do not apply to the meta-web so our results suggest that omnivory could be also a by-product of evolutionary forces.


Topological roles are useful to detect the existence of functional roles of species like super generalists (or hub connectors), these roles may change as the scales change. The simple explanation is that modules also change, modules are usually associated with habitats in Arctic and Caribbean marine food webs [@Kortsch2015; @Rezende2009]. For example the Antarctic cod (*Notothenia coriiceps*) is a super generalist for the local food-web and a module hub---a species with most of their link between its module---for the meta web. This means that the same species can have different influence on the food-web depending on the type or extension of the habitat considered. Besides that, the existence of the same topological roles suggest similar food-web organization. Our results showed that there is a change in topological roles that is mainly observed at the local scale. The extension of the local food-web (Potter Cove) is very small compared with the others, so it will comprise a smaller amount of different habitats. Thus, habitat filtering should be an important factor, this could be reflected in the absence module hubs, and the lack of a modular structure. 

Our results strongly depend on the null model that was used, our null model was a standard Erdös-Rényi random network devoid of any mechanism, thus when results are significant we know that for a particular property there is a biological mechanism derived from that property. As we were comparing different nested scales: meta-web and regional; meta-web and local, it is difficult to evaluate if the pattern is inherited from one scale to another or if different mechanisms produce the same effect at different scales. Thus null models representing or not each of the hypothesized processes involved would be needed to improve our results. 

The spatial scales involved in our study do not represent a continuity, the meta-web and regional web have a 10 to 1 ratio but the local web is 10^6^ smaller, besides that most of the global network properties and the motif structure showed no changes relative to the null model. Thus we found evidence that local processes that limit species from the meta-web to local scales are influencing the assembly process but the structure of the food-web originated trough an emergent process from evolutionary or co-evolutionary forces seems to be more important. This could guide us to find a unified theory of ecological interactions that could describe the diversity of patterns observed in the natural world. 

## Acknowledgements

LAS and SRD are grateful to the National University of General Sarmiento for financial support. LAS would like to thank Susanne Kortsch, that provided her source code for topological analysis and the corresponding figures. This work was partially supported by a grant from CONICET (PIO 144-20140100035-CO). 

## References


