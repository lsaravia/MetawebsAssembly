# From Local to regional and meta food web structure in Antarctica 

## Abstract

In recent years there has been an increased interest in spatial and temporal variation in food web structure. This is a necessary step to understand the influences of climate change and other global threats like biological invasions to ecosystems. The pool of species present in a broad geographic area and all their possible feeding interactions have been called meta-web, in analogy with the metacommunity concept. Local food webs are realizations of meta-webs that result from assembly processes influenced by migration, habitat filtering, stochastic factors, and dynamical constraints imposed by food web structure. The present study analyzed the largest meta-web available up to now: the marine Antarctic meta-web with an area of 34.8 million Km^2^, and compared it with two food webs that represent different spatial scales: the regional Weddell Sea (3.5 million Km^2^) and the local Potter Cove (6.8 Km^2^). The meta-web was built using a dietary database of the Southern Ocean including species located at latitudes higher than 60°S. This set of species takes into account only the predator-prey interactions and does not have a real network structure. 
One way to analyze the assembly processes that shape food webs is to use motifs; which are subgraphs of nodes (i.e. species) and links (i.e. predation) whose frequency deviates significantly compared to a random network topology. Here we assessed three-node motifs as they are a tractable study unit, and some of them have been related to the persistence of food webs. There are 16 possible three-node motifs yet only four have ecological relevance: apparent and exploitative competition, omnivory and tri-trophic chain. Due to the huge dissimilarity in spatial scale among the studied food webs, the motif representation of the local---Potter Cove---web is expected to be more different to the meta-web than the regional---Weddel Sea---network. 
Another important property that characterizes the structure of food webs is the existence of subsets of species that interact more frequently among each other than with other species: modularity. This feature is also related to food web persistence as disturbances are restricted to modules and cannot propagate easily between them. Realized food webs (local and regional in this case) are expected to exhibit higher modularity than the meta-web.
Furthermore, we studied a quantitative measure of the small-world topology, which refers to networks with a short mean path length between species and tightly interconnected clusters of nodes. Networks that show the small-world pattern are more resistant to extinctions and have higher resilience. As the meta-web does not represent realized interactions, small-world-ness is expected to be similar to a random network. On the other hand, real-world food webs like the local and regional ones are predicted to largely differ from its random counterparts.  
Our results showed that the local, regional and meta-webs present a similar general pattern regarding motif frequency. In this sense, highest frequency was observed for the competition (exploitative and apparent, in this order) and omnivory motifs, which were over-represented with respect to random networks. On the contrary, the tri-trophic motif exhibited a lower frequency and was under-represented. Although such similar pattern, the frequency of the two competitive motifs in the local food web displayed an important difference: apparent competition was much higher than exploitative competition. 
Contrary to our expectations, the meta-web had the highest modularity and small-world-ness with values significantly different from the random networks. The regional and local food webs presented a similar structure with progressively less modularity and small-world-ness. Besides, the local web did not differ as expected from random networks regarding small-world-ness.   
As all networks displayed a comparable motif pattern, it seems that the food web structure is determined by evolutionary processes, neither assembly processes nor dynamical constraints have a strong influence on it. 

**Leonardo A. Saravia** ^1^ ^2^, **Tomás  I. Marina** ^1^ ^2^ ^3^, **Marleen De Troch** ^4^, **Fernando R. Momo** ^1^ ^2^ 

1. Instituto de Ciencias, Universidad Nacional de General Sarmiento, J.M. Gutierrez 1159 (1613), 
Los Polvorines, Buenos Aires, Argentina.

2. INEDES, Universidad Nacional de Luján, CC 221, 6700 Luján, Argentina.

3. Consejo Nacional de Investigaciones Científicas y Técnicas (CONICET)

4. Marine Biology, Ghent University, Krijgslaan 281/S8, (B-9000), Ghent, Belgium.

\newpage

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

Small-World-ness   2.7536   4.6855  10.8656

SWness 99%CI       2.0670   2.2683  1.7106 

Modularity         0.8883  18.9697  85.7500
z-score

Groups            -1.4993 -2.3960  -0.2533
z-score
------------------------------------------

Table: Small-world-ness and modularity


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

Table: Motif counts z-scores and CI99%


\normalsize


![Local Food Web trophic level by compartiments](Figures/LocalFoodWeb.png)

![Regional Food Web trophic level by compartiments](Figures/RegionalFoodWeb.png)

![Meta Food Web trophic level by compartiments](Figures/MetaFoodWeb.png)