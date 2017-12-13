# From Local to regional and continental food web structure in Antarctica 

## Abstract

In recent years there has been an increased interest in spatial and temporal variation in food web structure. This is a necessary step to understand the influences of climate change and other global threats like biological invasions to ecosystems. The pool of species present in a broad geographic area and all their possible feeding interactions have been called metaweb, in analogy with the metacommunity concept. Local food webs are realizations of metawebs that resulting from assembly processes influenced by migration, habitat filtering, stochastic factors, and dynamical constraints imposed by food web structure. This paper analyzes the largest metaweb available up to now: the marine Antarctic metaweb and compares it with two food webs that represent different spatial scales: the regional Weddell Sea and the local Potter Cove. One gain insight into the processes that shape food webs is to use subgraphs of nodes (i.e. species) called motifs. The frequency of the following three-node motifs we analysed: tri-trophic chain, omnivory, apparent competition and exploitative competition. Due to the different spatial scales, the motif representation of the regional Weddel Sea network should be more similar to the metaweb than one exhibited in the local Potter Cove food web. Another important property that characterizes the structure of food webs is the existence of subsets of species that interact more frequently among themselves than with other species: compartmentalization. As the metaweb do not represent realized interactions we expect that the local and regional webs will be more compartmentalized. We will also assess the structural properties the food webs, and compare all the results among networks to disentangle which processes are more important to shape food webs at different spatial scales.

**Leonardo A. Saravia** ^1^ ^2^, **Tomás  I. Marina** ^1^ ^2^ ^3^, **Marleen De Troch** ^4^, **Fernando R. Momo** ^1^ ^2^ 

1. Instituto de Ciencias, Universidad Nacional de General Sarmiento, J.M. Gutierrez 1159 (1613), 
Los Polvorines, Buenos Aires, Argentina.

2. INEDES, Universidad Nacional de Luján, CC 221, 6700 Luján, Argentina.

3. Consejo Nacional de Investigaciones Científicas y Técnicas (CONICET)

4. Marine Biology, Ghent University, Krijgslaan 281/S8, (B-9000), Ghent, Belgium.

## Results

\scriptsize

------------------------------------------
  Network          Local  Regional    Meta  
----------------- ------ --------- -------
      Size          94      445      864  

      Links        309      1908    9007  

   Connectance    0.0350   0.0096  0.0121 

   PathLength     1.8016   2.2295  2.5920 

   Clustering     0.0977   0.0467  0.2161 

   Modularity     0.3728   0.4793  0.4467 

    MO 99%CI      0.3456   0.3530  0.2216 

    MO 99%CI      0.3854   0.3663  0.2265 

     Groups         5        6        7   

    GR 99%CI        6        8        6   

    GR 99%CI      9.005    12.000   9.000 

Mean rnd CC       0.0688   0.0190  0.0240 

Mean rnd CP       3.8054   4.3201  3.1383 

Mean rnd MO       0.3646   0.3597  0.2239 

Mean rnd GR       7.396    9.912    7.366 

Small-World-ness  2.9987   4.7612  10.8969

SWness 99%CI      2.2904   2.2154  1.6788 
------------------------------------------

Table: Small-world-ness and modularity

\newpage

------------------------------------------
                 Local  Regional      Meta   
-------------- ------- --------- ---------
Exploitative 
competition      830     42210    285866  

zEC            15.4971  592.2163 945.5640 

EClow          382.995  3831.995 44172.980

EChigh         510.015  4155.005 45468.105

Apparent 
competition     1983      7842    126552  

zAC            63.2947  58.4367  320.3600 

AClow          387.000  3828.995 44280.885

AChigh         508.005  4160.035 45488.040

Tri-trophic 
chain            578      3101     61739  

zTT            -7.8152  -48.7765 -69.3458 

TTlow          779.970  7728.995 88706.580

TThigh         975.010  8231.025 90724.300

Omnivory         124      892      36423  

zOM            15.3853  89.3244  1022.2137

OMlow             20        57      1033   

OMhigh          51.005   104.010  1198.030 
------------------------------------------

Table: Motif counts z-scores and CI99%


\normalsize


![Local Food Web trophic level by compartiments](Figures/LocalFoodWeb.png)

![Regional Food Web trophic level by compartiments](Figures/RegionalFoodWeb.png)

![Meta Food Web trophic level by compartiments](Figures/MetaFoodWeb.png)