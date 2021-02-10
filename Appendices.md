# Supplementary Information


## Meta-web assembly model simulations and fitting


The model, conceptually explained in figure 1, has 3 parameters: $c$ the probability of a species to colonize the local network from the meta-web, $e$ the probability to become locally extinct, and the probability of secondary extinction $se$ that is the probability of extinction when the species is a predator and there is no prey locally present. Then there are three possible events, colonization, extinction, and secondary extinction. After a colonization event with probability $c$ the species is present in the local community and other two events are possible: 
  1. if it is a basal species it does not need predators to survive then it persists until an extinction event with probability $e$. 
  2. If it is a non-basal species it could become extinct with probability $e$ but if it has no prey it could also become extinct with probability $se$.
These events could happen at a random if the necessary conditions are fulfilled, we use the @Gillespie1976a algorithm to simulate the model.

We performed exploratory simulations to determine if the last 100 time steps of 1000 simulated were enough to avoid the transient period and sample the attractor of the model. Figures S1, S2 show that there are no differences in the dynamics after 1000 or 3000 time steps and that the transient is well over after 1000 time steps. We repeated these exploratory simulations with the three metawebs with similar results.  


![Windowed averages of a simulation of the Meta-web assembly model with the Antarctic metaweb and parameters near the fitted to Potter Cove food web. Where $mS$ and $mL$ are Windowed averages of the number of species and the links, error bars are the standard deviationd ,the dashed is line the overall mean, using a window of 50 time steps,. The parameters were $c$=0.02, $e$=0.05, $se$=0.70](Figures/Metaweb_steady_state_Potter.png)


![Windowed averages of a simulation of the Meta-web assembly model  with the Antarctic metaweb and parameters near the fitted to Weddell Sea food web. Where $mS$ and $mL$ are windowed averages of the number of species and the links, error bars the are standard deviation, the dashed is line the overall mean, using a window of 50 time steps. The parameters were $c$=0.03, $e$=0.016, $se$=0.10](Figures/Metaweb_steady_state_Weddell.png)


To fit the model to each metaweb we performed 150000 simulations with a wide range of parameters (table S1) using lating hypercubic sampling [@Fang2005], we simulated the model for 1000 time steps and use the last 100 time steps to calculate average the number of species $S_m$, the average number of links $E_m$ and the average connectance $C_m = E_m/S_m^2$ where. Then we calculated a relative distance to the number of species $S_e$  and connectance $C_e$ of the empirical food webs:  

$$distance = \sqrt{ ((S_e - S_m) / S_e )^2 + ((C_e - C_m)/ C_e)^2 }$$

Then we used the parameters with the minimal distance to simulate the model and compare with the network metrics explained in the main text.


| Parameter   |      |    |
|:------------|-----:|---:|
|$c$          | 0.010| 0.3|
|$e$          | 0.001| 0.5|
|$se$         | 0.100| 0.9|

Table: Range of parameters used in latin hypercubic sampling to simulate the metaweb assembly model 



\newpage


\scriptsize

|Metaweb |Network                 |    $c$|    $e$|   $se$|        S|         L|      C| $\alpha$| distance|
|:-------|:-----------------------|------:|------:|------:|--------:|---------:|------:|--------:|--------:|
|Ant     |Ant_Potter              | 0.0188| 0.0552| 0.7648|  93.5050|  346.0792| 0.0396|   0.3412|   0.0349|
|Ant     |Ant_Weddell             | 0.0271| 0.0164| 0.1016| 450.3663| 2312.5446| 0.0114|   1.6509|   0.0973|
|Isl     |Isl_FloridaIslandE1     | 0.0837| 0.0011| 0.7574| 208.3069| 3516.1188| 0.0810|  74.3415|   0.0089|
|Isl     |Isl_FloridaIslandE2     | 0.1930| 0.4310| 0.1386|  58.8713|  297.5743| 0.0859|   0.4477|   0.0037|
|Isl     |Isl_FloridaIslandE3     | 0.2467| 0.0015| 0.1536| 210.1386| 3641.1188| 0.0825| 165.8384|   0.0041|
|Isl     |Isl_FloridaIslandE7     | 0.1099| 0.2167| 0.4400|  54.0297|  301.1386| 0.1032|   0.5069|   0.0008|
|Isl     |Isl_FloridaIslandE9     | 0.1288| 0.2053| 0.7716|  55.8812|  358.7921| 0.1149|   0.6276|   0.0028|
|Lak     |Lak_Alford_lake         | 0.0375| 0.0735| 0.7522|  56.5545|  224.9406| 0.0703|   0.5095|   0.0102|
|Lak     |Lak_Balsam_lake         | 0.0239| 0.0503| 0.3548|  49.7426|  196.7723| 0.0795|   0.4749|   0.2383|
|Lak     |Lak_Beaver_lake         | 0.0163| 0.0363| 0.4049|  52.3366|  210.6634| 0.0769|   0.4492|   0.1167|
|Lak     |Lak_Big_hope_lake       | 0.0160| 0.0390| 0.5759|  56.1287|  236.4752| 0.0751|   0.4094|   0.1686|
|Lak     |Lak_Brandy_lake         | 0.0122| 0.0438| 0.2648|  32.5347|  106.0396| 0.1002|   0.2794|   0.2685|
|Lak     |Lak_Bridge_brook_lake   | 0.0221| 0.0304| 0.2525|  76.6040|  388.0594| 0.0661|   0.7284|   0.3280|
|Lak     |Lak_Brook_trout_lake    | 0.0383| 0.2806| 0.1126|  15.2772|   19.6337| 0.0841|   0.1366|   0.0189|
|Lak     |Lak_Buck_pond           | 0.0357| 0.1045| 0.6141|  39.3861|  140.1980| 0.0904|   0.3417|   0.0400|
|Lak     |Lak_Burntbridge_lake    | 0.0317| 0.0794| 0.6234|  52.9901|  183.0495| 0.0652|   0.3991|   0.0007|
|Lak     |Lak_Cascade_lake        | 0.0288| 0.0857| 0.7663|  35.0594|  111.2871| 0.0905|   0.3357|   0.0601|
|Lak     |Lak_Chub_lake           | 0.0797| 0.2744| 0.5189|  36.0099|   83.0990| 0.0641|   0.2906|   0.0007|
|Lak     |Lak_Chub_pond           | 0.0239| 0.0503| 0.3548|  49.7426|  196.7723| 0.0795|   0.4749|   0.4495|
|Lak     |Lak_Connera_lake        | 0.0152| 0.0280| 0.6940|  64.7723|  290.7030| 0.0693|   0.5447|   0.2997|
|Lak     |Lak_Constable_lake      | 0.0505| 0.1934| 0.6342|  31.8317|   60.6040| 0.0598|   0.2611|   0.0066|
|Lak     |Lak_Deep_lake           | 0.0257| 0.1429| 0.7522|  19.0198|   28.2376| 0.0781|   0.1800|   0.0065|
|Lak     |Lak_Emerald_lake        | 0.0109| 0.0562| 0.8963|  21.2970|   50.6535| 0.1117|   0.1946|   0.0752|
|Lak     |Lak_Falls_lake          | 0.0357| 0.1045| 0.6141|  39.3861|  140.1980| 0.0904|   0.3417|   0.0962|
|Lak     |Lak_Fawn_lake           | 0.0122| 0.0438| 0.2648|  32.5347|  106.0396| 0.1002|   0.2794|   0.1600|
|Lak     |Lak_Federation_lake     | 0.0109| 0.0562| 0.8963|  21.2970|   50.6535| 0.1117|   0.1946|   0.0608|
|Lak     |Lak_Goose_lake          | 0.1494| 0.4863| 0.2929|  39.9406|   97.5050| 0.0611|   0.3071|   0.0026|
|Lak     |Lak_Grass_lake          | 0.0251| 0.0612| 0.6190|  42.9901|  155.2574| 0.0840|   0.4101|   0.0271|
|Lak     |Lak_Gull_lake           | 0.0251| 0.0612| 0.6190|  42.9901|  155.2574| 0.0840|   0.4101|   0.2026|
|Lak     |Lak_Gull_lake_north     | 0.0690| 0.4868| 0.8885|  16.0198|   25.0198| 0.0975|   0.1417|   0.0021|
|Lak     |Lak_Helldiver_pond      | 0.0357| 0.1045| 0.6141|  39.3861|  140.1980| 0.0904|   0.3417|   0.1084|
|Lak     |Lak_High_pond           | 0.0102| 0.0495| 0.3734|  22.1188|   51.9604| 0.1062|   0.2058|   0.3070|
|Lak     |Lak_Hoel_lake           | 0.0179| 0.0323| 0.3971|  69.2970|  321.3267| 0.0669|   0.5533|   0.3943|
|Lak     |Lak_Horseshoe_Lake      | 0.0239| 0.0503| 0.3548|  49.7426|  196.7723| 0.0795|   0.4749|   0.2517|
|Lak     |Lak_Indian_Lake         | 0.0380| 0.1501| 0.5492|  34.2673|   97.7327| 0.0832|   0.2535|   0.0209|
|Lak     |Lak_Little_Rainbow_Lake | 0.0239| 0.0503| 0.3548|  49.7426|  196.7723| 0.0795|   0.4749|   0.1365|
|Lak     |Lak_Long_Lake           | 0.0152| 0.0280| 0.6940|  64.7723|  290.7030| 0.0693|   0.5447|   0.2980|
|Lak     |Lak_Loon_Lake           | 0.0288| 0.0857| 0.7663|  35.0594|  111.2871| 0.0905|   0.3357|   0.0601|
|Lak     |Lak_Lost_Lake           | 0.0122| 0.0438| 0.2648|  32.5347|  106.0396| 0.1002|   0.2794|   0.3530|
|Lak     |Lak_Lost_Lake_East      | 0.0151| 0.0503| 0.3573|  40.0891|  129.9703| 0.0809|   0.2991|   0.0235|
|Lak     |Lak_Lower_Sister_Lake   | 0.0288| 0.0857| 0.7663|  35.0594|  111.2871| 0.0905|   0.3357|   0.2360|
|Lak     |Lak_Oswego_Lake         | 0.0122| 0.0438| 0.2648|  32.5347|  106.0396| 0.1002|   0.2794|   0.2099|
|Lak     |Lak_Owl_Lake            | 0.0476| 0.2041| 0.5382|  29.9901|   70.9109| 0.0788|   0.2334|   0.0007|
|Lak     |Lak_Rat_Lake            | 0.0239| 0.0503| 0.3548|  49.7426|  196.7723| 0.0795|   0.4749|   0.2718|
|Lak     |Lak_Razorback_Lake      | 0.0357| 0.1045| 0.6141|  39.3861|  140.1980| 0.0904|   0.3417|   0.1258|
|Lak     |Lak_Rock_Lake           | 0.0655| 0.3465| 0.7131|  22.0099|   42.9505| 0.0887|   0.1890|   0.0021|
|Lak     |Lak_Russian_Lake        | 0.0400| 0.1631| 0.6934|  23.9703|   58.0099| 0.1010|   0.2453|   0.0467|
|Lak     |Lak_Safford_Lake        | 0.0251| 0.0612| 0.6190|  42.9901|  155.2574| 0.0840|   0.4101|   0.2781|
|Lak     |Lak_Sand_Lake           | 0.0246| 0.1060| 0.4420|  28.1881|   77.7030| 0.0978|   0.2323|   0.0282|
|Lak     |Lak_South_Lake          | 0.0418| 0.2388| 0.6839|  22.2574|   36.7624| 0.0742|   0.1751|   0.0119|
|Lak     |Lak_Squaw_Lake          | 0.0357| 0.1045| 0.6141|  39.3861|  140.1980| 0.0904|   0.3417|   0.1084|
|Lak     |Lak_Stink_Lake          | 0.0239| 0.0503| 0.3548|  49.7426|  196.7723| 0.0795|   0.4749|   0.2140|
|Lak     |Lak_Twelfth_Tee_Lake    | 0.0496| 0.2142| 0.3354|  31.0693|   82.0297| 0.0850|   0.2317|   0.0162|
|Lak     |Lak_Twin_Lake_East      | 0.0163| 0.1425| 0.8147|  12.9604|   17.0198| 0.1013|   0.1145|   0.0079|
|Lak     |Lak_Twin_Lake_West      | 0.0253| 0.0919| 0.8725|  26.0000|   59.9307| 0.0887|   0.2749|   0.0012|
|Lak     |Lak_Whipple_Lake        | 0.0122| 0.0438| 0.2648|  32.5347|  106.0396| 0.1002|   0.2794|   0.2463|
|Lak     |Lak_Wolf_Lake           | 0.0154| 0.0668| 0.5350|  26.7624|   41.0495| 0.0573|   0.2299|   0.0102|

Table: Metaweb assembly model best fit of the local food webs for the 3 metawebs: Ant= Antarctic, Isl=Islands, Lak=Lakes.  Where $c$ is the colonization parameter, $e$ the extinction rate and $se$ the secondary extinction rate. S is the number of species, L the number of links, and C the connectance averaged over the last 100 time steps. $\alpha = c/e$ is the hypothesized distance to main land, and the *distance* the relative distance to the empirical values. 


----------------------------------------------------
**Network**            Potter    Weddell    Meta-web
----------------- ----------- ---------- -----------
**SWness**             2.75*       4.69*      10.87*

SWness 99%CI           2.07       2.27       1.71

     **Q**          0.5319*      0.4508*     0.7037*   

Q low  CI            2.9321      5.5191     18.8128  

Q high CI         113.5195    36.8783     67.2631  

**Mean Trophic      2.1289*     1.9831*    1.9119*   
Level**

 T.L. low CI        5.4838     29.3569    387.5446  

 T.L  high CI      2010.8165   915.9291   4364.5925 


 **Modularity**    0.3720      0.4784*    0.4456*   

 MO Low CI         0.3389      0.3491     0.2207   

 MO high CI        0.3755      0.3620     0.2259   

----------------------------------------------------
Table: Empirical Small-world-ness (SWness), coherence (Q), mean trophic level and modularity, with 99% confidence intervals based on 1000 random networks. Quantities marked with '*' are significant at 1% level.

-----------------------------------
**Network**        Potter   Weddell  
---------------- -------- --------- 
**SWness**          0.42       0.21

SWness 99%CI        2.53       1.14

     **Q**        0.5319   0.4508*   

  Q low CI        0.2647   0.5102   

  Q high CI       1.1485   0.8035   

 Q z-score        -0.20      -3.41 
   
**Mean trophic    2.1289   1.9831   
  Level** 

T.L. low CI       1.5911   1.7635   

T.L. high CI      2.5568   2.0977   

T.L. z-score      1.29       1.09


 **Modularity**   0.3720   0.4784   

MO low CI         0.2670   0.3768   

MO high CI        0.6142   0.5299   

MO z-score        -0.98       1.03  
------------------------------------
Table: Small-world-ness (SWness), coherence (Q), mean trophic level and modularity with 99% confidence intervals and z-scores based on 1000 networks generated by the metaweb assembly model. Quantities marked with '*' are significant at 1% level.


-----------------------------------------------
**Network**       Potter    Weddell    Meta-web
                    Cove        Sea
-------------- --------- ---------- -----------
**EC**              830*     42210*     285866*   

EC low CI             383       3832      44173 

EC high CI            510       4155      45468 

EC z-score       15.4971   592.2163   945.5640 

**AC**             1983*      7842*     126552*   

AC low CI            387       3828       44280     

AC high CI           508       4160       45488     

AC z-score       63.2947   58.4367    320.3600

**TT**              578*      3101*      61739*   

TT low CI            780       7729       88707     

TT high CI           975       8231       90724     

TT z-score      -7.8152   -48.7765    -69.3458 

**OM**              12*       892*       36423*   

OM low CI            20         57        1033    

OM high CI           51        104        1198 

OM z-score      15.3853   89.3244    1022.2137
-----------------------------------------------
Table: Motif counts for the empirical networks and 99% confidence intervals based on 1000 random networks. Where EC is exploitative competition, AC apparent competition, TT tri-trophic chain and OM is omnivory. Quantities marked with '*' are significant at 1% level.

\newpage

----------------------------------
**Network**       Potter   Weddell
                    Cove       Sea
-------------- --------- --------- 
   **EC**        830      42210   

  EC low CI     170.88    15476.69 

  EC high CI    3781.58   54200.32 

  EC z-score     -0.73      1.41   

   **AC**       1983*      7842   

  AC low CI     104.00    7283.44  

  AC high CI    1780.11   22753.16 

  AC z-score     4.86      -1.94   

   **TT**        578       3101*   

  TT low CI      11.97    3127.93  

  TT high CI    996.10    11868.91 

  TT z-score     1.43      -2.28   

   **OM**        124       892*    

  OM low CI       1.0      1362.8  

  OM high CI    730.02    7866.68  

  OM z-score    -0.44     -2.47   
----------------------------------
Table: Motif counts for the empirical networks and 99% confidence intervals based on 1000 meta-web assembly model networks. Where EC is exploitative competition, AC apparent competition, TT tri-trophic chain and OM is omnivory. Quantities marked with '*' are significant at 1% level.



\newpage

----------------------------------------------------------------------------------
Type      Network         Tropho-species            Preys   Predators      Trophic 
                                                                             Level 
--------- ---------- ---------------------------- ------- ----------- ------------
  hubcon    Potter      Notothenia coriiceps        49         0          2.86    

  hubcon   Weddell       Ophiosparte gigas          280       21          3.43    

  hubcon   Weddell     Eunoe spica spicoides        185       64          3.94    

  hubcon   Meta-web      Ophiosparte gigas          301       21          3.35    

  hubcon   Meta-web      Eurythenes gryllus         184       64          3.45    

  modhub   Weddell         Phytodetritus             0        226          1      

  modhub   Weddell       Harmothoe spinosa          148       64          3.72    

  modhub   Weddell          Eunoe spica             146       68          4.04    

  modhub   Meta-web        Phytodetritus             0        226          1      

  modhub   Meta-web          Oncaea sp.              0        120          1      

  modhub   Meta-web           Detritus               0        182          1      

  modhub   Meta-web      Calanoides acutus          101       194         2.19    

  modhub   Meta-web         Oithona sp.              6        121         2.25    

  modhub   Meta-web      Metridia gerlachei         116       196         2.33    

  modhub   Meta-web    Pelagobia longicirrata       92        147         2.36    

  modhub   Meta-web      Euphausia superba          115       199         2.38    

  modhub   Meta-web       Eukrohnia hamata          41        138         2.63    

  modhub   Meta-web    Pseudosagitta gazellae       41        88          2.63    

  modhub   Meta-web          Salpa sp.              42        118         2.64    

  modhub   Meta-web     Electrona antarctica        103       60          2.66    

  modhub   Meta-web    Trematomus bernacchii        170       29          3.12    

  modhub   Meta-web       Waldeckia obesa           159       51          3.49    

  modhub   Meta-web      Harmothoe spinosa          153       64          3.68    

  modhub   Meta-web    Harmothoe crosetensis        109       64          3.69    

  modhub   Meta-web      Harmotoe hartmanae         106       64          3.73    

  modhub   Meta-web    Eunoe spica spicoides        191       64          3.85    

  modhub   Meta-web         Eunoe spica             150       69          3.93    

  modhub   Meta-web     Trematomus pennellii        174       26          3.95    

  modhub   Meta-web   Abyssorchomene nodimanus      89        48          4.07    
-------------------------------------------------------------------------------

Table: Topological roles and trophic level of tropho-species with high number of links (Preys and Predators) . Hub connectors (hubcon) have a high number of between module links; and module hubs (modhub) have a high number of links inside its module. Tropho-species with trophic level 1 could be detritus, autotrophs, or aggregated nodes of preys. 

![The four three-species sub-networks analysed: apparent competition, exploitative competition, tri-trophic chain, and omnivory. These four sub-networks have been explored both theoretically and empirically in ecological networks and are the most common sub-networks found in food webs](Figures/Fig1Motifs.png)


![Topological roles with 95% confidence intervals by Network. *Meta-web* represent the marine predator-prey relationships of Antarctica (34.8 million Km^2^); the *Weddell Sea* (3.5 million Km^2^) and *Potter Cove* (6.8 Km^2^) are local food webs. A. Z-scores of four three node motif present in all the networks. Topological roles are based in within module degree $dz$ and the participation coefficient $PC$ that measures among module connectivity.](Figures/TopoRolesCI_ByNetwork.png){ width=80% }


## Bibliography

