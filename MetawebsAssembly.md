# Ecological Network assembly: how the regional meta web influence local food webs 

## Abstract 

The idea that ecological networks are built in a sequence of colonization events is not new but has been applied mostly to competitive interactions. Similar processes act in trophic networks, i.e. food webs: a regional pool of species act as the source from which species colonize local areas, called the metaweb. Local food webs are realizations of metawebs that result from assembly processes influenced by migration, habitat filtering, stochastic factors, and dynamical constraints imposed by food-web structure. We analyse how the structure of a metaweb influence local food webs with different spatial scales, using an assembly model, a random model and properties at three levels: emergent global properties that take into account the whole network e.g. modularity, sub-structural properties that consider several nodes e.g. motifs, and properties related to one node e.g. topological roles. Three independent data-sets were included: the marine Antarctic metaweb (34.8 million Km2), the Weddell Sea (3.5 million Km2) and Potter Cove (6.8 Km2) food webs. Looking at the global properties, the metaweb presents a structure very different from the random model, while the local food webs follow the same pattern and are very similar to the assembly model. The assembly model only takes into account migration, local extinction and secondary extinctions. For sub-structural properties the metaweb and the local food webs also showed the same pattern against the random model, but we found differences compared to the assembly model that did not increase the local stability of food webs. Topological roles also showed differences between the metaweb and local food webs that were explained by the assembly model. We found that a great portion of the structure of the food webs is determined by evolutionary processes that act on large temporal and spatial scales. On the contrary, dynamical processes that favour stability have a small influence, but habitat filtering or dispersal limitations seem to be important factors that determine food web structure. 

**Leonardo A. Saravia** ^1^ ^2^, **Tomás  I. Marina** ^1^ ^2^ ^3^, **Marleen De Troch** ^4^, **Fernando R. Momo** ^1^ ^2^ 

1. Instituto de Ciencias, Universidad Nacional de General Sarmiento, J.M. Gutierrez 1159 (1613), 
Los Polvorines, Buenos Aires, Argentina.

2. INEDES, Universidad Nacional de Luján, CC 221, 6700 Luján, Argentina.

3. Consejo Nacional de Investigaciones Científicas y Técnicas (CONICET)

4. Marine Biology, Ghent University, Krijgslaan 281/S8, B-9000, Ghent, Belgium.

\newpage

## Introduction

<!--- What is known -->

The characterization of ecological systems as networks of interacting elements has a long history [@May1972;@Cohen1985;@Paine1966]. Much of this work has been devoted to investigate network structure and its effects on dynamics and stability [@Thebault2010]. In recent years a renewed emphasis on structural stability [@Rohr2014; @Grilli2017] and new developments in random matrix theory has greatly expanded our capability to analyse ecological networks [@Allesina2015]. However, the analyses of the effects of ecological dynamical processes on food web structure are not so well developed. One such dynamic process is community assembly: how species from a regional pool colonize a site and build local interactions [@Carstensen2013]. Regional species pools are shaped by evolutionary and biogeographical processes that imply large spatial and temporal scales [@Carstensen2013;@Kortsch2018]. More specifically, the assembly of local communities is influenced by dispersal, environmental filters, biotic interactions and stochastic events [@HilleRisLambers2012]. These processes have been studied by means of metacommunity theory [@Leibold2017], where different spatial assemblages are connected through species dispersal. 

Metacommunity theory provides a framework for assessing the roles of local- and regional-scale dynamics [@Baiser2013;@Leibold2004]. This approach has been applied mostly to competitive interactions, whereas trophic interactions have received less attention [@Baiser2016]. Recently, there has been an increase in food web assembly studies, integrating them with island biogeography [@Gravel2011] and with metacommunity [@Pillai2011; @Liao2016]. These were mainly focused on complexity-stability effects [@Mougi2016]. Previous attempts to study the food web assembly process have used motifs as building blocks of local communities [@Baiser2016]. Motifs are sub-structures in networks composed of species and links whose frequency deviates from the expected in a random network [@Milo2002]. By comparing motif representation at different spatial scales---from local to regional---the process of assembly of interactions may be revealed [@Baiser2016], e.g. if the same processes structure the food web across scales, motif representation should be the same. Besides, as local food webs should have tighter links and stronger interaction rates, other structural properties should change as scale changes [@Coll2011]. 

<!--- Metaweb processes: habitat filtering, dispersal limitation, dynamic instability, spatial scale -->
<!--- Your burning question/hypothesis/aim -->
The objective of the present study is to analyse the process of food web assembly addressing how multilevel network properties change across different spatial scales. For this we considered: the Antarctic metaweb, representing an area of 34.8 million Km^2^, and build from a dietary database [@Raymond2011]; the Weddell Sea food web that represents 3.5 million Km^2^ [@Jacob2011]; and the Potter Cove network that represents 6.8 Km^2^, [@Marina2018]. 

<!--- Your experimental approach -->

There are several approaches to characterize the structure of ecological networks: emergent or global properties that focus on averages over the entire network (e.g.  modularity or connectance), and more local properties that focus on how one or several species are related to the whole. Global properties related to resilience and stability are fundamental to understand the response of ecological networks to global threats like climate change and biological invasions. One of these properties is the small-world pattern, associated with rapid responses to disturbances and resistance to secondary extinctions [@Montoya2002]. The small-world pattern is related to two global properties: the average of the shortest distance between all species, called the characteristic path length, and the clustering coefficient, the probability that two species linked to the same species are linked. Then, small-­world patterns imply a high level of clustering and a short average path length compared to random networks [@Watts1998]. This pattern comes from the general network theory, beyond ecological networks, and has been recently applied to marine food webs [@Navia2016;@Bornatowski2017;@Gray2016; @Marina2018a]. 

<!--- Coherence -->
Since the early studies of @May1972 stating that larger and more connected ecosystems will be unstable, there has been a search for factors that would stabilize food webs [@Garcia-Callejas2018]; one of the potential properties is trophic coherence [@Johnson2014]. Trophic coherence is based on the distances between the trophic positions of species and measures how well species fall into discrete trophic levels. Then, more coherence implies a more hierarchical food-web structure , which is directly correlated with linear stability [@Johnson2014]. The advantage of coherence as an index of stability is that it does not make any assumptions about interaction strengths. A property related to coherence is the mean trophic level, which historically has been used as an ecosystem health indicator [@Pauly1998], predicting that food webs with higher trophic levels are less stable [@Borrelli2014]. 


<!---Modularity -->

Food webs have structurally complex and highly non-random patterns that contain internal functional units or sub-modules [@Grilli2016]. These are groups of prey and predators that interact more strongly with each other than with species belonging to other modules. These modules (also called compartments) act as a buffer to the propagation of perturbations throughout the network, increasing its persistence [@Stouffer2011]. It is interesting to mention that small-world patterns and modularity act in opposite directions. Whereas the small-world structure favours the spread of perturbations through its rapid dissipation [@Gray2016], the presence of a high degree of modularity prevents the dispersal of perturbations [@Stouffer2011;@Krause2003]. The detection of these modules is an intermediate approach between the global and local analyses. 

<!---Topological roles -->

Species may participate in different ways with respect to modularity, depending on how many trophic links they have within their own module and/or between modules [@Guimera2005; @Kortsch2015]. This participation with respect to modularity is called a species' topological role. Theoretical and empirical results suggest these roles are related to species traits, such as wide niche breadth, environmental tolerance, apex position in local communities and high motility [@Borthagaray2014;@Guimera2010;@Rezende2009;@Kortsch2015]. This is a local property at an individual species level. 

<!---Motifs -->
If we consider a subset of linked species inside the food web this forms a sub-network, when the abundance of one of these sub-networks deviates significantly from a null model network, this is called a motif [@Milo2002]. Besides this definition, in the ecological literature motif has been used as a synonim of sub-network. We analyse here the three-species sub-networks that have been most studied theoretically and empirically in food webs [@Prill2005;@Stouffer2007;@Baiser2016]. Specifically, we focused on four of the thirteen possible three-species sub-networks: apparent competition, exploitative competition, tri-trophic chain, and omnivory (Figure 1).

![The four three-species sub-networks analysed: apparent competition, exploitative competition, tri-trophic chain, and omnivory. These four sub-networks have been explored both theoretically and empirically in ecological networks and are the most common sub-networks found in food webs](Figures/Fig1Motifs.png)

The frequency of motifs at different spatial scales (i.e over-represented, under-represented, or random) may reveal aspects about the process behind the assembly of interactions [@Baiser2016]. If the same processes structure the food web across scales, motif representation should be the same. Ecological interactions occur at the local scale so differences may show the importance of local interactions in the assembly of the food web. During the assembly process those motif structures that are less dynamically stable tend to disappear from the food web [@Borrelli2015a], this has been called non-adaptative systemic selection [@Borrelli2015]. The process is non-adaptative because the selection process is not adapting the system to local conditions [@Borrelli2015].   

<!---How all these multilevel properties are related to network assembly -->
In this study, we analyze food web assembly from a metaweb to local networks with different spatial scales. To our knowledge, combining modularity, trophic coherence and motifs at different spatial scales has not been applied in food web studies up to now. First we compared the networks---including the metaweb---against a random network model (i.e. absence of ecological mechanisms), and a metaweb assembly model (i.e. representing an assembly process). We hypothesize that network properties will change from the metaweb to a local scale at which interactions are realized. We particularly expect global properties related to resilience and stability to be close to the random null model at the metaweb scale and significantly different at the local scale; a greater frequency of stable motifs in the local food webs; as well as a change in the frequency of topological roles since habitat filtering or dispersal limitation act at the local food web scale. These last two changes also should be reflected as differences from the metaweb assembly model. 

## Methods

The three datasets used in this study encompass a wide range of spatial scales and were collected independently. The Southern Ocean database compiled by @Raymond2011 was used to construct the Antarctic metaweb selecting only species located at latitudes higher than 60°S. @Raymond2011 compiled information from direct sampling methods of dietary assessment, including gut, scat, and bolus content analysis, stomach flushing, and observed feeding. We considered that the metaweb is the regional pool of species defined by the biogeographic Antarctic region. Next we analysed two local food webs: the Weddell Sea food web dataset includes species situated between 74°S and 78°S with a West-East extension of approximately 450 km, and comprises all information about trophic interactions available for the zone since 1983 [@Jacob2011]. The Potter Cove dataset comes from a 4 km long and 2.5 km wide Antarctic fjord located at 62°14'S, 58°40'W, South Shetland Islands [@Marina2018]. These food web datasets comprise benthic and pelagic habitats of the Antarctic ecosystem, few aggregated low-trophic level groups (e.g. detritus, diatoms, phytoplankton, zooplankton) and a high resolution of the macroalgae community (i.e. 24 biological species of red, brown and green macroalgae). The macroalgae community is responsible for the majority of the primary production and supports a large fraction of secondary production in Antarctic fjords [@Quartino2008a, @Valdivia2015]. Higher trophic levels comprise: invertebrate (e.g. ascidians, sponges, isopods, amphipods, bivalves, gastropods, cephalopods, echinoderms) and vertebrate predator groups (e.g. demersal and pelagic fishes, penguins, seals and whales). For more information about these datasets we refer to the original publications. To make datasets compatible, we first checked taxonomic names for synonyms, and second, we added species (either prey or predator) with their interactions to the metaweb when the local food webs contain a greater taxonomic resolution. When the metaweb contained more detailed records, only for predators we added them to the local food webs checking for its geographic range. We removed cannibalistic (self-links) and double arrows (i.d. A eats B and B eats A).  


<!---Cambiar Regional y local porque ambas son locales!!!!!!!!!!! -->

  
### Analysis

We analysed the structure of the networks using properties that focus on different levels: emergent global properties that take into account the whole network, sub-structural properties that consider several nodes, and properties related to one node. To describe food webs as networks each species is represented as a node or vertex and the trophic interactions are represented as edges or links between de nodes. These links are directed, from the prey to the predator, as the flow of energy and matter. Two nodes are neighbours if they are connected by an edge and the degree $k_i$ of node $i$ is the number of neighbours it has. The food web can be represented by an adjacency matrix $A=(a_{ij})$ where $a_{ij}=1$ if species $j$ predates species $i$, else is 0. Then $k_i^{in}=\sum_j{a_{ji}}$ is the number of preys of species $i$ or its in-degree, and $k_i^{out}=\sum_j{a_{ij}}$ is the number of predators of $i$ or its out-degree. The total number of edges is $E=\sum_{ij}a_{ij}$. 

#### Null models 

We considered two null models, the Erdös-Rényi random graph [@Erdos1959], and the metaweb assembly model. An Erdös-Rényi network is constructed fixing the number of edges and nodes and assigning at random the $m$ edges to the $n$ nodes with equal probability [@Erdos1959; @Baiser2016]. We restricted the random model eliminating double arrows and cannibalistic links. To calculate trophic level and the coherence parameter (see below) we further restricted to random webs with at least one basal node, to make these calculations possible. Since the random model represents the absence of any network assembly mechanism, the comparison against it does not guarantee information on this aspect. 

In order to consider network assembly mechanisms we designed a dynamic metaweb assembly model. In this model species migrate from the metaweb to a local web with a uniform probability $c$, and become extinct from the local web with probability $e$; a reminiscence of the theory of island biogeography [@MacArthur1967;@Gravel2011], but with the addition of network structure. Species migrate with their potential network links from the metaweb, then in the local web species can only survive if at least one of its preys is present, or if it is a basal species. When a species goes extinct locally it may produce secondary extinctions; we check that the local predators maintain at least one prey if not they become extinct independent of the probability $e$. We simulated this model in time and it eventually reaches an equilibrium that depends on the migration and extinction probabilities but also on the structure of the metaweb. The ratio of immigration vs. extinction $\alpha= c/e$ is hypothesized to be inversely related to the distance to the mainland [@MacArthur1967], and as extinction $e$ should be inversely proportional to population size [@Hanski1999], the ratio $\alpha$ is also hypothesized to be related to the local area.

For the random model we simulated networks with the same number of nodes $n$ and edges $m$ as the empirical networks; for the metaweb model we fitted the parameters $g$ and $e$ to obtain networks with $n$ and $m$ close to the empirical networks. This implies that $\alpha$ should reflect the differences in areas of the two local food webs. For details of the fitting and simulations see Appendix. 

#### Small-world topology

The first global emergent property we used is the small-world pattern, which examines the average of the shortest distance between nodes and the clustering coefficient of the network [@Watts1998]. We first calculated the characteristic path length that is the shortest path between any two nodes. Then $L$ is the mean value of the shortest path length across all pairs of nodes. 
The clustering coefficient of node $i$ was defined as 

$$c_i =\frac{2 E_i}{k_i (k_i -1)}$$ 

where $E_i$ is the number of edges between the neighbours of $i$. The clustering coefficient of the network is the average of $c_i$ over all nodes. The original definition of small-world networks is conceptual [@Watts1998], a network $G$ is small-world when it has a similar mean shortest path length but greater clustering than an Erdös-Rényi random network with the same number of nodes $n$ and edges $m$. For the quantitative version of the small-world pattern we followed @Humphries2008; we need to define:

$$\gamma_g = \frac{C_g}{C_{null}}$$

and

$$\lambda_g = \frac{L_g}{L_{null}}$$

where $C_g$ and $L_g$ are the clustering coefficient and the mean shortest path length of the network of interest $G$; $C_g$ and $C_{null}$ are the same quantities for the corresponding null model. Thus, the quantitative small-world-ness is defined as:

$$S = \frac{\gamma_g}{\lambda_g}$$

and to determine if $S$ is statistically significant Monte Carlo methods are used. We built 1000 null model networks with the same number of nodes $n$ and edges $m$ than the empirical network; then we calculated $S$ for each random network and the lower and higher 99% quantiles of the $S$ distribution are called $ql,qh$:

$$CI = \frac{qh - ql}{2}$$
 
the upper 99% confidence limit is then $CL^{0.01}= 1 + CI$. Thus, if a network has $S > CL^{0.01}$ it is considered a small-world network [@Humphries2008]. We also calculated the small-world-ness and the CI using the metaweb assembly model as a null model.

#### Coherence 

The second global property is called trophic coherence [@Johnson2014], and is related to stability in the sense that small perturbations could get amplified or vanished, which is called local linear stability [@May1972;@Rohr2014]. We first needed to estimate the trophic level of a node $i$, defined as the average trophic level of its preys plus 1. That is:

$$tp_i= 1 + \frac{1}{k_i^{in}}\sum_{j}{a_{ij} tp_j}$$ 

where $k_i^{in}=\sum_{j}a_{ji}$ is the number of preys of species $i$, basal species that do not have preys (then $k_i^{in}=0$) are assigned a $tp=1$. Then the trophic difference associated to each edge is defined as $x_{ij}=tp_i - tp_j$. The distribution of trophic differences, $p(x)$, has a mean $E^{-1} \sum_{ij} a_{ij} x_{ij} = 1$ by definition. Then the trophic coherence is measured by:

$$q = \sqrt{\frac{1}{E} \sum_{ij}a_{ij}x_{ij}^2 - 1}$$


that is the standard deviation of the distribution of all trophic distances. A food web is more coherent when $q$ is closer to zero, thus the maximal coherence is achieved when $q = 0$, and corresponds to a layered network in which every node has an integer trophic level [@Johnson2014; @Johnson2017]. To compare coherence and trophic level we generated 1000 null model networks with at least one basal species and the same number of species and links---or approximately the same---than the network of interest. Then we calculated the 99% confidence interval using the 0.5% and 99.5% quantiles of the distribution of $q$; we also calculated the confidence interval for the mean trophic level $tp$. We calculated the z-scores as:

$$z_i=\frac{q_{obs} - q_{null}}{\sigma_{qnull}}$$

where $q_{obs}$ is the observed coherence, $q_{null}$ is the mean coherence from the null model networks and $\sigma_{qnull}$ is the standard deviation. The same formula is used for $tp$. The z -score thus measures the significance of deviations of the real network from the null hypothesis. If the distribution of the quantity ($q$, $tp$) under the null model is normal, a z-score greater than 2 is evidence than the observed quantity is significantly greater than its random counterpart, and a z-score less than 2 means that the quantity is significantly lower. If the distribution under the null model is skewed this is not necessarily true and thus we must rely on confidence intervals. 

#### Modularity 

An intermediate level property (i.e. between the whole network and the individual species) is modularity. It measures how strongly sub-groups of species interact between them compared with the strength of interaction with other sub-groups [@Newman2004]. These sub-groups are called compartments, and in order to find the best partition we used a stochastic algorithm based on simulated annealing [@Reichardt2006]. Simulated annealing allows to maximize modularity without getting trapped in local maxima configurations [@Guimera2005]. The index of modularity was defined as: 

$$M = \sum_s \left(\frac{I_s}{E} - \left(\frac{d_s}{2E}\right)^2 \right)$$


where $s$ is the number of modules or compartments, $I_s$ is the number of links between species in the module $s$, $d_s$ is the sum of degrees for all species in module $s$ and $E$ is the total number of links for the network. To assess the significance of our networks we calculate the 99% confidence intervals and z-scores based on 1000 null model networks as previously described. 

#### Motifs 

We considered four of the thirteen possible three-species sub-networks: apparent competition, exploitative competition, tri-trophic chain, and omnivory (Figure 1). These are the only motifs present in all networks analysed here. We compared the frequency of these motifs to 1000 null model networks using the 99% confidence interval and the z-score as previously described. To determine if the proportions of motifs change across networks we use the Pearson's Chi-squared test with simulated p-value based on 10000 Monte Carlo replicates.


#### Topological roles 

As a local property that reflect the ecological role of each species we determined topological roles using the method of functional cartography [@Guimera2005], which is based on module membership (See modularity). The roles are characterized by two parameters: the standardized within-module degree $dz$ and the among-module connectivity participation coefficient $PC$.  The within-module degree is a z-score that measures how well a species is connected to other species within its own module:

$$dz_i = \frac{k_{is}-\bar{k_s} }{\sigma_{ks}}$$ 


where $k_{is}$ is the number of links of species $i$ within its own module $s$, $\bar{k_s}$ and $\sigma_{ks}$ are the average and standard deviation of $k_{is}$ over all species in $s$. The participation coefficient $PC$ estimates the distribution of the links of species $i$ among modules; thus it can be defined as:

$$PC_i =  1 - \sum_s \frac{k_{is}}{k_i}$$ 

where $k_i$ is the degree of species $i$ (i.e. the number of links), $k_{is}$ is the number of links of species $i$ to species in module $s$. Due to the stochastic nature of the module detection algorithm we made repeated runs of the algorithm until there were no statistical differences between the distributions of $PC_i$ and $dz_i$ in successive repetitions; to test such statistical difference we used the k-sample Anderson-Darling test [@Scholz1987]. Then we calculated the mean and 95% confidence interval of $dz$ and $PC$.

To determine each species' role the $dz-PC$ parameter space was divided into four areas, modified from @Guimera2005, using the same scheme as @Kortsch2015. Two thresholds were used to define the species’ roles: $PC=0.625$ and $dz=2.5$. If a species had at least 60% of links within its own module then $PC<0.625$, and if it also had $dz\ge 2.5$, thus it was classified as a module hub. This parameter space defines species with relatively high number of links, the majority within its own module. If a species had $PC<0.625$ and $dz<2.5$, then it was called a peripheral or specialist; this refers to a species with relatively few links, mostly within its module. Species that had $PC\ge0.625$ and $dz<2.5$ were considered module connectors, since they have relatively few links, mostly between modules. Finally, if a species had $PC\ge0.625$ and $dz\ge 2.5$, then it was classified as a super-generalist or hub-connector, because it has high between- and within-module connectivity. To test if the proportion of species’ roles changed between networks we performed a Pearson's Chi-squared test with simulated p-value based on 10000 Monte Carlo replicates. Also, we tested if these proportions changed for one realization of the metaweb assembly model fitted for both local networks (i.e. Weddell Sea and Potter Cove food webs).

With the aim of giving an integrated visualization of the sub-structural and local properties of the food webs, we combined in a single plot information about compartments and the topological roles with the trophic level for each species.

All analyses and simulations were made in R version 3.4.3 [@RCoreTeam2017], using the igraph package version 1.1.2 [@Csardi2006] for motifs and topological roles analyses, and NetIndices [@Kones2009] for trophic level calculations. Source code and data is available at <https://github.com/lsaravia/MetawebsAssembly>.  


## Results

### Global network properties

The number of trophic species (size), links and connectance (Table 1), were in concordance with values found for marine food webs [@Marina2018a]. Based on the random null model, all networks presented the small-world topology as their small-world-ness index was larger than the 99% confidence interval (Table 1 & S1). However, we did not find differences between the local food webs and the assembly model (Table 1 & S2). Regarding trophic coherence, all networks presented negative random z-scores and significantly smaller $q$ values (Table 1 & S1). thus they are more locally stable as they are more coherent. Using the metaweb assembly model, the Weddell Sea food web showed negative z-scores lower than 2, and Potter Cove food web exhibited no significant differences (Table 1 & S2). Mean trophic level results were similar among networks and significantly lower than the random null model (Table 1 & S1), though were not significantly different when compared to the metaweb model trophic levels . Modularity values for the empirical food webs were greater than the random model, but not significantly higher in the Potter Cove web. No differences were found when compared to the metaweb assembly model (Table 1). Overall, networks differed from the random null model though presented similarities with the metaweb assembly model.


\scriptsize

------------------------------------------------
Network             Potter    Weddell   Metaweb  
                      Cove        Sea
----------------- -------- ---------- ----------
Size                   91        437         859  

Links                  309       1908       9003  

Area (Km^2^)           6.8      3.5e6     34.8e6

Connectance          0.037      0.010      0.012 

PathLength            1.81       2.20       2.57  

Clustering            0.10      0.048       0.22 

Small-World-ness     *2.75      *4.69      *10.87
random

Small-World-ness      0.42       0.21
Assembly

Coherence             0.53       0.45       0.70  

Coherence           *-0.54     *-2.08     *-3.54
random 
z-score    

Coherence            -0.20     *-3.41 
assembly
z-score    

Mean Trophic          2.13       1.98       1.91
level         

Trophic level       *-0.27     *-0.86     *-1.60
random
z-score        

Trophic level         1.29       1.09
assembly
z-score        


Modularity            0.37       0.48      0.45 

Modularity            0.89     *18.97    *85.75
random
z-score

Modularity           -0.38       0.41            
assembly 
z-score
------------------------------------------------

Table: Network global properties across scales. The *Metaweb* represents the marine predator-prey relationships of Antarctica, the *Weddell Sea* and *Potter Cove* are the local food webs. Z-scores were calculated against 1000 null model networks (random or metaweb assembly models). Quantities marked with '*' are significant at 1% level. A negative z-score means that the quantity is smaller than the expectation from null model simulations; a positive z-score means that is greater.

\normalsize

### Sub-structural properties (motifs)

The representation of three-species sub-networks with respect to the random model showed similar patterns in all networks (Figure 2A). While exploitative competition, apparent competition, and omnivory were over-represented, tri-trophic chains were under-represented; all these patterns were significant (Table S3). We found that motifs proportions for the three examined spatial scales were different (Chi-squared = 12612, p-value < 9.9e-05). this means that local and regional networks are not a random sample of the metaweb. With respect to the metaweb assembly model only some of them were significant (Table S4): tri-trophic chains and omnivory were under-represented for Weddell Sea, and apparent competition was over-represented for Potter Cove (Figure 2B). Contrary to our expectations Potter Cove was more similar to the metaweb than Weddell Sea food web.

![Network motifs z-scores across scales. Motifs are three-node sub-networks counted on each of the networks.: the *Metaweb* represents the marine predator-prey relationships of Antarctica (34.8 million Km^2^); the *Weddell Sea* (3.5 million Km^2^) and *Potter Cove* (6.8 Km^2^) are local food webs. A. Z-scores estimated with the random null model. B. Z-scores estimated with the metaweb assembly model. Z-scores were normalized by the square root of the sum of the squared z-scores for that food web.](Figures/Motif_Zs_ByNetwork.png){ width=100% }

![Proportion of topological roles across scales., the *Metaweb* represents the marine predator-prey relationships of Antarctica (34.8 million Km^2^); the *Weddell Sea* (3.5 million Km^2^) and *Potter Cove* (6.8 Km^2^) are local food webs. The topological roles are: *Hub connectors*, high number of between-module links; *Module connectors*, low number of links mostly between modules; *Module hubs*, high number of links within its module; *Module specialists*, low number of links within its module. A. Observed proportions for each food web; significant differences were found between them (Chi-squared = 79.31, p-value = 9.9e-05). B. Proportions for local networks obtained from the metaweb assembly model; no differences were found (Chi-squared = 5.95, p-value = 0.41)](Figures/PropRoles_ByNetwork_Model.png){ width=80% }

### Node-level properties (Topological roles)

The proportion of species displaying the four topological roles was different among food webs (Chi-squared = 79.31, p-value = 9.9e-05). A higher presence of module connectors (few links, mostly between modules) was observed in Weddell Sea, while a lack of module hubs (high number of links inside its module) was found in Potter Cove (Figure 3 A), which can be related to its low modularity value (Table 1). The proportions obtained with the metaweb assembly model were not different from the food webs (Chi-squared = 5.95, p-value = 0.41)(Figura 3 B).

The plot of topological roles combined with trophic levels and modularity revealed important details of the food webs (Figure 4): the metaweb has densely connected compartments but some of them have few low-connected species (module connectors or module specialists). Additionally, we observed in the Weddell Sea food web hub connectors with a basal trophic level (Table S5). These are aggregated nodes that represent generic preys, e.g. fish or zooplankton, they only have incoming links or predators and they cannot have outgoing links or preys because they comprise several species. Different fish species are present in the Weddell Sea food web with detailed information about preys and predators, but for some predators there is insufficient knowledge of its preys and aggregated nodes must be added. Thus the existence of these basal hub connectors is a spurious result of aggregating prey species. The other non-aggregated hub connectors are highly mobile species with an intermediate trophic level like krill (Table S5). The variation of maximum trophic levels is evidenced in Figure 4, where both Potter Cove and Metaweb networks had similar values and Weddell Sea food web exhibited a lower maximum trophic level. 

![Plot of topological roles combined with trophic levels and modularity for each food web. The topological are: *Hub connectors* have a high number of between module links, *Module connectors* have a low number of links mostly between modules,  *Module hubs* have a high number of links inside its module. *Module specialists* have a low number of links inside its module. Size of the nodes is proportional to the log of the species degree.](Figures/AllTopoRoles_TL_MOD.png)

## Discussion

We expected the metaweb structure to reflect the evolutionary constraints of the species interactions, and the local networks to be influenced and determined by the assembly processes and the local environment. Our results suggest that the structure of the metaweb does not change significantly as the spatial scale changes, although there is indeed evidence that the processes of dynamical assembly, habitat filtering and dispersal limitation are acting. As a consequence, food webs are mainly shaped by evolutionary forces and less constrained by dynamical assembly processes and local environmental drivers.

Global level network properties showed a similar pattern across scales; most of them were significantly different to the null random model but not to the assembly model. Modularity for Potter Cove food web was the only property not to differ from the random model. Studies suggest that modularity enhances local stability [@Stouffer2011], even though stability strongly depends on the interaction strength configuration [@Grilli2016] and on the existence of external perturbations [@Gilarranz2017]. This is consistent with the values we find for coherence, that is a proxy of dynamical local stability. All networks are more stable than a random one, but only Weddell Sea food web exhibited a greater trophic coherence than the assembly model and a higher modularity than the random model. Dynamical stability is expected to be maximized at the local level but neither of the local food webs presented higher modularity values than the assembly model. Thus, although this evidence is not conclusive with regard to the importance of dynamical processes in the assembly of food webs, the structure of the local food webs examined here seem to be a consequence of the metaweb structure.

All networks have a significant value of small-world-ness compared with the random model but the local food webs are not different from the assembly model. In general, food webs do not show the small-world topology [@Dunne2002a; @Marina2018a], which suggests that the small-world property is inherited from the metaweb and is less influenced by the greater percentage of realized interactions. If small-world-ness was determinant for an increased resilience and robustness to secondary extinctions [@Bornatowski2017], local food webs should reflect significantly higher values than those obtained from the metaweb assembly models.

Motifs also have the same representation patterns against the random model. Local food webs should have motif patterns that increase its persistence. The expected pattern, based in dynamical models, is an over-representation of omnivory and tri-trophic chains and an under-representation of apparent and exploitative competition [@Stouffer2010]. Other studies showed that tri-trophic chains, exploitative and apparent competition should be displayed more frequently [@Borrelli2015a], but this was based on the stability of isolated three-species sub-networks and the assumption that during the assembly process these 3 species sub-networks were selected because of their intrinsic stability [@Borrelli2015]. The fact that tri-trophic (or n-trophic) interactions cannot account fully for the properties of the food webs [@Cohen2009a] make the results based on isolated modules less convincing. Our results showed an over-representation of omnivory, exploitative competition and apparent competition, this configuration is not the most stable one based on either criteria. A first hypothetical explanation is that the structure observed in the metaweb is maintained in local food webs. Despite the fact that almost all motifs were not different from the assembly model, neither tri-trophic chains and onmivory (lower in Weddell Sea) nor apparent competition (higher in Potter Cove) followed the pattern expected from theoretical studies. Thus, the assembly process is not random, there are differences in the frequencies of motifs as the scale change, but the selection of motifs due to its dynamical stability is not the main driver. This implies that other dynamical processes that influence the presence or absence of species like habitat filtering or dispersal limitation are acting and probably modifying motif frequencies in empirical food webs. 
This kind of structures that are a sub-product of process that happen at a different level have been called spandrels of assembly [@Sole2006a].   

As expected all the networks have a short mean trophic level [@Williams2002;@Borrelli2014] compared with the random model. Different hypothesis were posed to explain this pattern: the low efficiency of energy transfer between trophic levels, predator size, predator behaviour, and consumer diversity [@Young2013]. These have contradictory support, reviewed by @Ward2017. Recently, it has been proposed that maximum trophic level could be related to productivity and ecosystem size depending on the context but related to energy fluxes that promote omnivory [@Ward2017]. A different mechanism based on dynamic stability of the whole web was proposed: food webs with shorter trophic levels (between 2 and 4) that have more omnivore chains are more likely to be stable, which increase the probability of being observed in nature [Borrelli2014]. We found that mean trophic level of the local food webs was not different from the assembly model, and omnivory was under-represented. This combination suggests that the trophic level could also be a spandrel of assembly, inherited from the metaweb structure. 

Topological roles are useful to detect the existence of functional roles of species, like super-generalists (or hub connectors). These roles may change as the scale changes. A simple explanation is that modules also change. It was demonstrated in Arctic and Caribbean marine food webs that modules are usually associated with habitats [@Kortsch2015; @Rezende2009]. For example, the Antarctic cod (*Notothenia coriiceps*) is a super-generalist for Potter Cove, and a module hub---a species with most of their links within its module---for the metaweb. This means that the same species can have different influences on the food web depending on the type or extension of the habitat considered. Although the metaweb assembly model showed no change in the frequency of topological roles, we found a change in topological roles with the scale. That means that in smaller areas there will be a smaller amount of different habitats, thus habitat filtering should be an important factor and will change the frequency of species that represent a particular topological role.  

The spatial scales involved in our study do not represent a continuity; the metaweb and regional web have a 10 to 1 ratio but the local web is 10^6^ smaller, besides that most of the global network properties and the motif structure showed no changes relative to the null model. Thus, we found evidence that local processes that limit species from the metaweb to local scales are influencing the assembly process but the structure of the food web originated through an emergent process from evolutionary or co-evolutionary forces seems to be more important. This could guide us to find a unified theory of ecological interactions that could describe the diversity of patterns observed in the natural world. 

## Acknowledgements

We are grateful to the National University of General Sarmiento for financial support. LAS would like to thank Susanne Kortsch that shared with us her source code for topological analysis and the corresponding figures. This work was partially supported by a grant from CONICET (PIO 144-20140100035-CO). 

## References


