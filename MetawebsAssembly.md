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


### Metaweb Assembly Model


To consider network assembly mechanisms we used a metaweb assembly model (Figure 1), similar to the trophic theory of island biogeography [@Gravel2011]. In this model species migrate from the metaweb to a local web with a probability $c$, and become extinct from the local web with probability $e$; a reminiscence of the theory of island biogeography [@MacArthur1967], but with the addition of network structure. Species migrate with their potential network links from the metaweb, then in the local web, species have a probaility of secondary extinction $se$ if none of its preys is present, this only applies to non-basal species. When a species goes extinct locally it may produce secondary extinctions modulated by $se$ (Figure 1). We simulated this model in time and it eventually reaches an equilibrium that depends on the migration and extinction probabilities but also on the structure of the metaweb. The ratio of immigration vs. extinction $\alpha= c/e$ is hypothesized to be inversely related to the distance to the mainland [@MacArthur1967], and as extinction should be inversely proportional to population size [@Hanski1999], the ratio $\alpha$ is also hypothesized to be related to the local area. For details of the fitting and simulations see Appendix. 
This model only considers colonization-extinction, and secondary extinctions events model constrained by network structure, with no consideration of population dynamics and interaction strength. Then, this simple model acts as a null model, if we observe a deviation from a property obtained with the null model then mechanisms that are excluded from the model may be acting [@DeBello2012]. 

![Schematic diagram of the metaweb assembly model: species migrate from the metaweb with a probability $c$ to a local network carrying their potential links; here they have a probability of extinction $e$. Additionally, predators become extinct if their preys are locally extinct with probability $se$. We simulate 1000 local networks and calculate network properties. From the distribution of these topological properties we calculate 1% confidence intervals to compare with empirical networks](Figures/MetaWebAssemblyModelFigure.pdf)


### Structural network properties

To describe food webs as networks each species is represented as a node or vertex and the trophic interactions are represented as edges or links between nodes. These links are directed, from the prey to the predator, as the flow of energy and matter. Two nodes are neighbours if they are connected by an edge and the degree $k_i$ of node $i$ is the number of neighbours it has. The food web can be represented by an adjacency matrix $A=(a_{ij})$ where $a_{ij}=1$ if species $j$ predates on species $i$, else is 0. Then $k_i^{in}=\sum_j{a_{ji}}$ is the number of preys of species $i$ or its in-degree, and $k_i^{out}=\sum_j{a_{ij}}$ is the number of predators of $i$ or its out-degree. The total number of edges is $E=\sum_{ij}a_{ij}$. 

We first calculated a property called trophic coherence [@Johnson2014], that is related to stability in the sense that small perturbations could get amplified or vanished, which is called local linear stability [@May1972;@Rohr2014]. We first needed to estimate the trophic level of a node $i$, defined as the average trophic level of its preys plus 1. That is:

$$tp_i= 1 + \frac{1}{k_i^{in}}\sum_{j}{a_{ij} tp_j}$$ 

where $k_i^{in}=\sum_{j}a_{ji}$ is the number of preys of species $i$, basal species that do not have preys (then $k_i^{in}=0$) are assigned a $tp=1$. Then the trophic difference associated to each edge is defined as $x_{ij}=tp_i - tp_j$. The distribution of trophic differences, $p(x)$, has a mean $E^{-1} \sum_{ij} a_{ij} x_{ij} = 1$ by definition. Then the trophic coherence is measured by:

$$q = \sqrt{\frac{1}{E} \sum_{ij}a_{ij}x_{ij}^2 - 1}$$


that is the standard deviation of the distribution of all trophic distances. A food web is more coherent when $q$ is closer to zero, thus the maximal coherence is achieved when $q = 0$, and corresponds to a layered network in which every node has an integer trophic level [@Johnson2014; @Johnson2017]. To compare coherence and trophic level we generated 1000 null model networks with the fitted parameters of the metaweb assembly model. Then we calculated the 99% confidence interval using the 0.5% and 99.5% quantiles of the distribution of $q$. We calculated the z-scores as:

$$z_i=\frac{q_{obs} - q_{null}}{\sigma_{qnull}}$$

where $q_{obs}$ is the observed coherence, $q_{null}$ is the mean coherence from the null model networks and $\sigma_{qnull}$ is the standard deviation. The same formula is used for $tp$. The z -score thus measures the significance of deviations of the empirical network from the null hypothesis. If the distribution of the quantity ($q$, $tp$) under the null model is normal, a z-score greater than 2 is evidence that the observed quantity is significantly greater than its random counterpart, and a z-score less than -2 means that the quantity is significantly lower. If the distribution under the null model is skewed this is not necessarily true and thus we must rely on confidence intervals. We also calculated the CI and z-scores for mean trophic level as it was historically used as an ecosystem health indicator [@Pauly1998], and is hypothesized that food webs with higher trophic levels are less stable [@Borrelli2014].


Another property related to stability is modularity, since the impacts of a perturbation are retained within modules minimizing impacts on the food web [@Fortuna2010; @Grilli2016]. It measures how strongly sub-groups of species interact between them compared with the strength of interaction with other sub-groups [@Newman2004]. These sub-groups are called compartments. To find the best partition, we used a stochastic algorithm based on simulated annealing [@Reichardt2006]. Simulated annealing allows maximizing modularity without getting trapped in local maxima configurations [@Guimera2005]. The index of modularity was defined as: 

$$M = \sum_s \left(\frac{I_s}{E} - \left(\frac{d_s}{2E}\right)^2 \right)$$

where $s$ is the number of modules or compartments, $I_s$ is the number of links between species in the module $s$, $d_s$ is the sum of degrees for all species in module $s$ and $E$ is the total number of links for the network. To assess the significance of our networks we calculate the 99% confidence intervals and z-scores based on 1000 null model networks as previously described. 


Finally, we calculate the average of the maximal real part of the eigenvalues of the jacobian [@Grilli2016] for randomly parametrised systems, keeping fixed the predator-prey (sign) structure. This is a measure related to quasi sign-stability (QSS) that is the proportion of randomly parametrised systems that are locally stable [@Allesina2008a]. The jacobian $J$, so called community matrix [@May1973], represents the population-level effect of a change in one species’ density on any other species, including the dependence on its own density (self-regulation), at an equilibrium. A system is locally stable if the Jacobian $J$ has all its eigenvalues negative, thus the maximal eigenvalue has to be less than zero for a system to be locally stable. The signs of the elements of $J$ are given by the predator-prey structure of the food web, but the magnitude of the elements are unknown. Following previous analysis [@Monteiro2016;@Borrelli2015a], we estimate the unknown magnitudes by drawing the predator-prey interactions from a uniform distribution ranging from -10 to 0, the prey-predator interactions from 0 to 0.1, and from 0 to -1 for the self-regulation effect. This implies that the predator effect on the prey is bigger than the effect of the prey on the predator, and that the self-regulation or self-damping effect, that scales the dynamic's return time, is generally smaller than the predator-prey effect. Besides other parametrizations are possible they give very similar results (not shown). We sampled 1000 jacobians to estimate the maximal real part of the eigenvalues and take the average, we repeat this procedure for each of the 1000 null model networks and estimate the 99% confidence intervals as described earlier.

### Motifs

We considered four of the thirteen possible three-species sub-networks: apparent competition, where two preys share a predator; exploitative competition, where two predators consume the same prey; omnivory, where we have two predators that consume the same prey but one predator also consumes the other and a tri-trophic chain, where the top predator consumes an intermediate predator that consumes a basal prey (Figure S3). These are the most common motifs present in food webs [@Monteiro2017; @Borrelli2015a]. We compared the frequency of these motifs to 1000 null model networks using the 99% confidence interval and the z-scores as previously described.



### Topological roles

As a local property that reflects the ecological role of each species we determined topological roles using the method of functional cartography [@Guimera2005], which is based on module membership (See modularity). The roles are characterized by two parameters: the standardized within-module degree $dz$ and the among-module connectivity participation coefficient $PC$.  The within-module degree is a z-score that measures how well a species is connected to other species within its module:

$$dz_i = \frac{k_{is}-\bar{k_s} }{\sigma_{ks}}$$ 


where $k_{is}$ is the number of links of species $i$ within its own module $s$, $\bar{k_s}$ and $\sigma_{ks}$ are the average and standard deviation of $k_{is}$ over all species in $s$. The participation coefficient $PC$ estimates the distribution of the links of species $i$ among modules; thus it can be defined as:

$$PC_i =  1 - \sum_s \frac{k_{is}}{k_i}$$ 

where $k_i$ is the degree of species $i$ (i.e. the number of links), $k_{is}$ is the number of links of species $i$ to species in module $s$. Due to the stochastic nature of the module detection algorithm, we made repeated runs of the algorithm until there were no statistical differences between the distributions of $PC_i$ and $dz_i$ in successive repetitions; to test such statistical difference we used the k-sample Anderson-Darling test [@Scholz1987]. Then we calculated the mean and 95% confidence interval of $dz$ and $PC$.

To determine each species' role the $dz-PC$ parameter space was divided into four areas, modified from @Guimera2005, using the same scheme as @Kortsch2015. Two thresholds were used to define the species’ roles: $PC=0.625$ and $dz=2.5$. If a species had at least 60% of links within its module then $PC<0.625$, and if it also had $dz\ge 2.5$, thus it was classified as a module hub. This parameter space defines species with a relatively high number of links, the majority within its module. If a species had $PC<0.625$ and $dz<2.5$, then it was called a peripheral or specialist; this refers to a species with relatively few links, mostly within its module. Species that had $PC\ge0.625$ and $dz<2.5$ were considered module connectors, since they have relatively few links, mostly between modules. Finally, if a species had $PC\ge0.625$ and $dz\ge 2.5$, then it was classified as a super-generalist or hub-connector because it has high between- and within-module connectivity. 

We estimated the roles for empirical networks and for one realization of the fitted assembly model networks, to test if the proportion of species’ roles changed between them we performed a Pearson's Chi-squared test with simulated p-value based on 10000 Monte Carlo replicates. 

All analyses and simulations were made in R version 4.0.3 [@RCoreTeam2017], using the igraph package version 1.2.6 [@Csardi2006] for motifs, the package multiweb for topological roles, Q and other network metrics [@Saravia2019c], and the package meweasmo for the metaweb assembly model [@Saravia2020]. Source code and data are available at zenodo <https://doi.org/10.5281/zenodo.3370022> and Github <https://github.com/lsaravia/MetawebsAssembly/>.  

## Results

A general description of all networks using the structural properties of all networks including metawebs is presented in table S3, we estimated all the properties also for the metawebs. For the Antarctic metaweb the differences in the number of species (size) between local food webs and the metaweb is greater and also they are the biggest in size, but the connectance of the metaweb is lower. The metawebs of Florida Islands and Adirondacks' Lakes have similar size and links but for the later many of the local food webs have a small size, and the connectance of the metaweb is higher. Thus we have a wide range of local food web sizes (13 to 435), number of links (17 to 3560), and connectance (0.01 to 0.15) in our dataset. We cannot directly compare the metaweb properties with the local webs properties as them are dependent on size, links and/or connectance [@Dunne2002a; @Poisot2014]. The comparison of the local networks with the networks generated by the fitted assembly model takes into account this problem.

We found no-differences between assembly model an local food webs for trophic coherence (Q) (Figure S6, Table S5) and only one (Weddell Sea, Antarctic metaweb) was different for mean trophic level (TL) (Figure 2, Table S4), being higher than the confidence interval, this would be contrary to the expected result if dynamical stability constraints where acting (Figure 2). For modularity we found only one local food web that is less modular than the model (Chub Pond, Lakes metaweb) (Figura 3, Table S5). The mean maximal eingenvalue (MEing) were also not-different except for Weddell Sea, which have a lower mean resulting in an increased local stability and 4 local webs from Lakes metawebs (Briddge Brook Lake, Chub Pond, Hoel Lake, Long Lake) which have a higher MEing and less stability than the model (Figure 4, Table S5). 

![Mean Trophic Level comparison for local empirical networks (dots) and assembly model networks. We ran 1000 simulations of the metaweb assembly model fitted to local networks to build the 99% confidence intervals of the metric (vertical lines). Where *Ant* is the Antarctic metaweb, *Isl* is the Islands, and *Lak* the lakes metaweb.](Figures/TL_Assembly_byMeta.png){ width=100% }

![Modularity comparison for local empirical networks (dots) and assembly model networks. We ran 1000 simulations of the metaweb assembly model fitted to local networks to build the 99% confidence intervals of the metric (vertical lines). Where *Ant* is the Antarctic metaweb, *Isl* is the Islands, and *Lak* the lakes metaweb.](Figures/Modularity_Assembly_byMeta.png)

![Mean of maximal eingenvalue (MEIng) comparison for local empirical networks (dots) and assembly model networks. We ran 1000 simulations of the metaweb assembly model fitted to local networks to build the 99% confidence intervals of the metric (vertical lines). Where *Ant* is the Antarctic metaweb, *Isl* is the Islands, and *Lak* the lakes metaweb.](Figures/MEing_Assembly_byMeta.png)


Comparing the motifs generated from the metaweb assembly model, only 8 from 57 (14%) have some motif different from the empirical food webs (Figure 5, Table S6). We can relate the omnivory motif with local stability, e.g. Weddell Sea food have a significant omnivory under-representation, and a low MEing value, and three Lake food webs (Chub Pond, Hoel Lake, Long Lake) have over-representation which matches with their high MEing value.

The proportion of topological roles mostly similar to the metaweb assembly model, only 5 from 57 (9%) are different at 1% significance level (Table S7). We show in figure 6 the proportions for the Antarctic and Islands metawebs. We added the topological role proportions for the corresponding metaweb in each case to visually compare with the both empirical and model food webs. The module specialist is the most common role observed in local food webs but for the Island metaweb the module connector is the most abundant, this change from the metaweb to the local food web is also observed in the Lakes metaweb (Figure S7). For the Antarctic metaweb the most frequent role is the module specialist. 


![Network motifs z-scores across local food webs. Motifs are three-node sub-networks counted on each of the networks.: the *Metaweb* represents the regional pool of species with predator-prey relationships. Z-scores estimated with the metaweb assembly model, bars marked with '*' are significant at 1% level.](Figures/Motif_Zscores_Assembly.png){ width=100% }


![Topological roles comparison for local empirical networks (dots) and assembly model networks for the Antarctic (A) and Islands metawebs (B). The topological roles are: *Hub connectors* have a high number of between module links, *Module connectors* have a low number of links mostly between modules,  *Module hubs* have a high number of links inside its module. *Module specialists* have a low number of links inside its module. Plots marked with '*' are significant at 1% level](Figures/Ant_Isl_TopoRoles_ByNetwork_Model.png)

## Discussion

By definition, the metaweb structure should reflect the evolutionary constraints of the species interactions, and the local networks should be influenced and determined by the assembly processes and the local environment. Our results showed that the structure of the local food webs does not differ from metawebs in most properties. We did not find that the properties expected to change due to local stability constraints did so in consistently (Mean trophic level, modularity, MEing, motifs), though we found differences for some local food webs this was not a general pattern. The same happened for topological roles that were expected to change probably due to habitat filtering and dispersal limitation. These suggest that food webs would be mainly shaped by metaweb structure and less influenced by local stability, environment drivers or assembly processes.  

Is expected that local food webs have a relatively few trophic levels [@Williams2002;@Borrelli2014]. Different hypotheses have been posed to explain this pattern: the low efficiency of energy transfer between trophic levels, predator size, predator behaviour, and consumer diversity [@Young2013]. Recently, it has been proposed that maximum trophic level could be related to productivity and ecosystem size depending on the context but related to energy fluxes that promote omnivory [@Ward2017]. We found that the mean trophic level of the local food webs was not different from the assembly model in most cases. The only exception was the Weddell Sea food web, we will mention the exceptions and latter will analyse them in more detail. 

The existence of a modular structure could be related to habitat heterogeneity [@Krause2003;@Rezende2009]. Recent studies suggest that modularity enhances local stability and this effect is stronger the more complex the network is [@Stouffer2011], even though the effect on stability strongly depends on the interaction strength configuration [@Grilli2016] and the existence of external perturbations [@Gilarranz2017]. This suggests that modularity should by  maximized by local stability constraints and also could be different from the model because of the presence of habitat heterogeneity but we found that modularity is not different from the assembly model in most cases except one: the Chub Pond from Lakes metaweb. 

Biotic interactions are expected to be more important at local scales [@Araujo2014], thus dynamical stability represented mean maximal eingenvalue (MEing) and trophic coherence (Q) is expected to be greater than than the assembly model, but we only found that Weddell Sea exhibited a greater stability (lower MEing) and lower stability in four local food webs belonging to the Lakes metaweb. Thus, although this evidence is not conclusive concerning the importance of dynamical stability in the assembly of food webs, the structure of the local food webs examined here seems to be a consequence of the metaweb structure. Another possibility that would require further investigation is that these properties were not sensitive enough to detect changes between the simulated and empirical food webs. Furthermore, @Grilli2016 states that a particular network structure could be stabilizing or destabilizing depending on specific conditions and this could render the detection of structures related to stability constraints nearly impossible.

If food web structure is influenced by dynamical constraints, then we would expect empirical food webs to have a higher frequency of stability-enhancing motifs than assembled model webs. If we take into account the stability of three species motifs, the expected pattern is an over-representation tri-trophic chains, exploitative and apparent competition [@Borrelli2015a], and the omnivory motif could enhance or diminish stability [@Monteiro2016]. We observed over-representation in some Lakes food webs but there is not a consistent pattern, besides we found under-representation in the Weddell Sea.  Thus, the selection of motifs due to its dynamical stability does not seem to be acting. Food webs are more than the sum of its three species modules [@Cohen2009a] this is observed for the Weddell Sea that showed contradictory results: high mean trophic level, enhanced stability and under-representation of two motifs: omnivory and apparent competition. Also the omnivory motif seems to act as destabilizing because the food webs with over-representation are (Chub Pond, Hoel Lake Long Lake) the ones with significant lower stabililty (higher MEing) and the food web with under-representation have higher stability (Weddell Sea).

Topological roles are valuable to detect the existence of functional roles of species, like super-generalists (or hub connectors). These roles may change as the scale changes, from the metaweb to a local food web, a simple explanation is that modules also change. It was demonstrated in Arctic and Caribbean marine food webs that modules are usually associated with habitats [@Kortsch2015; @Rezende2009]. For example, the Antarctic cod (*Notothenia coriiceps*) is a super-generalist for Potter Cove and a module hub---a species with most of their links within its module---for the metaweb. This means that the same species can have different influences on the food web depending on the type or extension of the habitat considered. In smaller areas there will be different proportions and different kinds of habitats, and probably as a product of habitat filtering, there should be a change in the frequency of species that represent a particular topological role.We observed that local food webs showed mostly no changes in the frequency of topological roles against the assembly model. Besides there will be different species in local food webs because of habitat filtering or dispersal limitation other species could take the same roles and maintain the expected structure generated by the metaweb assembly model.

An improvement could be enhance metawebs and local food webs with the addition of species density and the intensity of interactions to incorporate weights into metrics, that could give a better representation of the real dynamics of food webs [@Kortsch2021; @Alves2020].

In this work, we assume that the metaweb influences the structure of local webs through the assembly process, but local webs are a part of the metaweb and there should be also an influence going in the other direction. Thus, this means that the structure of the metaweb could be already shaped by stability constraints of the local food webs, probably at evolutionary time sales. In this case we would not expect differences with the assembly model regarding structural parameters and motifs. In the case of topological roles, the metaweb proportions could also shaped as the sum of local food webs, note that in the lakes and Islands metaweb's proportions are very different to local ones. As the local food webs in these metawebs have similar habitats of slightly different sizes, the metaweb could represent a general structure that through the simple assembly model gives local food webs. The case of the Antarctic metaweb is different because there is a big difference in the sizes of the local food webs and the sum of them is not the metaweb. Thus it seems to be more probable than the roles of Antarctic local food webs are different from the metaweb. 

Although our results are from limited set of metawebs, our findings suggest that evolutionary and assembly processes could be more important than local dynamics. This kind of analysis needs to be expanded to different regions and other kinds of habitats. to confirm if this is a general pattern or not.
	
## Acknowledgements

We are grateful to the National University of General Sarmiento for financial support (Proyect 30/1139). LAS would like to thank Susanne Kortsch that shared with us her source code for topological analysis and figures. This work was partially supported by a grant from CONICET (PIO 144-20140100035-CO). 

## Authors’ contributions

LAS, TIM, MDT and FRM conceived the ideas and designed methodology; TIM and LAS collected the data; LAS wrote the code; LAS, TIM and NPK analysed the data; NPK, LAS and TIM led the writing of the manuscript. All authors contributed critically to the drafts and gave final approval for publication.

## Data Availability Statement

The source code and data is available at zenodo <https://doi.org/10.5281/zenodo.3370022> and Github <https://github.com/lsaravia/MetawebsAssembly/>.  


## References
