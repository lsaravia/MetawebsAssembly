# Ecological network assembly: how the regional metaweb influences local food webs 

Leonardo A. Saravia ^1^ ^2^ ^6^, Tomás I. Marina ^3^, Nadiah P. Kristensen ^5^, Marleen De Troch ^4^,  Fernando R. Momo ^1^ ^2^

1. Instituto de Ciencias, Universidad Nacional de General Sarmiento, J.M. Gutierrez 1159 (1613), Los Polvorines, Buenos Aires, Argentina.

2. INEDES, Universidad Nacional de Luján, CC 221, 6700 Luján, Argentina.

3. Centro Austral de Investigaciones Científicas (CADIC-CONICET), Ushuaia, Argentina.

4. Marine Biology, Ghent University, Krijgslaan 281/S8, B-9000, Ghent, Belgium.

5. Department of Biological Sciences, National University of Singapore, 14 Science Drive 4 Singapore 117543, Singapore.

6. Corresponding author e-mail lsaravia@campus.ungs.edu.ar, ORCID https://orcid.org/0000-0002-7911-4398


**keywords**: Metaweb, ecological network assembly, network assembly model, food web structure, modularity , trophic coherence, motif, topological roles, null models

**Running title**: The metaweb influence on local food webs.

\newpage


## Abstract 

1. Local food webs can be studied as the realization of a sequence of colonizing and extinction events, where a regional pool of species ---called the metaweb--- acts as a source for new species. These are shaped by evolutionary and biogeographical processes at larger spatial and temporal scales than local webs. Food webs are thus the result of assembly processes that are influenced by migration, habitat filtering, stochastic factors, and dynamical constraints.

2. We compared the structure of empirical local food webs to webs resulting from a probabilistic assembly null model. The assembly model has no population dynamics but colonization and extinction events with the restriction that consumer species do have preys. The novelty of the model arises in the implementation of a statistical procedure to fit parameter values (colonization, extinction, secondary extinction) suited to each local food web. We used for comparison several network properties including trophic coherence, modularity, motifs, topological roles, and others. We hypothesized that the structure of empirical food webs should differ from model webs in a way that reflected dynamical stability and other local constraints. Three data sets were used: (1) the marine Antarctic metaweb, with 2 local food-webs; (2) the 50 lakes of the Adirondacks; and (3) the arthropod community from Florida Keys' classic defaunation experiment.

3. Contrary to our expectation, we found that there were almost no differences between empirical webs and those resulting from the assembly null model. Few empirical food webs showed significant differences with network properties, motif representations and topological roles, compared to the assembly null model.

4. Our results suggest that there are not strong dynamical or habitat restrictions upon food web structure at local scales. Instead, the structure of local webs is inherited from the metaweb without modifications.

5. Recently, it has been found in competitive and mutualistic networks that structures that are often attributed as causes or consequences of ecological stability are probably a by-product of the assembly processes (i.e. spandrels). We extended these results to trophic networks suggesting that this could be a more general phenomenon.


## Introduction

What determines the structure of a food web? The characterization of ecological systems as networks of interacting elements has a long history [@May1972;@Cohen1985;@Paine1966]; however, the effects of ecological dynamical processes on network structure are not fully understood. Structure is the result of community assembly, which is a repeated process of species arrival, colonization, and local extinction [@Cornell2014]. That implies there are two major components that determine food web structure: the composition of the regional pool, from which the species are drawn; and a selective process that determines which species can arrive and persist in the local web. The selective process is very complex, involving multiple mechanisms [@Mittelbach2015]. However, we should in theory be able to detect the signal of this process by comparing local webs to the regional pool from which they were drawn. 

The structure of a food web is ultimately constrained by the species and potential interactions that exist in the regional pool, i.e., the metaweb. The regional pool is shaped by evolutionary and biogeographical processes that imply large spatial and temporal scales [@Carstensen2013;@Kortsch2018], and it generally extends over many square kilometers and contains a large number of habitats and communities [@Mittelbach2015]. The different local communities have different food web structures, both in terms of the species present and interactions between them. Consequently, the metaweb includes many species co-occurrence and interaction possibilities that do not occur in reality, and provides the diversity from which local food web structure is drawn. If there are local selective processes that determine the structure of local food webs, then comparing local webs to the metaweb may allow us to separate the larger evolutionary and biogeographical processes [@Carstensen2013; @Kortsch2018] from the theorized local selective process.

Within the ultimate constraint imposed by the regional pool, the composition of the local community is determined by metacommunity processes. Which regional species can arrive and persist in a web is influenced by dispersal, environmental filters, biotic interactions and stochastic events [@HilleRisLambers2012]. These processes have been studied using metacommunity theory, where different spatial assemblages are connected through species dispersal [@Leibold2017].  Recently, there has been an increase in food web assembly studies, integrating them with island biogeography [@Gravel2011], metacommunity dynamics [@Pillai2011; @Liao2016] and the effects of habitat fragmentation [@Mougi2016]. As an extension of the species-area relationship (SAR) approach, one can derive a network-area relationship (NAR) using theoretical models [@Galiana2018]. However, this approach assumes that ecological dynamics (e.g., stability) will have no influence. Compared to the body of metacommunity theory, there are very few studies that have analyzed the assembly process using experimental or empirical data, and none of them focuses on topological network properties that could be related to different assembly processes. @Piechnik2008 found that the first to colonize are trophic generalists followed by specialists, supporting the hypothesis that biotic interactions are important in the assembly process [@Holt1999]. @Baiser2013 showed that habitat characteristics and dispersal capabilities were the main drivers of the assembly. @Fahimipour2014 also found that colonization rates were an important factor.

On top of metacommunity processes, the role of dynamical processes in determining food web structure has received a lot of theoretical attention, particularly dynamical stability as a potential constraint [@May1972; @McCann2000a]. Some theorists conceive of assembly as a non-Darwinian selection process [@Borrelli2015a], whereby species and structures that destabilize the web will be lost and stabilizing structures persist [@Pawar2009; @Borrelli2015a ]. Typically, assembly simulations produce large webs that are both stable in the dynamical sense and relatively resistant to further invasions [@Luh1993; @Law1996; @Drake1990]. Therefore, we expect that particular structural properties that confer stability will be over-represented in real food webs [@Borrelli2015], as these are the webs that are able to persist in time [@Grimm1992]. Here, the metaweb is conceived of as both the consequence of local assembly processes and the source of food-web structural diversity upon which local selective forces can act. Differences between local webs in the metaweb occur e.g., due to the stochastic order of arrival of species, which sends the local assembly tractories towards different stable states. Consequently, the metaweb as a whole describes species co-occurrences and interactions that are precluded by local dynamics, and therefore, the structural properties that confer stability should be over-represented in local food webs compared to the metaweb.

<!-- It just seemed to flow better to split these up -->
There is some evidence that real food webs possess stabilizing structural properties. A classic finding is that dynamical models parameterized with realistic species interaction-strength patterns have higher stability than randomized alternatives [@deRuiter1995; @Neutel2002]. The frequency of 3-node sub-networks, called motif [@Milo2002], is correlated with the stability in ecological [@Borrelli2015a] and other biological [@Prill2005] networks. Other stability-enhancing structural features can also arise for non-dynamical reasons; for example, the nested structure of mutualistic networks can arise as a spandrel of adaptive radiation [@Maynard2018;@Valverde2018], and low connectance may occur as a consequence of restricted diet breadth and adaptive foraging behavior [@Beckerman2006].

However, to test the hypothesis that dynamical selective processes are responsible for food web structure, we need an appropriate null model [@Lau2017] for comparison. When it comes to the broad structural properties that are most commonly measured in real food webs, it is niche models ---which are typically interpreted in terms of physiological constraints on predation relationships and do not rely upon population dynamic mechanisms---
that have been most successful at reproducing realistic food web structure [@Williams2000; @Loeuille2005]. This raises the possibility that the structural attributes typically measured in real webs can be explained by other processes, or may be too coarse to detect a subordinate influence of dynamics. Here, we propose that the metaweb itself can be used to create a baseline for comparison.

In this study, we used three empirical metaweb as the basis for the null model, to test for signals of the selective process in 57 local food webs. To create null food webs, we make the most minimal assumption possible, which is that any species can colonize from the metaweb and persist in a local web provided that it has at least one prey (food) item available. This null model, therefore, lacks any of the restrictions related to dynamical stability and local habitats that are thought to drive the selection processes of interest. We compare the observed structural network properties of real food webs to those of the null models, including global properties like modularity and mean trophic level, sub-network properties like motifs, and topological roles that estimate the role of species regarding the network modular structure. If real food web structure differs from null models and in the direction predicted by theory, then that is evidence in favour of the hypothesis that food web structure is constrained by dynamics.


## Methods

We compiled three metawebs with their corresponding local food webs, with a total of 57 local food webs from a variety of regions and ecosystems. We built the first metaweb from the Southern Ocean database compiled by @Raymond2011, selecting only species located at latitudes higher than 60°S. @Raymond2011 compiled information from direct sampling methods of dietary assessment, including gut, scat, and bolus content analysis, stomach flushing, and observed feeding. We considered that the metaweb is the regional pool of species defined by the biogeographic Antarctic region. As local food webs we included two of the most well-resolved datasets publicly available for the region: Weddell Sea and Potter Cove food webs. The first includes species situated between 74°S and 78°S with a West-East extension of approximately 450 km and comprises all information about trophic interactions available for the zone since 1983 [@Jacob2011], this dataset was obtained from @Brose2005. The Potter Cove food web comes from a 4 km long and 2.5 km wide Antarctic fjord located at 62°14'S, 58°40'W, South Shetland Islands [@Marina2018]. To make datasets compatible, we firstly checked taxonomic names for synonyms, and secondly added species (either prey or predator) with their interactions to the metaweb when the local food webs contain a greater taxonomic resolution. This resulted in the addition of 258 species to the metaweb, which represent 33% of the total. We named this the Antarctic metaweb, which has 846 species ($S$), 6897 links ($L$) and a connectance ($L/S^2$) of 0.01. 

The second metaweb was collected from pelagic organisms of 50 lakes of the Adirondacks region [@Havens1992], which were sampled once during summer 1984 [@Sutherland1989]. @Havens1992 determined the potential predator–prey interactions among 211 species from previous diet studies; species that lacked a trophic link were deleted and feeding links were assumed when the species involved were present in a particular lake. The so-called Lakes metaweb considers 211 species, 8426 links and a connectance of 0.19.   

The third metaweb comes from a well-known defaunation experiment performed in the Florida Keys in the 1960’s [@Simberloff1969; @Piechnik2008], where six islands of 11–25 meters in diameter were defaunated with insecticide. The arthropods were censused before the experiment and after it approximately once every 3 weeks during the first year and again 2 years after defaunation. For the metaweb and local webs we used only the first census that represent a complete community. @Piechnik2008 determined the trophic interactions among 211 species (8191 links,connectance 0.18) using published information and expert opinions. It is important to note that these last two datasets were obtained directly from the GATEWAy database [@Brose2019].


### Metaweb Assembly Null Model


To consider network assembly mechanisms we used a metaweb assembly model (Figure 1), similar to the trophic theory of island biogeography [@Gravel2011]. In this model species migrate from the metaweb to a local web with a probability $c$, and become extinct from the local web with probability $e$; a reminiscence of the theory of island biogeography [@MacArthur1967], but with the addition of network structure. Species migrate with their potential network links from the metaweb, then in the local web, species have a probability of secondary extinction $se$ if none of its preys are present, which only applies to non-basal species. When a species goes extinct locally it may produce secondary extinctions modulated by $se$ (Figure 1). 

Then there are three possible events: colonization, extinction, and secondary extinction. After a colonization event with probability $c$, the species is present in the local community and two other events are possible: 

  1. if it is a basal species it does not need predators to survive, then it persists until an extinction event with probability $e$;
  2. if it is a non-basal species it could become extinct with probability $e$ but if it has no prey it could also become extinct with probability $se$.

These events could happen at random if the necessary conditions are fulfilled, we use the @Gillespie1976a algorithm to simulate the model.

We simulated this model in time and it eventually reached a steady state that depends on the migration and extinction probabilities but also on the structure of the metaweb. The ratio of immigration vs. extinction $\alpha= c/e$ is hypothesized to be inversely related to the distance to the mainland [@MacArthur1967], and as extinction should be inversely proportional to population size [@Hanski1999], the ratio $\alpha$ is also hypothesized to be related to the local area.

For the model used in @Gravel2011, simulations with the same ratio $\alpha= c/e$ should give the same results, but as our model incorporates $se$ as an additional parameter this might not be the case. We checked this performing simulations with different combinations of $c$, $e$, and $se$ keeping $\alpha$ constant for different metawebs. We found differences for some of the combinations (Figure S6), thus we performed the fitting using the 3 parameters. 

To fit the model to each metaweb we performed 150000 simulations with a wide range of parameters (Table S1) using latin hypercube sampling [@Fang2005]. We simulated the model for 1000 time steps and use the last 100 time steps to calculate averages for the number of species $S_m$, the number of links $E_m$ and the connectance $C_m = E_m/S_m^2$. Then we calculated a relative distance to the number of species $S_e$ and connectance $C_e$ of the empirical food webs:  

$$distance = \sqrt{ ((S_e - S_m) / S_e )^2 + ((C_e - C_m)/ C_e)^2 }$$

Then we used the parameters with the minimal distance to simulate the model and compare with the network properties described in the following section. The fitted parameters for all local food webs are presented in table S2.

In summary, this model considers colonization-extinction and secondary extinctions events constrained by network structure, with no consideration of population dynamics and interaction strength. Then, this simple model acts as a null model: if we observe a deviation from a network property obtained with the null model then those mechanisms that are excluded from the model may be acting [@DeBello2012]. 

![Schematic diagram of the metaweb assembly null model: species migrate from the metaweb with a probability $c$ to a local network carrying their potential links; here they have a probability of extinction $e$. Additionally, predators become extinct if their preys are locally extinct with probability $se$. We simulate 1000 local networks and calculate network properties. From the distribution of these topological properties we calculate 1% confidence intervals to compare with empirical networks](Figures/MetaWebAssemblyModelFigure.pdf)


### Structural network properties

We selected properties related to stability and resilience like: trophic coherence that is based on the distances between the trophic positions of species and measures how well species fall into discrete trophic levels [@Johnson2014;@Johnson2017]; mean trophic level, historically used as an ecosystem health indicator [@Pauly1998], predicting that food webs with higher trophic levels are less stable [@Borrelli2014]; modularity, that measures the existence of groups of prey and predators that interact more strongly with each other than with species belonging to other modules and it prevents the propagation of perturbations throughout the network, increasing its persistence [@Stouffer2011]; and a measure of local stability using the eingenvalues of randomly parameterised networks. 

To describe food webs as networks each species is represented as a node or vertex and the trophic interactions are represented as edges or links between nodes. These links are directed, from the prey to the predator, as the flow of energy and matter. Two nodes are neighbours if they are connected by an edge and the degree $k_i$ of node $i$ is the number of neighbours it has. The food web can be represented by an adjacency matrix $A=(a_{ij})$ where $a_{ij}=1$ if species $j$ predates on species $i$, else is 0. Then $k_i^{in}=\sum_j{a_{ji}}$ is the number of preys of species $i$ or its in-degree, and $k_i^{out}=\sum_j{a_{ij}}$ is the number of predators of $i$ or its out-degree. The total number of edges is $L=\sum_{ij}a_{ij}$. 

We first calculated a property called trophic coherence [@Johnson2014], that is related to stability in the sense that small perturbations could get amplified or vanished, which is called local linear stability [@May1972;@Rohr2014]. We first needed to estimate the trophic level of a node $i$, defined as the average trophic level of its preys plus 1. That is:

\begin{align}
tp_i= 1 + \frac{1}{k_i^{in}}\sum_{j}{a_{ij} tp_j}
\end{align}

where $k_i^{in}=\sum_{j}a_{ji}$ is the number of preys of species $i$, basal species that do not have preys (then $k_i^{in}=0$) are assigned a $tp=1$. Then the trophic difference associated to each edge is defined as $x_{ij}=tp_i - tp_j$. The distribution of trophic differences, $p(x)$, has a mean $L^{-1} \sum_{ij} a_{ij} x_{ij} = 1$ by definition. Then the trophic coherence is measured by:

\begin{align}
Q = \sqrt{\frac{1}{L} \sum_{ij}a_{ij}x_{ij}^2 - 1}
\end{align}


that is the standard deviation of the distribution of all trophic distances. A food web is more coherent when $Q$ is closer to zero, thus the maximal coherence is achieved when $Q = 0$, and corresponds to a layered network in which every node has an integer trophic level [@Johnson2014; @Johnson2017]. To compare coherence and trophic level we generated 1000 null model networks with the fitted parameters of the metaweb assembly model. Then we calculated the 99% confidence interval using the 0.5% and 99.5% quantiles of the distribution of $Q$. We also calculated the CI for the mean trophic level.

Another property related to stability is modularity, since the impacts of a perturbation are retained within modules minimizing impacts on the food web [@Fortuna2010; @Grilli2016]. It measures how strongly sub-groups of species interact between them compared with the strength of interaction with other sub-groups [@Newman2004]. These sub-groups are called modules. To find the best partition, we used a stochastic algorithm based on simulated annealing [@Reichardt2006]. Simulated annealing allows maximizing modularity without getting trapped in local maxima configurations [@Guimera2005]. The index of modularity was defined as: 

\begin{align}
M = \sum_s \left(\frac{I_s}{L} - \left(\frac{d_s}{2L}\right)^2 \right)
\end{align}

where $s$ is the number of modules, $I_s$ is the number of links between species in the module $s$, $d_s$ is the sum of degrees for all species in module $s$ and $L$ is the total number of links for the network. As the algorithm is stochastic we estimated modularity as the mean of 100 repetitions.  To assess the significance of our networks we calculated the 99% confidence intervals based on 1000 null model networks as previously described. 


Finally, we calculated the average of the maximal real part of the eigenvalues of the jacobian [@Grilli2016] for randomly parametrized systems, keeping fixed the predator-prey (sign) structure. This is a measure related to quasi sign-stability (QSS) that is the proportion of randomly parametrized systems that are locally stable [@Allesina2008a]. The Jacobian $J$, so-called community matrix [@May1973], represents the population-level effect of a change in one species’ density on any other species, including the dependence on its own density (self-regulation), at an equilibrium. A system is locally stable if the Jacobian $J$ has all its eigenvalues negative, thus the maximal eigenvalue has to be less than zero for a system to be locally stable. The signs of the elements of $J$ are given by the predator-prey structure of the food web, but the magnitude of the elements are unknown. Following previous analysis [@Monteiro2016;@Borrelli2015a], we estimated the unknown magnitudes by drawing the predator-prey interactions from a uniform distribution ranging from -10 to 0, the prey-predator interactions from 0 to 0.1, and from 0 to -1 for the self-regulation effect. This implies that the predator effect on the prey is bigger than the effect of the prey on the predator, and that the self-regulation or self-damping effect, that scales the dynamic's return time, is generally smaller than the predator-prey effect. Besides other parametrizations are possible they give very similar results (not shown). We sampled 1000 jacobians to estimate the maximal real part of the eigenvalues and withhold the average, we repeat this procedure for each of the 1000 null model networks and estimated the 99% confidence intervals as described earlier.


To show the results graphically we calculated the deviation for each metric, which correspond to the 99% confidence intervals for the metric’s value in the assembly null model. We define the mid-point

$$metric_{mid} = metric_{low} + \frac{metric_{high} - metric_{low}}{2}$$

Then the deviation of the observed value of the real web is calculated

$$deviation = \frac{metric_{observed} - metric_{mid}}{metric_{high} - metric_{low}}$$

A deviation value outside of [−0.5, 0.5] indicates that the value is outside of the 99% confidence interval. 

### Motifs

We considered the abundance of sub-networks that deviates significantly from a null model network, which are called motifs [@Milo2002]. In practice, sub-networks are generally called motif without taking into account the mentioned condition. We analyzed here the four three-species motifs that have been most studied theoretically and empirically in food webs [@Prill2005;@Stouffer2007;@Baiser2016] (Figure 2). During the assembly process, motifs that are less dynamically stable tend to disappear from the food web [@Borrelli2015a; @Borrelli2015]. Furthermore, different motifs patterns could also be the result of habitat filtering [@Baldassano2016; @Dekel2005] 

The four three-species motifs are: apparent competition, where two preys share a predator; exploitative competition, where two predators consume the same prey; omnivory, where predators feed at different trophic levels; and tri-trophic chain, where the top predator consumes an intermediate predator that consumes a basal prey (Figure 2). These are the most common motifs present in food webs [@Monteiro2017; @Borrelli2015a]. We compared the frequency of these motifs to 1000 null model networks using the 99% confidence intervals, and deviation as previously described.

![The four three-species motifs analysed: apparent competition, exploitative competition, tri-trophic chain, and omnivory.  Motifs are three-node sub-networks. These four Motifs have been explored both theoretically and empirically in ecological networks and are the most common found in food webs](Figures/Fig1Motifs.png)

### Topological roles

To detect the process of habitat filtering or dispersal limitation in local food webs we calculated topological roles, which characterize how many trophic links are conducted within their module and/or between modules [@Guimera2005; @Kortsch2015]. Theoretical and empirical results suggest these roles are related to species traits, such as niche breadth, environmental tolerance, apex position in local communities and motility [@Borthagaray2014;@Guimera2010;@Rezende2009;@Kortsch2015;@Dupont2009]. 

We determined topological roles using the method of functional cartography [@Guimera2005], which is based on module membership (See modularity). The roles are characterized by two parameters: the standardized within-module degree $dz$ and the among-module connectivity participation coefficient $PC$.  The within-module degree is a z-score that measures how well a species is connected to other species within its module:

$$dz_i = \frac{k_{is}-\bar{k_s} }{\sigma_{ks}}$$ 


where $k_{is}$ is the number of links of species $i$ within its own module $s$, $\bar{k_s}$ and $\sigma_{ks}$ are the average and standard deviation of $k_{is}$ over all species in $s$. The participation coefficient $PC$ estimates the distribution of the links of species $i$ among modules; thus it can be defined as:

$$PC_i =  1 - \sum_s \frac{k_{is}}{k_i}$$ 

where $k_i$ is the degree of species $i$ (i.e. the number of links), $k_{is}$ is the number of links of species $i$ to species in module $s$. Due to the stochastic nature of the module detection algorithm, we made repeated runs of the algorithm (starting from 100 runs) until there were no statistical differences between the distributions of $PC_i$ and $dz_i$ in successive repetitions; to test such statistical difference we used the k-sample Anderson-Darling test [@Scholz1987]. Then we calculated the mean and 95% confidence interval of $dz$ and $PC$.

To determine each species' role the $dz-PC$ parameter space was divided into four areas, modified from @Guimera2005, using the same scheme as @Kortsch2015. Two thresholds were used to define the species’ roles: $PC=0.625$ and $dz=2.5$. If a species had at least 60% of links within its module then $PC<0.625$, and if it also had $dz\ge 2.5$, thus it was classified as a module hub. This parameter space defines species with a relatively high number of links, the majority within its module. If a species had $PC<0.625$ and $dz<2.5$, then it was called a peripheral or specialist; this refers to a species with relatively few links, mostly within its module. Species that had $PC\ge0.625$ and $dz<2.5$ were considered module connectors, since they have relatively few links, mostly between modules. Finally, if a species had $PC\ge0.625$ and $dz\ge 2.5$, then it was classified as a super-generalist or hub-connector because it has high between- and within-module connectivity. 

We estimated the roles for empirical networks and for 20 realizations of the fitted assembly model networks. To test if the proportion of species’ roles changed between the empircal and each of the realizations of the model we performed a Pearson's Chi-squared test with simulated p-value based on 10000 Monte Carlo replicates. 

All analyses and simulations were performed in R version 4.0.3 [@RCoreTeam2017], using the igraph package version 1.2.6 [@Csardi2006] for motifs, the package multiweb for topological roles, $Q$ and other network metrics [@Saravia2019c], and the package meweasmo for the metaweb assembly model [@Saravia2020]. Source code and data are available at zenodo <https://doi.org/10.5281/zenodo.3370022> and GitHub <https://github.com/lsaravia/MetawebsAssembly/>.  

## Results

A general description of all networks using the structural properties including metawebs is presented in appendix table S3. For the Antarctic metaweb the differences in the number of species (size) between local food webs and the metaweb are greater than for the other metawebs. It is the biggest metaweb in size, but its connectance is lowest. The metawebs of Florida Islands and Adirondacks' Lakes have similar size and links but for the later many of the local food webs have a small size, and the connectance of the metaweb is higher. Thus there is a wide range of local food web sizes (13 to 435), number of links (17 to 3560), and connectance (0.01 to 0.15) in our dataset. We cannot directly compare the metaweb properties with the local webs properties since they are dependent on size, number of links and/or connectance [@Dunne2002a; @Poisot2014]. The comparison of the local networks with the networks generated by the fitted assembly null model takes into account this issue.

We found no differences between the assembly null model and the local food webs for trophic coherence (Q) (Figure 3, Table S5). The mean maximal eingenvalue (MEing) was also not different except for Weddell Sea, which has a lower value resulting in an increased local stability, and four local webs from the Lakes dataset (Briddge Brook Lake, Chub Pond, Hoel Lake, Long Lake) which have a higher MEing and lower stability than the model (Figure 3, Table S5). Only one (Weddell Sea, Antarctic metaweb) was significantly different for mean trophic level (TL) (Figure 4, Table S4), being higher than the confidence interval. This should be the opposite if dynamical stability constraints where acting. For modularity we found only one local food web that is less modular than the model (Chub Pond, Lakes metaweb) (Figura 4, Table S5). 

![Trophic coherence (Q) and mean of maximal eingenvalue (MEIng) comparison for local empirical networks (dots) and assembly null model networks. We ran 1000 simulations of the metaweb assembly model fitted to local networks to build the 99% confidence intervals of the metric and calculated the deviation; a value outside -0.5,0.5 interval (vertical dotted lines) indicates that the value is outside of the 99% confidence interval. Colors represent metawebs to which local food webs belong, where *Ant* is the Antarctic, *Isl* is the Islands, and *Lak* the lakes metaweb.](Figures/MEing_Q_Assembly_byMeta.pdf)


![Modularity and mean trophic level comparison for local empirical networks (dots) and assembly null model networks. We ran 1000 simulations of the metaweb assembly model fitted to local networks to build the 99% confidence intervals of the metric and calculated the deviation; a value outside -0.5,0.5 interval (vertical dotted lines) indicates that the value is outside of the 99% confidence interval. Colors represent metawebs to which local food webs belong, where *Ant* is the Antarctic, *Isl* is the Islands, and *Lak* the lakes metaweb.](Figures/Modularity_TL_Assembly_byMeta.pdf)


Comparing the motifs generated from the metaweb assembly null model, 9 of 57 (16%) networks showed at least one significant motif over-representation and only one (Weddell Sea) showed motifs under-representation (Figure 5, Table S6). The Hoel lake network was the only one that showed over-representation for all motifs. Long lake showed only omnivory over-representation, and 5 more have only 1 motif (not omnivory) over-representation. Apparent competition and exploitative competition were the most over-represented motifs (6 and 5 times).

The proportion of topological roles was similar to the metaweb assembly model; for the realizations of the model between 1 and 7 out of 57 (2-12%) were different at 1% significant level (Table S8). Figure 6 shows the proportions for the Antarctic and Islands metawebs for one realization of the model. We added the topological role proportions for the corresponding metaweb in each case to visually compare with both the empirical and model food webs. The only food web that showed consistent differences with the model was Potter Cove (100% of the realizations), and the second the Weddell food web that showed diferences 50% of the times (Table S9). 


![Motifs' abundance comparison for local empirical networks (dots) and assembly null model networks. We ran 1000 simulations of the metaweb assembly model fitted to local networks to build the 99% confidence intervals of the metric and calculated the deviation; a value outside -0.5,0.5 interval (vertical dotted lines) indicates that the value is outside of the 99% confidence interval. Colors represent metawebs to which local food webs belong, where *Ant* is the Antarctic, *Isl* is the Islands, and *Lak* the lakes metaweb.](Figures/Motif_Zscores_Assembly.pdf){ width=100% }


![Topological roles proportions for local empirical networks and metawebs compared with assembly null model for the Antarctic (A) and Islands metawebs (B). The topological roles are: *Hub connectors* have a high number of between module links; *Module connectors* have a low number of links mostly between modules;  *Module hubs* have a high number of links inside its module; *Module specialists* have a low number of links inside its module. Plots marked with '*' are different from the null model at 1% level](Figures/Ant_Isl_TopoRoles_ByNetwork_Model.png)

## Discussion

<!-- going through to smoothen language, and I will leave the original version in comments in case you need to quickly revert, because I know you need to submit soon -->

<!-- As it is based in the regional pool of species, the metaweb structure should reflect the evolutionary constraints of the species interactions, and the local networks should be influenced and determined by the assembly processes and the local environment. Thus, we should have obtained differences comparing the metaweb assembly model with the real local food webs. Interestingly, our results rejected that hypothesis, showing that the structure of the local food webs does not differ significantly from the model in most properties. We did not find that the properties expected to change due to local stability constraints did so consistently (mean trophic level, modularity, MEing, motifs). Although we found differences for some local food webs this was not a general pattern. The same happened for topological roles that were expected to change probably due to habitat filtering and dispersal limitation. These suggest that food webs would be mainly shaped by metaweb structure and less influenced by local stability, environmental drivers or assembly processes.-->

The regional species pool and metaweb structure reflects evolutionary and biogeographical processes, and includes many species co-occurrences and interactions that do not occur in any particular community.
In addition, it is hypothesised that local food webs are also influenced by the local environment and determined by the assembly processes, including dynamical constraints on food web structure.
If this hypothesis is true, 
then we should have observed differences between the metaweb assembly model and real local food webs.
Interestingly, our results rejected that hypothesis, 
showing that the structure of the local food webs does not differ significantly from the model in most properties. 
We did not find that the properties expected to change due to local stability constraints did so consistently (mean trophic level, modularity, MEing, motifs). 
Although we found differences for some local food webs, this was not a general pattern. 
We obtained a similar result for topological roles,
which were expected to change due to habitat filtering and dispersal limitation. 
These results suggest that, for the metrics we investigated, food webs are be mainly shaped by metaweb structure,
and are less influenced by local stability, environmental drivers or assembly processes.  

<!-- It is expected for local food webs to have relatively few trophic levels [@Williams2002;@Borrelli2014]. Different hypotheses have been posed to explain this pattern: the low efficiency of energy transfer between trophic levels, predator size, predator behaviour, and consumer diversity [@Young2013]. Recently, it has been proposed that maximum trophic level could be related to productivity and ecosystem size depending on the context but related to energy fluxes that promote omnivory [@Ward2017]. We found that the mean trophic level of the local food webs was not different from the assembly model in most cases. -->

Local food webs are expected to have relatively few trophic levels [@Williams2002;@Borrelli2014]. Different hypotheses have been posed to explain this pattern: the low efficiency of energy transfer between trophic levels, predator size, predator behaviour, and consumer diversity [@Young2013]. Recently, it was been proposed that maximum trophic level could be related to productivity and ecosystem size (depending on the context) and related to energy fluxes that promote omnivory [@Ward2017]. We found that the mean trophic level of the local food webs was not different from the assembly model in most cases.

<!-- The existence of a modular structure could be related to habitat heterogeneity [@Krause2003;@Rezende2009]. Recent studies suggest that modularity enhances local stability and this effect is stronger as the more complex the network is [@Stouffer2011], even though the effect on stability strongly depends on the interaction strength configuration [@Grilli2016] and the existence of external perturbations [@Gilarranz2017]. This suggests that modularity should be  maximized by local stability constraints and also could be different from the model because of the presence of habitat heterogeneity. However, we found no significant difference in modularity from the assembly model in most cases except one: the Chub Pond from Lakes metaweb. -->

Local food webs are expected to have a modular structure both due to habitat and dynamical reasons.
The existence of a modular structure may reflect habitat heterogeneity [@Krause2003;@Rezende2009]. 
In addition, 
recent studies have found that modularity enhances local stability,
and that this effect is stronger the more complex the network is [@Stouffer2011]. 
It should be noted that the effect on stability also strongly depends on the interaction strength configuration [@Grilli2016] and the existence of external perturbations [@Gilarranz2017]. 
Nevertheless, both lines of evidence lead us to expect a difference in modularity between real and assembled model webs.
However, we found no significant difference in modularity except in one case: the Chub Pond from Lakes metaweb. 

<!-- Biotic interactions are expected to be more important at local scales [@Belmaker2015], thus dynamical stability represented by mean maximal eingenvalue ($MEing$) and trophic coherence ($Q$) is expected to be greater than that of the assembly model. Nevertheless, we only found the Weddell Sea (e.g. exhibited a greater stability, lower $MEing$) to follow this expectation, and four local food webs belonging to the Lakes metaweb showed exactly the contrary (e.g. lower stability, higher $MEing$). Thus, although this evidence is not conclusive concerning the importance of dynamical stability in the assembly of food webs, the structure of the local food webs examined here seems to be a consequence of the metaweb structure. Another possibility that would require further investigation is that these properties were not sensitive enough to detect changes between the simulated and empirical food webs. As most of predator-prey interactions are weak [@McCann1998;@Neutel2002], then the structure of the species-rich food webs we investigated might mask the importance of the few strong links. Furthermore, @Grilli2016 states that a particular network structure could be stabilizing or destabilizing depending on specific conditions, which could render the detection of structures related to stability constraints nearly impossible. -->

Biotic interactions are expected to be more important at local scales [@Belmaker2015]; thus, dynamical stability, represented by mean maximal eingenvalue ($MEing$) and trophic coherence ($Q$), is expected to be greater in real than assembled model webs. 
However, only Weddell Sea matched our expectations (i.e. higher stability manifest as lower $MEing$), and four local food webs, belonging to the Lakes metaweb, showed the opposite pattern (i.e. lower stability, higher $MEing$). 
Although inconclusive,
this mixed evidence means that we cannot rule out that the stability aspects of food web structure are also a consequence of of the metaweb structure. 
Another possibility that would require further investigation is that these properties were not sensitive enough to detect changes between the simulated and empirical food webs. 
Stability is also determined by interaction strengths,
and as most of predator-prey interactions are weak [@McCann1998;@Neutel2002], 
the structure of the species-rich food webs we investigated may mask the importance of few strong links.
Furthermore, @Grilli2016 states that a particular network structure can be stabilizing or destabilizing depending on specific conditions, which could render the detection of structures related to stability constraints nearly impossible.

<!-- If food web structure is influenced by dynamical constraints, then we would expect empirical food webs to have a higher frequency of stability-enhancing motifs than assembled model networks. If we take into account the stability of three-species motifs, the expected pattern is an over-representation of tri-trophic chains, exploitative and apparent competition [@Borrelli2015a], and the omnivory motif that could enhance or diminish stability [@Monteiro2016]. We observed an over-representation in some Lakes food webs but there was not a consistent pattern; besides we found under-representation in the Weddell Sea. Thus, the selection of motifs due to its dynamical stability does not seem to be acting. Food webs are more than the sum of its three-species modules [@Cohen2009a], which might be the case of Weddell Sea food web that showed contradictory results: high mean trophic level, enhancing stability, and an under-representation of omnivory and apparent competition motifs. Here the omnivory motif seems to act as destabilizing since the food webs with an over-representation of it (Chub Pond, Hoel Lake and Long Lake) are the ones with significant lower local stability (higher MEing) and the food web with an under-representation of omnivory (Weddell Sea) presents a higher stability value. -->

If food web structure is influenced by dynamical constraints, then we would expect empirical food webs to have a higher frequency of stability-enhancing motifs than assembled model networks. 
The expected pattern is an over-representation of tri-trophic chains, exploitative and apparent competition [@Borrelli2015a], whereas the omnivory motif may either increase or decrease stability [@Monteiro2016]. 
We observed an over-representation of stability-enhancing motifs in some Lakes food webs, but there was not a consistent pattern. 
Moreover, stabilising motifs were under-represented in the Weddell Sea. 
Thus, we do not find good evidence for the selection of stability-enhancing motifs.
Food webs are more than the sum of their three-species modules [@Cohen2009a], 
and the contradictory results in the case of Weddell Sea are a case in point:
high mean trophic level, enhancing stability, and an under-representation of omnivory and apparent competition motifs. 
<!-- why do you say "high mean trophic level, enhancing stability"? Isn't low mean trophic level the stability enhancing one? LAS: yes it's wrong!!-->
We also found the omnivory motif to be destablising: 
food webs with an over-representation of the omnivory motif (Chub Pond, Hoel Lake and Long Lake) also had 
significantly lower stability (higher MEing),
whereas webs with an under-representation (Weddell Sea) had higher stability.

Topological roles are valuable to detect the existence of functional roles of species, like super-generalists (or hub connectors). These roles may change as the scale changes, from the metaweb to a local food web. A simple explanation is that modules also change. It was demonstrated in Arctic and Caribbean marine food webs that modules are usually associated with habitats [@Kortsch2015; @Rezende2009]. For example, the Antarctic cod (*Notothenia coriiceps*) is a super-generalist for Potter Cove and a module hub---a species with most of its links within its module---for the metaweb. This means that the same species can have different effects on the food web depending on the type or extension of the habitat considered. In smaller areas there will be different proportions and different kinds of habitats, and probably as a product of habitat filtering, there should be a change in the frequency of species that represent a particular topological role. We observed that local food webs showed mostly no changes in the frequency of topological roles against the assembly model. This might be explained by the fact that although local food webs are comprised of different species due to habitat filtering or dispersal limitation, other species could take the same role and maintain the expected structure generated by the metaweb assembly model.

The metaweb proportions of topological roles could be shaped as the sum of local food webs; note that Lakes and Islands metawebs proportions are very different to local ones. As the local food webs in these metawebs have similar habitats of slightly different sizes, the metaweb could represent a general structure that through the simple assembly model gives local food webs. The case of the Antarctic metaweb is singular because there is a much bigger difference in the sizes of the local food webs and the sum of them is not similar to the metaweb. Thus, it seems to be more probable than the roles of Antarctic local food webs are different from the metaweb. 

In this work, we assumed that the metaweb influences the structure of local webs through the assembly process, but local webs are a fundamental part of the metaweb and there should be also an influence going in the other direction [@Araujo2014;@Ricklefs1987]. This means that the structure of the metaweb could be already shaped by stability constraints of the local food webs, probably at evolutionary time scales; we decided to call this hypothetical effect the "ghost of stability in the past". This mechanism would be that species that migrate to the local food web might produce unstable configurations which trigger local extinctions. Then the set of species that become extinct in all local food webs would not be present in the metaweb anymore. The time scale of this process could be much longer than that of extinction in a particular food web so it could be at a similar time scale than the evolutionary processes involved in building of the metaweb. Thus, in this case we would expect no differences with the assembly model regarding structural network properties and motifs.

Besides we can not rule out the possibility of the ghost of stability in the past, as this would probably require the inclusion of evolutionary processes in the model and the design of new computational experiments [@Bolchoun2017]. A recent experimental study detected that biotic interactions were present but weak or transient and that community structure depends more strongly on regional environmental factors [@Hacker2019], also there is evidence that food web structure depends strongly on colonization processes [@Fahimipour2014]. These are in line with our results that show differences of topological roles with seemingly different local habitats and almost no influence of stability constraints on local food web structure.  

In conclusion, our findings suggest that evolutionary and assembly processes could be more important than local dynamics. This kind of analysis needs to be expanded to different regions and other kinds of habitats to confirm if this is a general pattern or not.
	
## Acknowledgements

We are grateful to the National University of General Sarmiento for financial support (Project 30/1139). LAS would like to thank Susanne Kortsch that shared with us her source code for topological analysis and figures. This work was partially supported by a grant from CONICET (PIO 144-20140100035-CO). 

## Authors’ contributions

LAS, TIM, MDT and FRM conceived the ideas and designed methodology; TIM and LAS collected the data; LAS wrote the code; LAS, TIM and NPK analysed the data; NPK, LAS and TIM led the writing of the manuscript. All authors contributed critically to the drafts and gave final approval for publication.

## Data Availability Statement

The source code and data is available at zenodo <https://doi.org/10.5281/zenodo.3370022> and Github <https://github.com/lsaravia/MetawebsAssembly/>.  


## References
