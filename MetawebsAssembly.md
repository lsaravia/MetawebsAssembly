# Ecological Network assembly: how the regional metaweb influences local food webs 


Leonardo A. Saravia ^1^ ^2^ ^5^, Tomás I. Marina ^1^ ^2^ ^3^, Marleen De Troch ^4^, Fernando R. Momo ^1^ ^2^

1. Instituto de Ciencias, Universidad Nacional de General Sarmiento, J.M. Gutierrez 1159 (1613), Los Polvorines, Buenos Aires, Argentina.

2. INEDES, Universidad Nacional de Luján, CC 221, 6700 Luján, Argentina.

3. Centro Austral de Investigaciones Científicas (CADIC-CONICET).

4. Marine Biology, Ghent University, Krijgslaan 281/S8, B-9000, Ghent, Belgium.

5. Corresponding author e-mail lsaravia@campus.ungs.edu.ar, ORCID https://orcid.org/0000-0002-7911-4398


**keywords**: Metaweb, ecological network assembly, assembly model, food web structure, modularity, trophic coherence, motif, topological roles

**Running title**: The metaweb influence on local food webs.

\newpage

## Abstract 

1. Local food webs can be studied as the realisation of a sequence of colonising and extinction events, where a regional pool of species ---called the metaweb--- acts as a source for new species. Food webs are thus the result of assembly processes that are influenced by migration, habitat filtering, stochastic factors, and dynamical constraints. Therefore, we expect their structure to reflect the action of these influences.

2. We compared the structure of empirical local food webs to (1) a metaweb, (2) randomly-constructed webs, and (3) webs resulting from an assembly model. The assembly model had no population dynamics but simply required that consumer species have at least one prey present in the local web. We compared global properties, network sub-structures---motifs--- and topological roles that are node-level properties. We hypothesised that the structure of empirical food webs should differ from other webs in a way that reflected dynamical stability and other local constraints. Three data-sets were used: (1) the marine Antarctic metaweb, built using a dietary database; (2) the Weddell Sea local food web; and (3) the Potter Cove local food web.

3. Contrary to our expectation, we found that, while most network global properties of empirical webs were different from random webs, there were almost no differences between empirical webs and those resulting from the assembly model. Further, while empirical webs showed different motif representations compared to the assembly model, these were not motifs associated with increased stability. Species' topological roles showed differences between the metaweb and local food webs that were not explained by the assembly model, suggesting that species in empirical webs are selected by habitat or dispersal limitations. 

4. Our results suggest that there is not a strong dynamical restriction upon food web structure that operates at local scales. Instead, the structure of local webs is inherited from the metaweb with modifications imposed by local habitats.

5. Recently, it has been found in competitive and mutualistic networks that structures that are often attributed as causes or consequences of ecological stability are probably a by-product of the assembly processes (i.e. spandrels). We extended these results to trophic networks suggesting that this could be a more general phenomenon.

## Introduction

<!--- What is known -->

The characterization of ecological systems as networks of interacting elements has a long history [@May1972;@Cohen1985;@Paine1966]. Much of this work has been devoted to investigating network structure and its effects on dynamics and stability [@Thebault2010]. In recent years a renewed emphasis on structural stability [@Rohr2014; @Grilli2017] and new developments in random matrix theory [@Allesina2015] has greatly expanded our capability to analyse ecological networks. However, the effects of ecological dynamical processes on food web structure are not fully understood. One such dynamical process is community assembly: how species from a regional pool colonize a site and build local interactions [@Carstensen2013]. Regional species pools are shaped by evolutionary and biogeographical processes that imply large spatial and temporal scales [@Carstensen2013;@Kortsch2018]. More specifically, the assembly of local communities is influenced by dispersal, environmental filters, biotic interactions and stochastic events [@HilleRisLambers2012]. These processes have been studied using metacommunity theory [@Leibold2017], where different spatial assemblages are connected through species dispersal. 

Metacommunity theory provides a framework for assessing the roles of local- and regional-scale processes on network structure [@Baiser2013;@Leibold2004]. This approach has been applied historically to competitive interactions, whereas trophic interactions have received less attention [@Baiser2016]. Recently, there has been an increase in food web assembly studies, integrating them with island biogeography [@Gravel2011; @Galiana2018], metacommunity dynamics [@Pillai2011; @Liao2016] and the effects of habitat fragmentation [@Mougi2016]. 

Very few studies have analysed the process of food web assembly using experimental or empirical data:  @Piechnik2008 found that the first to colonize are trophic generalists followed by specialist, supporting the hypothesis that biotic interactions are important in the assembly process [@Holt1999]; @Baiser2013 showed that habitat characteristics and dispersal capabilities were the main drivers of the assembly and @Fahimipour2014 found that colonization rates were also an important factor. None of them focuses on structural network properties related to resilience and stability.

<!--- Your experimental approach -->

One of these properties is small-worldness, associated with rapid responses to disturbances and resistance to secondary extinctions [@Montoya2002]. The small-world pattern is related to the average of the shortest distance between all species, called characteristic path length, and the clustering coefficient, the probability that two species linked to the same species are linked. This pattern comes from the general network theory, beyond ecological networks, and has been recently applied to marine food webs [@Navia2016;@Bornatowski2017;@Gray2016; @Marina2018a]. 

<!--- Coherence -->
Since the early studies of @May1972 stating that larger and more connected ecosystems will be unstable, there has been a search for factors that would stabilize complex food webs [@McCann2000a;@Neutel2007; @Landi2018]. One of such potential factors is trophic coherence: networks with increasing size and complexity could be stable as long as they are sufficiently coherent [@Johnson2014]. Trophic coherence is based on the distances between the trophic positions of species and measures how well species fall into discrete trophic levels. Then, more coherence implies a more hierarchical food web structure, which is directly correlated with local asymptotic stability [@Johnson2014]. Trophic coherence is also related to omnivory degree, a perfectly coherent network has zero omnivory degree [@Monteiro2016]. The advantage of coherence as an index of stability is that it does not make any assumptions about interaction strengths. A property related to coherence is mean trophic level, historically used as an ecosystem health indicator [@Pauly1998], predicting that food webs with higher trophic levels are less stable [@Borrelli2014]. 

<!---Modularity -->

Food webs have structurally complex and highly non-random patterns that contain internal functional units or sub-modules [@Grilli2016]. These are groups of prey and predators that interact more strongly with each other than with species belonging to other modules. These modules (also called compartments) act as a buffer to the propagation of perturbations throughout the network, increasing its persistence [@Stouffer2011]. It is noteworthy to mention that the small-world pattern and modularity act in opposite directions. Whereas a small-world topology favours the spread of perturbations through its rapid dissipation [@Gray2016], the presence of high modularity prevents the dispersal of perturbations [@Stouffer2011;@Krause2003]. 

<!---Topological roles -->

Species may participate in different ways concerning modularity, depending on how many trophic links are conducted within their module and/or between modules [@Guimera2005; @Kortsch2015]. This participation with respect to modularity is called a species' topological role. Theoretical and empirical results suggest these roles are related to species traits, such as wide niche breadth, environmental tolerance, apex position in local communities and high motility [@Borthagaray2014;@Guimera2010;@Rezende2009;@Kortsch2015;@Dupont2009]. 

<!---Motifs -->
If we consider a subset of linked species inside the food web this forms a sub-network. When the abundance of one of these sub-networks deviates significantly from a null model network, this is called a motif [@Milo2002]. Besides this definition, in the ecological literature motif has been used as a synonym of sub-network. We analyse here the three-species sub-networks that have been most studied theoretically and empirically in food webs [@Prill2005;@Stouffer2007;@Baiser2016]. Specifically, we focused on four of the thirteen possible three-species sub-networks: apparent competition, exploitative competition, tri-trophic chain, and omnivory (Figure S5). During the assembly process, those motif structures that are less dynamically stable tend to disappear from the food web, which represents a system-level selective force where the ecological interactions are shaped by dynamical constraints rather than Darwinian processes [@Borrelli2015a], this has been called non-adaptative systemic selection [@Borrelli2015]. 


In this study we analysed the assembly process utilizing a probabilistic model that simulates colonization from a metaweb with the restriction that predators must have prey to persist locally (Figure 1), this model lacks any restriction related to dynamical stability and local habitats. Additionally as some properties (Small-network, motifs, topological roles) were defined regarding a random network, we also use the random network to compare the properties of a metaweb and two local empirical networks. 

<!---How all these multilevel properties are related to network assembly -->

The two empirical local webs are the Weddell Sea food web, which represents 3.5 million km${}^2$ [@Jacob2011]; and the Potter Cove food web, which represents 6.8 km${}^2$  [@Marina2018].  To simulate the assembly process we used the Antarctic metaweb, built from a dietary database [@Raymond2011], representing an area of 34.8 million km${}^2$. 

If local food web structure reflects dynamical stability constraints, then we should expect to see the structural changes from the metaweb to the local food webs. In particular, we expect structural properties related to resilience and stability (i.e. small-worldness, trophic coherence and modularity) to be close to the random model at the metaweb scale, and different from the assembly model for local food webs.

In this sense, a greater frequency of stable motifs should be expected in the local food webs and also a change in the frequency of topological roles since habitat filtering or dispersal limitation may modify them at the local food web scale. These changes should be also reflected as differences from the metaweb assembly model.  On the other hand, if the assembly model also produces webs with stability-enhancing structural attributes, then that indicates that these structures may be spandrels of the metaweb [@Valverde2018] rather than a consequence of some dynamical constraint acting on the local food webs.

## Methods

The three datasets used in this study encompass a wide range of spatial scales and were collected independently. The Southern Ocean database compiled by @Raymond2011 was used to construct the Antarctic metaweb selecting only species located at latitudes higher than 60°S. @Raymond2011 compiled information from direct sampling methods of dietary assessment, including gut, scat, and bolus content analysis, stomach flushing, and observed feeding. We considered that the metaweb is the regional pool of species defined by the biogeographic Antarctic region. Next, we analysed two local food webs: the Weddell Sea food web dataset includes species situated between 74°S and 78°S with a West-East extension of approximately 450 km and comprises all information about trophic interactions available for the zone since 1983 [@Jacob2011]. The Potter Cove dataset comes from a 4 km long and 2.5 km wide Antarctic fjord located at 62°14'S, 58°40'W, South Shetland Islands [@Marina2018]. These food web datasets comprise benthic and pelagic habitats of the Antarctic ecosystem, few aggregated low-trophic level groups (e.g. detritus, diatoms, phytoplankton, zooplankton) and a high resolution of the macroalgae community (i.e. 24 biological species of red, brown and green macroalgae). The macroalgae community is responsible for the majority of the primary production and supports a large fraction of secondary production in Antarctic fjords [@Quartino2008a; @Valdivia2015]. Higher trophic levels comprise invertebrate (e.g. ascidians, sponges, isopods, amphipods, bivalves, gastropods, cephalopods, echinoderms) and vertebrate predator groups (e.g. demersal and pelagic fishes, penguins, seals and whales). For more information about these datasets refer to the original publications. To make datasets compatible, we first checked taxonomic names for synonyms, and second, we added species (either prey or predator) with their interactions to the metaweb when the local food webs contain a greater taxonomic resolution. This resulted in the addition of 258 species to the metaweb, which represent 33% of the total. We removed cannibalistic (self-links) and double arrows (i.e. A eats B and B eats A).  

To describe food webs as networks each species is represented as a node or vertex and the trophic interactions are represented as edges or links between nodes. These links are directed, from the prey to the predator, as the flow of energy and matter. Two nodes are neighbours if they are connected by an edge and the degree $k_i$ of node $i$ is the number of neighbours it has. The food web can be represented by an adjacency matrix $A=(a_{ij})$ where $a_{ij}=1$ if species $j$ predates on species $i$, else is 0. Then $k_i^{in}=\sum_j{a_{ji}}$ is the number of preys of species $i$ or its in-degree, and $k_i^{out}=\sum_j{a_{ij}}$ is the number of predators of $i$ or its out-degree. The total number of edges is $E=\sum_{ij}a_{ij}$. 

### Models 

To unravel the mechanisms of network assembly we considered two models:1) a random network model without any ecological mechanism, and 2) a colonization-extinction model constrained by the network structure, with no consideration of population dynamics and interaction strength. Then we compared the empirical networks with such models using a null model approach: if we observe a deviation from the property obtained with the null model then mechanisms that are excluded from the model may be acting [@DeBello2012]. 

The random network model that we used is the Erdös-Rényi random graph [-@Erdos1959]. An Erdös-Rényi network is constructed fixing the number of edges and nodes and assigning at random the $m$ edges to the $n$ nodes with equal probability [@Erdos1959; @Baiser2016]. We restricted the random model by eliminating double arrows and cannibalistic links. In a small number of cases, the algorithm generates two separated network components or networks without basal species; we discarded such cases to make possible the calculation of trophic level, trophic coherence and modularity. We included the random model because it is the baseline model to calculate the small-world structure and motif representations, so it is logical to apply it to the other properties. 

To consider network assembly mechanisms we used a metaweb assembly model (Figure 1), called the trophic theory of island biogeography [@Gravel2011]. In this model species migrate from the metaweb to a local web with a uniform probability $c$, and become extinct from the local web with probability $e$; a reminiscence of the theory of island biogeography [@MacArthur1967], but with the addition of network structure. Species migrate with their potential network links from the metaweb, then in the local web species can only survive if at least one of its preys is present, or if it is a basal species. When a species goes extinct locally it may produce secondary extinctions; we check that the local predators maintain at least one prey if not they become extinct independent of the probability $e$. We simulated this model in time and it eventually reaches an equilibrium that depends on the migration and extinction probabilities but also on the structure of the metaweb. The ratio of immigration vs. extinction $\alpha= c/e$ is hypothesized to be inversely related to the distance to the mainland [@MacArthur1967], and as extinction should be inversely proportional to population size [@Hanski1999], the ratio $\alpha$ is also hypothesized to be related to the local area.

![Schematic diagram of the metaweb assembly model: species migrate from the metaweb with a probability $c$ to a local network carrying their potential links; here they have a probability of extinction $e$. Additionally, predators become extinct if their preys are locally extinct. We simulate 1000 local networks and calculate global properties. From the distribution of these topological properties we calculate 1% confidence intervals to compare with empirical networks](Figures/MetaWebAssemblyModelFigure.pdf)


For the random model, we simulated networks with the same number of nodes $n$ and edges $m$ as the empirical networks; for the metaweb assembly model, we fitted the parameters $c$ and $e$ to obtain networks with $n$ and $m$ close to the empirical networks. This implies that $\alpha$ should reflect the differences in areas of the two local food webs. For details of the fitting and simulations see Appendix. 

### Structural network properties


The first property we analysed is the small-world pattern, which examines the average of the shortest distance between nodes and the clustering coefficient of the network [@Watts1998]. This property is associated with increased resilience and resistance to secondary extinctions [@Sole2001; @Bornatowski2017]. We first calculated the characteristic path length that is the shortest path between any two nodes. Then $L$ is the mean value of the shortest path length across all pairs of nodes. 
The clustering coefficient of node $i$ was defined as 

$$cc_i =\frac{2 E_i}{k_i (k_i -1)}$$ 

where $E_i$ is the number of edges between the neighbours of $i$. The clustering coefficient of the network $CC$ is the average of $cc_i$ over all nodes. The original definition of small-world networks is conceptual [@Watts1998], a network $G$ is small-world when it has a similar mean shortest path length but greater clustering than an Erdös-Rényi random network with the same number of nodes $n$ and edges $m$. For the quantitative version of the small-world pattern, we followed @Humphries2008; we need to define:

$$\gamma_g = \frac{CC_g}{CC_{null}}$$

and

$$\lambda_g = \frac{L_g}{L_{null}}$$

where $CC_g$ and $L_g$ are the clustering coefficient and the mean shortest path length of the network of interest $G$; $CC_{null}$ and $L_{null}$ are the same quantities for the null model. Thus, quantitative small-world-ness is defined as:

$$S = \frac{\gamma_g}{\lambda_g}$$

and to determine if $S$ is statistically significant Monte Carlo methods were used [@Crowley1992]. We built 1000 null model networks with the same number of nodes $n$ and edges $m$ than the empirical network; then we calculated $S$ for each random network and the lower and higher 99% quantiles of the $S$ distribution are called $ql,qh$:

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

### Motifs

We considered four of the thirteen possible three-species sub-networks: apparent competition, exploitative competition, tri-trophic chain and omnivory (Figure S5). These are the only motifs present in all networks analysed here. We compared the frequency of these motifs to 1000 null model networks using the 99% confidence interval and the z-score as previously described. To determine if the proportions of motifs change across networks we use the Pearson's Chi-squared test with simulated p-value based on 10000 Monte Carlo replicates.


### Topological roles


As a local property that reflects the ecological role of each species we determined topological roles using the method of functional cartography [@Guimera2005], which is based on module membership (See modularity). The roles are characterized by two parameters: the standardized within-module degree $dz$ and the among-module connectivity participation coefficient $PC$.  The within-module degree is a z-score that measures how well a species is connected to other species within its module:

$$dz_i = \frac{k_{is}-\bar{k_s} }{\sigma_{ks}}$$ 


where $k_{is}$ is the number of links of species $i$ within its own module $s$, $\bar{k_s}$ and $\sigma_{ks}$ are the average and standard deviation of $k_{is}$ over all species in $s$. The participation coefficient $PC$ estimates the distribution of the links of species $i$ among modules; thus it can be defined as:

$$PC_i =  1 - \sum_s \frac{k_{is}}{k_i}$$ 

where $k_i$ is the degree of species $i$ (i.e. the number of links), $k_{is}$ is the number of links of species $i$ to species in module $s$. Due to the stochastic nature of the module detection algorithm, we made repeated runs of the algorithm until there were no statistical differences between the distributions of $PC_i$ and $dz_i$ in successive repetitions; to test such statistical difference we used the k-sample Anderson-Darling test [@Scholz1987]. Then we calculated the mean and 95% confidence interval of $dz$ and $PC$.

To determine each species' role the $dz-PC$ parameter space was divided into four areas, modified from @Guimera2005, using the same scheme as @Kortsch2015. Two thresholds were used to define the species’ roles: $PC=0.625$ and $dz=2.5$. If a species had at least 60% of links within its module then $PC<0.625$, and if it also had $dz\ge 2.5$, thus it was classified as a module hub. This parameter space defines species with a relatively high number of links, the majority within its module. If a species had $PC<0.625$ and $dz<2.5$, then it was called a peripheral or specialist; this refers to a species with relatively few links, mostly within its module. Species that had $PC\ge0.625$ and $dz<2.5$ were considered module connectors, since they have relatively few links, mostly between modules. Finally, if a species had $PC\ge0.625$ and $dz\ge 2.5$, then it was classified as a super-generalist or hub-connector because it has high between- and within-module connectivity. To test if the proportion of species’ roles changed between networks we performed a Pearson's Chi-squared test with simulated p-value based on 10000 Monte Carlo replicates. Also, we tested if these proportions changed for one realization of the metaweb assembly model fitted for each local network.

All analyses and simulations were made in R version 3.4.3 [@RCoreTeam2017], using the igraph package version 1.1.2 [@Csardi2006] for motifs and topological role estimations, and NetIndices [@Kones2009] for trophic level calculations. Source code and data are available at zenodo <https://doi.org/10.5281/zenodo.3344910> and Github <https://github.com/lsaravia/MetawebsAssembly/>.  


## Results

### Structural network properties

Based on the random null model, all networks presented the small-world topology as their small-world-ness index was larger than the 99% confidence interval (Table 1 & S1). However, we did not find differences between the local food webs and the assembly model (Figure 2 & Table S2). Regarding trophic coherence, all networks presented negative random z-scores and significantly smaller $q$ values (Table 1 & S1), thus they are more locally stable as they are more coherent. Using the metaweb assembly model, the Weddell Sea food web showed a significant lower trophic coherence value (Figure 2), meaning that it is more stable than the networks generated by the model, and Potter Cove food web exhibited no significant differences (Figure 2 & Table S2). Mean trophic level results were similar among networks and significantly lower than the random null model (Table 1 & S1), though were not significantly different from the metaweb model. Modularity values for the empirical food webs were greater than the random model, but not significantly higher in Potter Cove, and with no differences compared to the metaweb assembly model. Overall, networks differed from the random null model though presented similarities with the metaweb assembly model.

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

Small-World-ness     2.75*      4.69*      10.87*
random

Trophic coherence     0.53       0.45       0.70  

Trophic coherence   -0.54*     -2.08*     -3.54*
random 
z-score    

Mean Trophic          2.13       1.98       1.91
level         

Trophic level       -0.27*     -0.86*     -1.60*
random
z-score        


Modularity            0.37       0.48      0.45 

Modularity            0.89     18.97*    85.75*
random
z-score
------------------------------------------------

Table: Network structural properties across scales. The *Metaweb* represents the marine predator-prey relationships of Antarctica built from a dietary database, the *Weddell Sea* and *Potter Cove* are the local food webs. Z-scores were calculated against 1000 random model networks. Quantities marked with '*' are significant at 1% level. A negative z-score means that the quantity is smaller than the expectation from null model simulations; a positive z-score means that is greater.

\normalsize

![Network structural properties compared with the metaweb assembly model for A) Potter Cove and B) Weddell Sea food webs. The properties were: Small-world-ness (SWness), coherence (Q), mean trophic level (mTl) and modularity. We ran 1000 simulations of local networks fitted to Potter Cove and Weddell Sea food webs to build the 99% confidence intervals of a particular property (vertical blue lines) and compare with the empirical calculated value (Black arrows). ](Figures/globProp_assembly_ByNetwork.png){ width=100% }


### Motifs

The representation of three-species sub-networks concerning the random model showed similar patterns in all networks (Figure 3A). While exploitative competition, apparent competition, and omnivory were over-represented, tri-trophic chains were under-represented; all these patterns were significant (Table S3). We found that motifs proportions for the three examined spatial scales were different (Chi-squared = 12612, p-value < 1e-04). This means that local networks are not a sample of the metaweb. For the metaweb assembly model only some of them were significant (Figure 3B, Table S4): tri-trophic chains and omnivory were under-represented for Weddell Sea, and apparent competition was over-represented for Potter Cove (Figure 3B). Contrary to our expectations Potter Cove was more similar to the metaweb than Weddell Sea food web. The under-representation of omnivory in Potter Cove could be related to its low value of coherence index. 

![Network motifs z-scores across scales. Motifs are three-node sub-networks counted on each of the networks.: the *Metaweb* represents the marine predator-prey relationships of Antarctica; the *Weddell Sea* and *Potter Cove* are local food webs. A. Z-scores estimated with the random null model. B. Z-scores estimated with the metaweb assembly model. Z-scores were normalized by the square root of the sum of the squared z-scores for that food web, bars marked with '*' are significant at 1% level.](Figures/Motif_Zs_ByNetwork.png){ width=100% }

![Proportion of topological roles across scales., the *Metaweb* represents the marine predator-prey relationships of Antarctica; the *Weddell Sea* and *Potter Cove* are local food webs. The topological roles are: *Hub connectors*, high number of between-module links; *Module connectors*, low number of links mostly between modules; *Module hubs*, high number of links within its module; *Module specialists*, low number of links within its module. A. Observed proportions for each food web; significant differences were found between them (Chi-squared = 79.31, p-value = 1e-04). B. Proportions for local networks obtained from the metaweb assembly model; no differences were found (Chi-squared = 5.95, p-value = 0.41)](Figures/PropRoles_ByNetwork_Model.png){ width=80% }


### Topological roles

The proportion of species displaying the four topological roles was different among networks (Chi-squared = 79.31, p-value = 1e-04). A higher presence of module connectors (few links, mostly between modules) was observed in Weddell Sea, while a lack of module hubs (high number of links inside its module) was found in Potter Cove (Figure 3 A), which can be related to its low modularity value (Table 1). The proportions obtained with the metaweb assembly model were not different across the simulated networks (Chi-squared = 5.95, p-value = 0.41)(Figura 3 B).

The plot of topological roles combined with trophic levels and modularity revealed important details of the food webs (Figure 5): the metaweb presents densely connected compartments but some of them have few low-connected species (module connectors or module specialists). Additionally, we observed in the Weddell Sea food web hub connectors with a basal trophic level (Table S5). These are aggregated nodes that represent generic prey, e.g. fish or zooplankton, they only have incoming links or predators and they cannot have outgoing links or prey because they comprise several species. Different fish species are present in the Weddell Sea food web with detailed information about prey and predators, but for some predators, there is insufficient knowledge of its prey and aggregated nodes must be added. Thus the existence of these basal hub connectors is a spurious result of aggregating prey species. The other non-aggregated hub connectors are highly mobile species with an intermediate trophic level like krill (Table S5). The variation of maximum trophic levels is evidenced in Figure 5, where both Potter Cove and Metaweb networks have similar values and Weddell Sea food web exhibit a lower maximum trophic level. 


![Plot of topological roles combined with trophic levels and modularity for each food web (A) Potter Cove, (B) Weddell Sea (C) the Metaweb. The topological roles are: *Hub connectors* have a high number of between module links, *Module connectors* have a low number of links mostly between modules,  *Module hubs* have a high number of links inside its module. *Module specialists* have a low number of links inside its module. Size of the nodes is proportional to the log of the species degree.](Figures/AllTopoRoles_TL_MOD.png)


## Discussion

By definition, the metaweb structure should reflect the evolutionary constraints of the species interactions, and the local networks should be influenced and determined by the assembly processes and the local environment. Our results showed that the structure of the metaweb does not differ from local food webs in many properties as the spatial scale changes. We did not find a clear pattern in the properties expected to be maximized by local stability (modularity, coherence, motifs), though we found clear differences in the properties influenced by the dynamical assembly, habitat filtering and dispersal limitation (motif, topological roles). These suggest that food webs would be mainly shaped by metaweb structure and local environment drivers or assembly processes and less influenced by dynamical constraints.

Structural network properties showed a similar pattern across scales; most of them were significantly different from the random null model but not from the assembly model. All networks have a significant value of small-world-ness compared with the random model and both local food webs are not different from the assembly model. In general, food webs do not show the small-world topology [@Dunne2002a; @Marina2018a], which suggests that the small-world property is inherited from the metaweb and is less influenced by the greater percentage of realized interactions in local food webs. This result confirms the hypothesis of @Marina2018a. If small-world-ness was determinant for increased resilience and robustness to secondary extinctions [@Bornatowski2017], local food webs should reflect significantly higher values than those obtained from the metaweb assembly model.

Modularity for Potter Cove food web was the only property that is similar to the random model.  The existence of a modular structure could be related to different habitats [@Krause2003;@Rezende2009] ---in marine environments, these could be benthic with different depths and pelagic with different extensions. Even though Potter Cove has a small extent (6.8 Km^2^) studies suggest there exist different habitats [@Wolfl2014], then the lack of significant modularity compared to random and to the assembly model could be a sampling effect. Recent studies suggest that modularity enhances local stability and this effect is stronger the more complex the network is [@Stouffer2011], even though the effect on stability strongly depends on the interaction strength configuration [@Grilli2016] and the existence of external perturbations [@Gilarranz2017]. We found that modularity is not different from the assembly model and we observed that the modular structure is present in the metaweb. This suggests that modularity is not produced by maximization of local stability and could be a spandrel of assembly. 

Biotic interactions are expected to be more important at the finest scales [@Araujo2014], thus dynamical stability represented in trophic coherence is expected to be maximized at Potter Cove, but we only found that Weddell Sea exhibited a greater trophic coherence than the assembly model. Thus, although this evidence is not conclusive concerning the importance of dynamical stability in the assembly of food webs, the structure of the local food webs examined here seems to be a consequence of the metaweb structure. Another possibility that would require further investigation is that these properties were not sensitive enough to detect changes between the simulated and empirical food webs. Furthermore, @Grilli2016 states that a particular network structure could be stabilizing or destabilizing depending on specific conditions and this could render the detection of structures related to stability constraints nearly impossible.

As expected, all the networks have a short mean trophic level [@Williams2002;@Borrelli2014] compared with the random model. Different hypotheses have been posed to explain this pattern: the low efficiency of energy transfer between trophic levels, predator size, predator behaviour, and consumer diversity [@Young2013]. Recently, it has been proposed that maximum trophic level could be related to productivity and ecosystem size depending on the context but related to energy fluxes that promote omnivory [@Ward2017]. We found that the mean trophic level of the local food webs was not different from the assembly model, and omnivory was under-represented. This combination suggests that the trophic level could also be a spandrel of assembly, inherited from the metaweb structure. 


Motifs have the same representation patterns across networks against the random model. If food web structure is influenced by dynamical constraints, then we would expect empirical food webs to have a higher frequency of stability-enhancing motifs than assembled model webs. If we take into account the stability of three species motifs, the expected pattern is an over-representation tri-trophic chains, exploitative and apparent competition [@Borrelli2015a], and the omnivory motif could enhance or diminish stability [@Monteiro2016]. As food webs are more than the sum of its three species modules [@Cohen2009a] if the persistence of the whole food web is considered, tri-trophic and omnivory should be over-represented, exploitative and apparent competition under-represented [@Stouffer2010]. Instead, our empirical food webs had an under-representation of tri-trophic chains while the other motifs were over-represented. More importantly, the motif structure observed in the metaweb is not maintained in local food webs: apparent competition is over-represented in Potter Cove, which would enhance stability and diminish persistence, and both omnivory and tri-trophic chains are under-represented in Weddell Sea this combination would have opposite effects on both stability and persistence. Thus, the assembly process is not random, there are differences in the frequencies of motifs as the scale change, but the selection of motifs due to its dynamical stability does not seem to be the main driver. This implies that other processes that influence the presence or absence of species like habitat filtering or dispersal limitation would be acting and probably modifying motif frequencies in empirical food webs.


Topological roles are valuable to detect the existence of functional roles of species, like super-generalists (or hub connectors). These roles may change as the scale changes. A simple explanation is that modules also change. It was demonstrated in Arctic and Caribbean marine food webs that modules are usually associated with habitats [@Kortsch2015; @Rezende2009]. For example, the Antarctic cod (*Notothenia coriiceps*) is a super-generalist for Potter Cove and a module hub---a species with most of their links within its module---for the metaweb. This means that the same species can have different influences on the food web depending on the type or extension of the habitat considered. Although the networks based on the metaweb assembly model showed no change in the frequency of topological roles, we found a change in topological roles with the scale. That means that as in smaller areas there will be different proportions and different kinds of habitats, and probably as a product of habitat filtering, there should be a change in the frequency of species that represent a particular topological role. 

The spatial scales involved in our study do not represent a continuity; the metaweb and the Weddell sea web have a 10 to 1 ratio but Potter Cove is 10^6^ smaller, besides that most of the global network properties and the motif structure showed no changes relative to the null model. We did not find evidence that the structure of the food web was strongly influenced by dynamical stability constraints. Instead, we found that other local processes, that limit which species from the metaweb can colonise the local web, are influencing the assembly process.

In this work, we assume that the metaweb influences the structure of local webs through the assembly process, but local webs are a part of the metaweb and there is also an influence going in the other direction. Thus, this means that the structure of the metaweb could be already shaped by stability constraints of the local food webs. This is suggested by the fact that the metaweb has the same structural parameters and the same motifs representation than the local food webs when we compare against the random model and this would be the reason why we are not detecting differences. 

Although our results are limited to Antarctic marine food webs, our findings suggest that future studies about food webs should give more attention to evolutionary and assembly processes, and less emphasis on local dynamics. This kind of analysis needs to be expanded to different regions and other kinds of habitats (e.g. terrestrial, freshwater, etc. ) to confirm if this is a general pattern or not.


## Acknowledgements

We are grateful to the National University of General Sarmiento for financial support. LAS would like to thank Susanne Kortsch that shared with us her source code for topological analysis and figures, and to Nadiah Kristensen for a constructive review of the manuscript. This work was partially supported by a grant from CONICET (PIO 144-20140100035-CO). 

## References