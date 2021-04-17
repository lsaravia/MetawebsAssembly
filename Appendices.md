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

Then we used the parameters with the minimal distance to simulate the model and compare with the network metrics explained in the main text. The results with the fitted models is presented in the table S2. 


| Parameter   |      |    |
|:------------|-----:|---:|
|$c$          | 0.010| 0.3|
|$e$          | 0.001| 0.5|
|$se$         | 0.100| 0.9|

Table: Range of parameters used in latin hypercubic sampling to simulate the metaweb assembly model 

As an adittional validation of the model we performed simulations using the fitted parameters and checked than the number of species $S$ and connectance $C$ of the empirical food webs where inside the 99% CI generated with 1000 simulations of the model (Table S4). Only in two cases (Bridge_brook_lake, Lak_Chub_pond) the connectance is higher than the CI. 



\newpage


\scriptsize

|Metaweb |Network             |    $c$|    $e$|   $se$|        S|         L|      C| $\alpha$| distance|
|:-------|:-------------------|------:|------:|------:|--------:|---------:|------:|--------:|--------:|
|Ant     |Potter              | 0.0188| 0.0552| 0.7648|  93.5050|  346.0792| 0.0396|   0.3412|   0.0349|
|Ant     |Weddell             | 0.0271| 0.0164| 0.1016| 450.3663| 2312.5446| 0.0114|   1.6509|   0.0973|
|Isl     |FloridaIslandE1     | 0.0837| 0.0011| 0.7574| 208.3069| 3516.1188| 0.0810|  74.3415|   0.0089|
|Isl     |FloridaIslandE2     | 0.1930| 0.4310| 0.1386|  58.8713|  297.5743| 0.0859|   0.4477|   0.0037|
|Isl     |FloridaIslandE3     | 0.2467| 0.0015| 0.1536| 210.1386| 3641.1188| 0.0825| 165.8384|   0.0041|
|Isl     |FloridaIslandE7     | 0.1099| 0.2167| 0.4400|  54.0297|  301.1386| 0.1032|   0.5069|   0.0008|
|Isl     |FloridaIslandE9     | 0.1288| 0.2053| 0.7716|  55.8812|  358.7921| 0.1149|   0.6276|   0.0028|
|Lak     |Alford_lake         | 0.0375| 0.0735| 0.7522|  56.5545|  224.9406| 0.0703|   0.5095|   0.0102|
|Lak     |Balsam_lake         | 0.0239| 0.0503| 0.3548|  49.7426|  196.7723| 0.0795|   0.4749|   0.2383|
|Lak     |Beaver_lake         | 0.0163| 0.0363| 0.4049|  52.3366|  210.6634| 0.0769|   0.4492|   0.1167|
|Lak     |Big_hope_lake       | 0.0160| 0.0390| 0.5759|  56.1287|  236.4752| 0.0751|   0.4094|   0.1686|
|Lak     |Brandy_lake         | 0.0122| 0.0438| 0.2648|  32.5347|  106.0396| 0.1002|   0.2794|   0.2685|
|Lak     |Bridge_brook_lake   | 0.0221| 0.0304| 0.2525|  76.6040|  388.0594| 0.0661|   0.7284|   0.3280|
|Lak     |Brook_trout_lake    | 0.0383| 0.2806| 0.1126|  15.2772|   19.6337| 0.0841|   0.1366|   0.0189|
|Lak     |Buck_pond           | 0.0357| 0.1045| 0.6141|  39.3861|  140.1980| 0.0904|   0.3417|   0.0400|
|Lak     |Burntbridge_lake    | 0.0317| 0.0794| 0.6234|  52.9901|  183.0495| 0.0652|   0.3991|   0.0007|
|Lak     |Cascade_lake        | 0.0288| 0.0857| 0.7663|  35.0594|  111.2871| 0.0905|   0.3357|   0.0601|
|Lak     |Chub_lake           | 0.0797| 0.2744| 0.5189|  36.0099|   83.0990| 0.0641|   0.2906|   0.0007|
|Lak     |Chub_pond           | 0.0239| 0.0503| 0.3548|  49.7426|  196.7723| 0.0795|   0.4749|   0.4495|
|Lak     |Connera_lake        | 0.0152| 0.0280| 0.6940|  64.7723|  290.7030| 0.0693|   0.5447|   0.2997|
|Lak     |Constable_lake      | 0.0505| 0.1934| 0.6342|  31.8317|   60.6040| 0.0598|   0.2611|   0.0066|
|Lak     |Deep_lake           | 0.0257| 0.1429| 0.7522|  19.0198|   28.2376| 0.0781|   0.1800|   0.0065|
|Lak     |Emerald_lake        | 0.0109| 0.0562| 0.8963|  21.2970|   50.6535| 0.1117|   0.1946|   0.0752|
|Lak     |Falls_lake          | 0.0357| 0.1045| 0.6141|  39.3861|  140.1980| 0.0904|   0.3417|   0.0962|
|Lak     |Fawn_lake           | 0.0122| 0.0438| 0.2648|  32.5347|  106.0396| 0.1002|   0.2794|   0.1600|
|Lak     |Federation_lake     | 0.0109| 0.0562| 0.8963|  21.2970|   50.6535| 0.1117|   0.1946|   0.0608|
|Lak     |Goose_lake          | 0.1494| 0.4863| 0.2929|  39.9406|   97.5050| 0.0611|   0.3071|   0.0026|
|Lak     |Grass_lake          | 0.0251| 0.0612| 0.6190|  42.9901|  155.2574| 0.0840|   0.4101|   0.0271|
|Lak     |Gull_lake           | 0.0251| 0.0612| 0.6190|  42.9901|  155.2574| 0.0840|   0.4101|   0.2026|
|Lak     |Gull_lake_north     | 0.0690| 0.4868| 0.8885|  16.0198|   25.0198| 0.0975|   0.1417|   0.0021|
|Lak     |Helldiver_pond      | 0.0357| 0.1045| 0.6141|  39.3861|  140.1980| 0.0904|   0.3417|   0.1084|
|Lak     |High_pond           | 0.0102| 0.0495| 0.3734|  22.1188|   51.9604| 0.1062|   0.2058|   0.3070|
|Lak     |Hoel_lake           | 0.0179| 0.0323| 0.3971|  69.2970|  321.3267| 0.0669|   0.5533|   0.3943|
|Lak     |Horseshoe_Lake      | 0.0239| 0.0503| 0.3548|  49.7426|  196.7723| 0.0795|   0.4749|   0.2517|
|Lak     |Indian_Lake         | 0.0380| 0.1501| 0.5492|  34.2673|   97.7327| 0.0832|   0.2535|   0.0209|
|Lak     |Little_Rainbow_Lake | 0.0239| 0.0503| 0.3548|  49.7426|  196.7723| 0.0795|   0.4749|   0.1365|
|Lak     |Long_Lake           | 0.0152| 0.0280| 0.6940|  64.7723|  290.7030| 0.0693|   0.5447|   0.2980|
|Lak     |Loon_Lake           | 0.0288| 0.0857| 0.7663|  35.0594|  111.2871| 0.0905|   0.3357|   0.0601|
|Lak     |Lost_Lake           | 0.0122| 0.0438| 0.2648|  32.5347|  106.0396| 0.1002|   0.2794|   0.3530|
|Lak     |Lost_Lake_East      | 0.0151| 0.0503| 0.3573|  40.0891|  129.9703| 0.0809|   0.2991|   0.0235|
|Lak     |Lower_Sister_Lake   | 0.0288| 0.0857| 0.7663|  35.0594|  111.2871| 0.0905|   0.3357|   0.2360|
|Lak     |Oswego_Lake         | 0.0122| 0.0438| 0.2648|  32.5347|  106.0396| 0.1002|   0.2794|   0.2099|
|Lak     |Owl_Lake            | 0.0476| 0.2041| 0.5382|  29.9901|   70.9109| 0.0788|   0.2334|   0.0007|
|Lak     |Rat_Lake            | 0.0239| 0.0503| 0.3548|  49.7426|  196.7723| 0.0795|   0.4749|   0.2718|
|Lak     |Razorback_Lake      | 0.0357| 0.1045| 0.6141|  39.3861|  140.1980| 0.0904|   0.3417|   0.1258|
|Lak     |Rock_Lake           | 0.0655| 0.3465| 0.7131|  22.0099|   42.9505| 0.0887|   0.1890|   0.0021|
|Lak     |Russian_Lake        | 0.0400| 0.1631| 0.6934|  23.9703|   58.0099| 0.1010|   0.2453|   0.0467|
|Lak     |Safford_Lake        | 0.0251| 0.0612| 0.6190|  42.9901|  155.2574| 0.0840|   0.4101|   0.2781|
|Lak     |Sand_Lake           | 0.0246| 0.1060| 0.4420|  28.1881|   77.7030| 0.0978|   0.2323|   0.0282|
|Lak     |South_Lake          | 0.0418| 0.2388| 0.6839|  22.2574|   36.7624| 0.0742|   0.1751|   0.0119|
|Lak     |Squaw_Lake          | 0.0357| 0.1045| 0.6141|  39.3861|  140.1980| 0.0904|   0.3417|   0.1084|
|Lak     |Stink_Lake          | 0.0239| 0.0503| 0.3548|  49.7426|  196.7723| 0.0795|   0.4749|   0.2140|
|Lak     |Twelfth_Tee_Lake    | 0.0496| 0.2142| 0.3354|  31.0693|   82.0297| 0.0850|   0.2317|   0.0162|
|Lak     |Twin_Lake_East      | 0.0163| 0.1425| 0.8147|  12.9604|   17.0198| 0.1013|   0.1145|   0.0079|
|Lak     |Twin_Lake_West      | 0.0253| 0.0919| 0.8725|  26.0000|   59.9307| 0.0887|   0.2749|   0.0012|
|Lak     |Whipple_Lake        | 0.0122| 0.0438| 0.2648|  32.5347|  106.0396| 0.1002|   0.2794|   0.2463|
|Lak     |Wolf_Lake           | 0.0154| 0.0668| 0.5350|  26.7624|   41.0495| 0.0573|   0.2299|   0.0102|

Table: Metaweb assembly model best fit of the local food webs for the 3 metawebs: Ant= Antarctic, Isl=Islands, Lak=Lakes.  Where $c$ is the colonization parameter, $e$ the extinction rate and $se$ the secondary extinction rate. S is the number of species, L the number of links, and C the connectance averaged over the last 100 time steps. $\alpha = c/e$ is the hypothesized distance to main land, and the *distance* the relative distance to the empirical values. 



|Metaweb |Network             | Size| Links| Connectance|      Q|     TL|         MO|   MEing|
|:-------|:-------------------|----:|-----:|-----------:|------:|------:|----------:|-------:|
|Ant     |Potter              |   92|   325|      0.0384| 0.5230| 2.1414|     0.3601|  2.1620|
|Ant     |Weddell             |  435|  1978|      0.0105| 0.5829| 2.7908|     0.4586|  3.6264|
|Ant     |Meta                |  846|  6897|      0.0096| 0.7696| 2.2423|     0.4786|  6.7254|
|Isl     |FloridaIslandE2     |   59|   298|      0.0856| 0.7435| 2.6151|     0.3033|  4.1721|
|Isl     |FloridaIslandE7     |   54|   301|      0.1032| 0.6624| 2.7613|     0.2907|  3.2048|
|Isl     |FloridaIslandE9     |   56|   361|      0.1151| 0.6234| 2.6898|     0.2639|  3.5945|
|Isl     |FloridaIslandE1     |  210|  3560|      0.0807| 0.7503| 2.7143|     0.2442|  7.3367|
|Isl     |FloridaIslandE3     |  211|  3671|      0.0825| 0.7559| 2.7204|     0.2407|  7.6195|
|Isl     |Meta                |  211|  8191|      0.1840| 1.4933| 2.7211|     0.1565|  7.6102|
|Lak     |Twin_Lake_East      |   13|    17|      0.1006| 0.3333| 1.4872|     0.3962| -0.1111|
|Lak     |Brook_trout_lake    |   15|    19|      0.0844| 0.3244| 1.5111|     0.2909| -0.1133|
|Lak     |Gull_lake_north     |   16|    25|      0.0977| 0.4121| 1.4732|     0.2960| -0.0735|
|Lak     |Deep_lake           |   19|    28|      0.0776| 0.3164| 1.3977|     0.3680| -0.0682|
|Lak     |South_Lake          |   22|    36|      0.0744| 0.0000| 1.4091|     0.3492|  0.0417|
|Lak     |Wolf_Lake           |   27|    42|      0.0576| 0.2583| 1.2798|     0.3759|  0.0100|
|Lak     |Rock_Lake           |   22|    43|      0.0888| 0.2859| 1.6201|     0.2750|  0.0069|
|Lak     |Federation_lake     |   22|    57|      0.1178| 0.3508| 1.7339|     0.3201|  0.5067|
|Lak     |Emerald_lake        |   22|    58|      0.1198| 0.4828| 1.6364|     0.2519|  0.9974|
|Lak     |Twin_Lake_West      |   26|    60|      0.0888| 0.1653| 1.4846|     0.3664|  0.0968|
|Lak     |Constable_lake      |   32|    61|      0.0596| 0.4090| 1.4107|     0.3671|  0.9281|
|Lak     |Russian_Lake        |   24|    61|      0.1059| 0.3269| 1.6815|     0.1983|  0.8123|
|Lak     |Owl_Lake            |   30|    71|      0.0789| 0.2010| 1.4212|     0.3929|  0.1351|
|Lak     |Sand_Lake           |   29|    82|      0.0975| 0.4567| 1.6248|     0.3412|  1.0770|
|Lak     |Chub_lake           |   36|    83|      0.0640| 0.4514| 1.4615|     0.3048|  1.1629|
|Lak     |Twelfth_Tee_Lake    |   31|    83|      0.0864| 0.4122| 1.5079|     0.3736|  0.8816|
|Lak     |High_pond           |   24|    87|      0.1510| 0.4843| 1.8835|     0.1904|  1.3283|
|Lak     |Goose_lake          |   40|    98|      0.0612| 0.4375| 1.4658|     0.3362|  1.5594|
|Lak     |Indian_Lake         |   35|   102|      0.0833| 0.2173| 1.4590|     0.3919|  0.2044|
|Lak     |Cascade_lake        |   35|   118|      0.0963| 0.3983| 1.6400|     0.3800|  1.3142|
|Lak     |Loon_Lake           |   35|   118|      0.0963| 0.4436| 1.6612|     0.1782|  1.4555|
|Lak     |Brandy_lake         |   30|   121|      0.1344| 0.4179| 1.9132|     0.1216|  1.7252|
|Lak     |Fawn_lake           |   32|   122|      0.1191| 0.3640| 1.7077|     0.2741|  1.4517|
|Lak     |Whipple_Lake        |   32|   136|      0.1328| 0.4370| 1.9118|     0.2001|  1.9576|
|Lak     |Lost_Lake_East      |   41|   137|      0.0815| 0.2734| 1.5691|     0.4095|  1.2536|
|Lak     |Oswego_Lake         |   33|   138|      0.1267| 0.3659| 1.6789|     0.3235|  1.2401|
|Lak     |Lost_Lake           |   31|   148|      0.1540| 0.3244| 1.8110|     0.2510|  1.1592|
|Lak     |Falls_lake          |   39|   152|      0.0999| 0.2954| 1.6161|     0.3476|  1.2022|
|Lak     |Buck_pond           |   41|   153|      0.0910| 0.1974| 1.5301|     0.3843|  0.8899|
|Lak     |Lower_Sister_Lake   |   37|   161|      0.1176| 0.4090| 1.7332|     0.2442|  1.9143|
|Lak     |Grass_lake          |   44|   165|      0.0852| 0.3979| 1.6423|     0.2957|  1.6909|
|Lak     |Helldiver_pond      |   41|   169|      0.1005| 0.3787| 1.5881|     0.2446|  1.3853|
|Lak     |Squaw_Lake          |   41|   169|      0.1005| 0.4095| 1.4870|     0.3289|  1.9185|
|Lak     |Razorback_Lake      |   42|   179|      0.1015| 0.3945| 1.6875|     0.3233|  1.9132|
|Lak     |Burntbridge_lake    |   53|   183|      0.0651| 0.3144| 1.4920|     0.4176|  1.5863|
|Lak     |Gull_lake           |   45|   212|      0.1047| 0.3556| 1.7135|     0.2466|  1.9865|
|Lak     |Alford_lake         |   56|   220|      0.0702| 0.3601| 1.6862|     0.2918|  2.4132|
|Lak     |Safford_Lake        |   44|   225|      0.1162| 0.4022| 1.7549|     0.2759|  2.0719|
|Lak     |Little_Rainbow_Lake |   52|   247|      0.0913| 0.2850| 1.6843|     0.2011|  1.8721|
|Lak     |Horseshoe_Lake      |   49|   255|      0.1062| 0.4321| 1.8225|     0.3715|  2.4551|
|Lak     |Balsam_lake         |   50|   261|      0.1044| 0.4118| 1.5782|     0.3186|  2.4367|
|Lak     |Beaver_lake         |   56|   267|      0.0851| 0.4260| 1.6498|     0.3591|  2.4421|
|Lak     |Rat_Lake            |   50|   273|      0.1092| 0.4439| 1.7768|     0.2902|  2.4133|
|Lak     |Stink_Lake          |   53|   281|      0.1000| 0.3520| 1.7028|     0.3394|  2.5287|
|Lak     |Big_hope_lake       |   61|   328|      0.0881| 0.3900| 1.7390|     0.3733|  2.1956|
|Lak     |Chub_pond           |   54|   416|      0.1427| 0.4217| 1.9247|     0.1665|  3.4521|
|Lak     |Long_Lake           |   65|   417|      0.0987| 0.4685| 1.7713|     0.2763|  3.5007|
|Lak     |Connera_lake        |   65|   418|      0.0989| 0.4005| 1.6924|     0.3871|  2.9254|
|Lak     |Bridge_brook_lake   |   75|   553|      0.0983| 0.3748| 1.6389|     0.3702|  3.6464|
|Lak     |Hoel_lake           |   72|   571|      0.1101| 0.4130| 1.8399|     0.3086|  3.4722|
|Lak     |Meta                |  211|  8426|      0.1893| 3.3100| 1.6677|     0.1549|  4.7178|

Table: Topological metrics of all empirical food webs including metawebs. Where **Ant** is The Antarctic, **Lak** the Lakes, **Isl** the islands metaweb, Size is the number of species $S$, Links is the number of trophic links $L$; Connectance $C$, trophic coherence $Q$, mean trophic level $TL$, Modularity $MO$, and mean maximal eingenvalue $MEing$ are network metrics explained in the main text. 




|Metaweb |Network             | $S$ |$S_{low}$|$S_{high}$| $C$  | $C_{low}$|$C_{high}$|$TL$|$TL_{low}$|$TL_{high}$|
|:------:|:-------------------|----:|-------:|-------:|--------:|------:|------:|------:|------:|------:|
|Ant     |Potter              |   92|  53.000| 168.005|   0.0383| 0.0157| 0.0714| 2.1414| 1.6182| 2.4766|
|Ant     |Weddell             |  435| 339.975| 511.005|   0.0104| 0.0099| 0.0184| 2.7908*| 1.8504| 2.3804|
|Isl     |FloridaIslandE1     |  210| 154.000| 211.000|   0.0807| 0.0787| 0.0943| 2.7142| 2.5695| 2.9814|
|Isl     |FloridaIslandE2     |   59|  42.000|  77.005|   0.0856| 0.0545| 0.1332| 2.6150| 1.3998| 2.7726|
|Isl     |FloridaIslandE3     |  211| 193.995| 211.000|   0.0824| 0.0792| 0.0862| 2.7203| 2.3401| 2.7678|
|Isl     |FloridaIslandE7     |   54|  32.990|  76.000|   0.1032| 0.0573| 0.1678| 2.7613| 1.4793| 3.2593|
|Isl     |FloridaIslandE9     |   56|  34.000|  85.005|   0.1151| 0.0633| 0.1756| 2.6898| 1.5922| 3.4873|
|Lak     |Alford_lake         |   56|  26.990|  81.005|   0.0701| 0.0354| 0.1289| 1.6861| 1.3312| 2.0473|
|Lak     |Balsam_lake         |   50|  25.985|  78.000|   0.1044| 0.0337| 0.1376| 1.5782| 1.2930| 2.0869|
|Lak     |Beaver_lake         |   56|  20.990|  75.005|   0.0851| 0.0329| 0.1355| 1.6498| 1.2753| 2.0905|
|Lak     |Big_hope_lake       |   61|  16.980|  74.005|   0.0881| 0.0349| 0.1479| 1.7390| 1.2488| 2.1694|
|Lak     |Brandy_lake         |   30|   7.995|  53.015|   0.1344| 0.0377| 0.2200| 1.9132| 1.1576| 2.2326|
|Lak     |Bridge_brook_lake   |   75|  48.995| 103.000|   0.0983*| 0.0339| 0.0825| 1.6388| 1.3173| 1.9404|
|Lak     |Brook_trout_lake    |   15|   2.000|  33.000|   0.0844| 0.0452| 0.4286| 1.5111| 1.0908| 2.2593|
|Lak     |Buck_pond           |   41|  13.995|  63.000|   0.0910| 0.0372| 0.1824| 1.5300| 1.1973| 2.1673|
|Lak     |Burntbridge_lake    |   53|  19.000|  71.000|   0.0651| 0.0346| 0.1496| 1.4920| 1.2457| 2.2135|
|Lak     |Cascade_lake        |   35|  12.995|  63.000|   0.0963| 0.0366| 0.1937| 1.6399| 1.2352| 2.2246|
|Lak     |Chub_lake           |   36|  10.995|  56.005|   0.0640| 0.0363| 0.1625| 1.4614| 1.1763| 2.1540|
|Lak     |Chub_pond           |   54|  25.000|  78.005|   0.1426*| 0.0330| 0.1193| 1.9247| 1.2801| 2.0316|
|Lak     |Connera_lake        |   65|  29.995|  85.010|   0.0989| 0.0343| 0.1095| 1.6924| 1.3284| 2.0172|
|Lak     |Constable_lake      |   32|   9.000|  55.000|   0.0595| 0.0382| 0.2200| 1.4107| 1.1499| 2.2153|
|Lak     |Deep_lake           |   19|   2.000|  38.000|   0.0775| 0.0411| 0.5000| 1.3976| 1.0908| 2.4574|
|Lak     |Emerald_lake        |   22|   2.000|  39.005|   0.1198| 0.0362| 0.3601| 1.6363| 1.0587| 2.4061|
|Lak     |Falls_lake          |   39|  13.995|  62.005|   0.0999| 0.0350| 0.1856| 1.6161| 1.2083| 2.1627|
|Lak     |Fawn_lake           |   32|   7.995|  56.000|   0.1191| 0.0356| 0.2000| 1.7077| 1.1666| 2.2092|
|Lak     |Federation_lake     |   22|   1.000|  40.005|   0.1177| 0.0000| 0.3333| 1.7339| 1.0000| 2.4278|
|Lak     |Goose_lake          |   40|  15.000|  61.000|   0.0612| 0.0340| 0.1543| 1.4657| 1.1814| 2.0956|
|Lak     |Grass_lake          |   44|  17.995|  70.005|   0.0852| 0.0365| 0.1412| 1.6422| 1.2996| 2.1481|
|Lak     |Gull_lake           |   45|  23.000|  71.005|   0.1046| 0.0353| 0.1403| 1.7135| 1.2528| 2.1865|
|Lak     |Gull_lake_north     |   16|   2.000|  34.000|   0.0976| 0.0454| 0.5000| 1.4732| 1.0869| 2.3125|
|Lak     |Helldiver_pond      |   41|  12.990|  63.000|   0.1005| 0.0353| 0.1701| 1.5881| 1.2209| 2.1819|
|Lak     |High_pond           |   24|   3.000|  42.005|   0.1510| 0.0404| 0.3333| 1.8835| 1.0999| 2.5004|
|Lak     |Hoel_lake           |   72|  34.980|  87.000|   0.1101| 0.0352| 0.1158| 1.8399| 1.3094| 2.0960|
|Lak     |Horseshoe_Lake      |   49|  23.000|  78.010|   0.1062| 0.0315| 0.1296| 1.8224| 1.2894| 2.1229|
|Lak     |Indian_Lake         |   35|   8.995|  51.000|   0.0832| 0.0366| 0.2133| 1.4590| 1.1817| 2.2074|
|Lak     |Little_Rainbow_Lake |   52|  26.000|  80.000|   0.0913| 0.0356| 0.1332| 1.6843| 1.2939| 2.0364|
|Lak     |Long_Lake           |   65|  31.995|  86.005|   0.0986| 0.0345| 0.1045| 1.7713| 1.3364| 2.0960|
|Lak     |Loon_Lake           |   35|  11.995|  62.000|   0.0963| 0.0347| 0.1944| 1.6612| 1.1578| 2.3640|
|Lak     |Lost_Lake           |   31|   7.990|  54.005|   0.1540| 0.0386| 0.2400| 1.8109| 1.1630| 2.3057|
|Lak     |Lost_Lake_East      |   41|  10.990|  57.025|   0.0814| 0.0366| 0.1769| 1.5691| 1.1904| 2.2217|
|Lak     |Lower_Sister_Lake   |   37|  13.995|  63.005|   0.1176| 0.0334| 0.1901| 1.7332| 1.1773| 2.2070|
|Lak     |Oswego_Lake         |   33|   8.995|  54.005|   0.1267| 0.0381| 0.2100| 1.6789| 1.1175| 2.2125|
|Lak     |Owl_Lake            |   30|   6.000|  48.000|   0.0788| 0.0394| 0.2500| 1.4212| 1.1666| 2.3150|
|Lak     |Rat_Lake            |   50|  26.985|  80.000|   0.1092| 0.0335| 0.1234| 1.7767| 1.3029| 2.0791|
|Lak     |Razorback_Lake      |   42|  11.995|  61.005|   0.1014| 0.0335| 0.1611| 1.6875| 1.1874| 2.1844|
|Lak     |Rock_Lake           |   22|   3.995|  43.005|   0.0888| 0.0425| 0.3125| 1.6201| 1.0833| 2.4286|
|Lak     |Russian_Lake        |   24|   6.990|  48.000|   0.1059| 0.0400| 0.2231| 1.6815| 1.0909| 2.2801|
|Lak     |Safford_Lake        |   44|  20.000|  73.005|   0.1162| 0.0344| 0.1384| 1.7549| 1.2662| 2.1500|
|Lak     |Sand_Lake           |   29|   6.000|  46.015|   0.0975| 0.0384| 0.2422| 1.6248| 1.1110| 2.2941|
|Lak     |South_Lake          |   22|   2.000|  37.000|   0.0743| 0.0399| 0.4075| 1.4090| 1.0833| 2.2795|
|Lak     |Squaw_Lake          |   41|  12.000|  63.005|   0.1005| 0.0367| 0.1737| 1.4869| 1.1814| 2.2544|
|Lak     |Stink_Lake          |   53|  26.000|  79.000|   0.1000| 0.0365| 0.1291| 1.7028| 1.2808| 2.1233|
|Lak     |Twelfth_Tee_Lake    |   31|   6.000|  50.005|   0.0863| 0.0375| 0.2500| 1.5079| 1.1325| 2.2212|
|Lak     |Twin_Lake_East      |   13|   1.000|  25.005|   0.1005| 0.0000| 0.5628| 1.4871| 1.0000| 2.3750|
|Lak     |Twin_Lake_West      |   26|   7.995|  55.005|   0.0887| 0.0367| 0.2231| 1.4846| 1.1537| 2.2325|
|Lak     |Whipple_Lake        |   32|   8.000|  55.000|   0.1328| 0.0378| 0.2187| 1.9117| 1.1332| 2.2327|
|Lak     |Wolf_Lake           |   27|   4.990|  45.000|   0.0576| 0.0399| 0.3087| 1.2798| 1.1248| 2.3540|

Table: Empirical local foodweb values and 99% Confidence intervals for network properties: Number of species ($S$), connectance ($C$),  mean trophic level ($TL$), with 99% confidence intervals based on 1000 networks generated by the assembly model. 



|Metaweb |Network             |     $Q$| $Q_{low}$|$Q_{high}$| $MO$ |    $MO_{low}$| $MO_{high}$|    $MEing$| $MEing_{low}$| $MEing_{high}$|
|:-------|:-------------------|------:|------:|------:|----------:|-------:|------:|-------:|--------:|---------:|
|Ant     |Potter              | 0.5230| 0.3019| 0.8918|     0.3601|  0.3118| 0.6339|  2.1620|   0.4407|    3.8803|
|Ant     |Weddell             | 0.5829| 0.5670| 0.8380|     0.4586|  0.4204| 0.5507|  3.6264*|   3.6833|    5.9177|
|Isl     |FloridaIslandE1     | 0.7503| 0.7287| 1.0208|     0.2442|  0.2252| 0.2528|  7.3367|   7.1689|    7.6900|
|Isl     |FloridaIslandE2     | 0.7435| 0.4119| 1.2333|     0.3033|  0.1672| 0.4084|  4.1721|   1.6091|    5.1386|
|Isl     |FloridaIslandE3     | 0.7559| 0.7309| 0.9831|     0.2407|  0.2294| 0.2499|  7.6195|   7.2561|    7.7030|
|Isl     |FloridaIslandE7     | 0.6624| 0.4734| 2.1619|     0.2907|  0.1527| 0.4097|  3.2048|   1.5568|    5.2295|
|Isl     |FloridaIslandE9     | 0.6234| 0.4885| 2.4118|     0.2639|  0.1534| 0.3843|  3.5945|   1.9771|    5.4136|
|Lak     |Alford_lake         | 0.3601| 0.2169| 0.6585|     0.2918|  0.1708| 0.4529|  2.4132|   0.0830|    3.0660|
|Lak     |Balsam_lake         | 0.4118| 0.1981| 0.6184|     0.3186|  0.1897| 0.4592|  2.4367|   0.2034|    2.8791|
|Lak     |Beaver_lake         | 0.4260| 0.2306| 0.6756|     0.3591|  0.1859| 0.4806|  2.4421|  -0.0085|    3.0042|
|Lak     |Big_hope_lake       | 0.3900| 0.1709| 0.6692|     0.3733|  0.1671| 0.4846|  2.1956|  -0.0462|    2.7280|
|Lak     |Brandy_lake         | 0.4179| 0.0000| 0.7280|     0.1216|  0.0740| 0.4849|  1.7252|  -0.1697|    2.3065|
|Lak     |Bridge_brook_lake   | 0.3748| 0.2518| 0.5836|     0.3702|  0.2257| 0.4395|  3.6464*|   0.6357|    3.4227|
|Lak     |Brook_trout_lake    | 0.3244| 0.0000| 0.8165|     0.2909| -0.0050| 0.4765| -0.1133|  -0.4792|    1.7764|
|Lak     |Buck_pond           | 0.1974| 0.0000| 0.6726|     0.3843|  0.1583| 0.4802|  0.8899|  -0.0782|    2.6142|
|Lak     |Burntbridge_lake    | 0.3144| 0.1834| 0.6802|     0.4176|  0.1730| 0.4844|  1.5863|  -0.0255|    2.8088|
|Lak     |Cascade_lake        | 0.3983| 0.1549| 0.7180|     0.3800|  0.1419| 0.4956|  1.3142|  -0.0666|    2.5310|
|Lak     |Chub_lake           | 0.4514| 0.0000| 0.6884|     0.3048|  0.1222| 0.4884|  1.1629|  -0.1297|    2.4811|
|Lak     |Chub_pond           | 0.4217| 0.2057| 0.6419|     0.1665*|  0.1770| 0.4777|  3.4521*|   0.2089|    2.8156|
|Lak     |Connera_lake        | 0.4005| 0.2380| 0.6080|     0.3871|  0.1974| 0.4590|  2.9254|   0.2675|    3.2941|
|Lak     |Constable_lake      | 0.4090| 0.0000| 0.7213|     0.3671|  0.1232| 0.4813|  0.9281|  -0.1881|    2.1424|
|Lak     |Deep_lake           | 0.3164| 0.0000| 0.8930|     0.3680|  0.0000| 0.4752| -0.0682|  -0.3889|    1.8846|
|Lak     |Emerald_lake        | 0.4828| 0.0000| 0.8734|     0.2519| -0.0041| 0.4731|  0.9974|  -0.4673|    1.9050|
|Lak     |Falls_lake          | 0.2954| 0.0981| 0.7092|     0.3476|  0.1632| 0.4890|  1.2022|  -0.1054|    2.7316|
|Lak     |Fawn_lake           | 0.3640| 0.0000| 0.7416|     0.2741|  0.1482| 0.4759|  1.4517|  -0.1457|    2.2932|
|Lak     |Federation_lake     | 0.3508| 0.0000| 0.8242|     0.3201| -0.0035| 0.4810|  0.5067|  -0.4801|    1.8439|
|Lak     |Goose_lake          | 0.4375| 0.0000| 0.6619|     0.3362|  0.1449| 0.4964|  1.5594|  -0.0882|    2.6237|
|Lak     |Grass_lake          | 0.3979| 0.2392| 0.6756|     0.2957|  0.1769| 0.4764|  1.6909|  -0.0387|    2.8513|
|Lak     |Gull_lake           | 0.3556| 0.1808| 0.6638|     0.2466|  0.1611| 0.4669|  1.9865|  -0.0269|    2.8248|
|Lak     |Gull_lake_north     | 0.4121| 0.0000| 0.8650|     0.2960| -0.0035| 0.4663| -0.0735|  -0.4803|    1.5415|
|Lak     |Helldiver_pond      | 0.3787| 0.1706| 0.6709|     0.2446|  0.1612| 0.4786|  1.3853|  -0.0715|    2.6919|
|Lak     |High_pond           | 0.4843| 0.0000| 0.8759|     0.1904| -0.0038| 0.4694|  1.3283|  -0.4614|    1.9935|
|Lak     |Hoel_lake           | 0.4130| 0.2068| 0.6052|     0.3086|  0.1961| 0.4592|  3.4722*|   0.1834|    3.2154|
|Lak     |Horseshoe_Lake      | 0.4321| 0.1598| 0.6179|     0.3715|  0.1811| 0.4731|  2.4551|   0.0926|    2.9783|
|Lak     |Indian_Lake         | 0.2173| 0.0000| 0.7252|     0.3919|  0.1352| 0.4834|  0.2044|  -0.2328|    2.2488|
|Lak     |Little_Rainbow_Lake | 0.2850| 0.2234| 0.6190|     0.2011|  0.1713| 0.4671|  1.8721|   0.0201|    3.1177|
|Lak     |Long_Lake           | 0.4685| 0.2331| 0.6079|     0.2763|  0.2127| 0.4581|  3.5007*|   0.1407|    3.0996|
|Lak     |Loon_Lake           | 0.4436| 0.0951| 0.7511|     0.1782|  0.1423| 0.4850|  1.4555|  -0.0803|    2.7344|
|Lak     |Lost_Lake           | 0.3244| 0.0000| 0.7396|     0.2510|  0.0800| 0.4723|  1.1592|  -0.1395|    2.3895|
|Lak     |Lost_Lake_East      | 0.2734| 0.0000| 0.7111|     0.4095|  0.1414| 0.4805|  1.2536|  -0.1084|    2.4022|
|Lak     |Lower_Sister_Lake   | 0.4090| 0.0000| 0.7106|     0.2442|  0.1270| 0.4834|  1.9143|  -0.1059|    2.5285|
|Lak     |Oswego_Lake         | 0.3659| 0.0000| 0.7158|     0.3235|  0.0000| 0.4680|  1.2401|  -0.1959|    2.2655|
|Lak     |Owl_Lake            | 0.2010| 0.0000| 0.7701|     0.3929|  0.0559| 0.4905|  0.1351|  -0.1884|    2.1956|
|Lak     |Rat_Lake            | 0.4439| 0.2235| 0.6210|     0.2902|  0.1901| 0.4766|  2.4133|   0.1787|    3.0122|
|Lak     |Razorback_Lake      | 0.3945| 0.0000| 0.6731|     0.3233|  0.1672| 0.4751|  1.9132|  -0.0774|    2.6185|
|Lak     |Rock_Lake           | 0.2859| 0.0000| 0.8102|     0.2750| -0.0026| 0.4872|  0.0069|  -0.4660|    1.8356|
|Lak     |Russian_Lake        | 0.3269| 0.0000| 0.7800|     0.1983|  0.0000| 0.4887|  0.8123|  -0.1916|    2.0958|
|Lak     |Safford_Lake        | 0.4022| 0.2154| 0.6741|     0.2759|  0.1943| 0.4788|  2.0719|  -0.0208|    2.7132|
|Lak     |Sand_Lake           | 0.4567| 0.0000| 0.8001|     0.3412|  0.0000| 0.4892|  1.0770|  -0.2446|    2.0258|
|Lak     |South_Lake          | 0.0000| 0.0000| 0.8465|     0.3492| -0.0038| 0.4764|  0.0417|  -0.4737|    1.6940|
|Lak     |Squaw_Lake          | 0.4095| 0.0000| 0.7299|     0.3289|  0.1156| 0.4767|  1.9185|  -0.0731|    2.5158|
|Lak     |Stink_Lake          | 0.3520| 0.2177| 0.6415|     0.3394|  0.1763| 0.4729|  2.5287|   0.0424|    2.9646|
|Lak     |Twelfth_Tee_Lake    | 0.4122| 0.0000| 0.7861|     0.3736|  0.1088| 0.4893|  0.8816|  -0.2537|    2.1222|
|Lak     |Twin_Lake_East      | 0.3333| 0.0000| 0.9099|     0.3962| -0.0062| 0.4505| -0.1111|  -0.5097|    1.3361|
|Lak     |Twin_Lake_West      | 0.1653| 0.0000| 0.7467|     0.3664|  0.0948| 0.4761|  0.0968|  -0.1750|    2.2301|
|Lak     |Whipple_Lake        | 0.4370| 0.0000| 0.7145|     0.2001|  0.1272| 0.4814|  1.9576|  -0.1787|    2.3403|
|Lak     |Wolf_Lake           | 0.2583| 0.0000| 0.8266|     0.3759|  0.0000| 0.4641|  0.0100|  -0.2819|    1.9356|

Table: Empirical local foodweb values and 99% Confidence intervals for network properties: Coherence ($Q$), modularity ($MO$), and Mean maximal eingenvalue ($MEing$), with 99% confidence intervals based on 1000 networks generated by the assembly model. 


|Metaweb |Network             | EC      | AC      | TT      | OM      |$EC_{low}$|$EC_{high}$|$AC_{low}$|$AC_{high}$|$TT_{low}$|$TT_{high}$|$OM_{low}$|$OM_{high}$|
|:-------|:-------------------|--------:|--------:|--------:|--------:|-----:|------:|-----:|------:|-----:|------:|-----:|------:|
|Ant     |Potter              |      973|     2123|      620|      139|   297|   7481|   191|   2129|    53|   1153|     3|    750|
|Ant     |Weddell             |    47573|     7575|     3846|     1156| 21422|  80409|  8577|  24632|  3810|  11999|  1509|   7476|
|Isl     |FloridaIslandE1     |    23085|   115120|    11179|    16118| 10368|  23575| 47790| 118085|  6660|  12437|  8944|  17573|
|Isl     |FloridaIslandE2     |      613|     2647|      387|      310|    93|   1678|   514|   7252|    35|    968|    36|   1383|
|Isl     |FloridaIslandE3     |    23175|   118404|    12065|    17130| 20126|  23575| 98359| 118085| 10512|  12437| 14484|  17573|
|Isl     |FloridaIslandE7     |      524|     2212|      402|      405|    81|   1735|   370|   7018|    47|   1042|    40|   1436|
|Isl     |FloridaIslandE9     |      653|     2871|      470|      704|    78|   2453|   402|  10223|    54|   1333|    51|   1936|
|Lak     |Alford_lake         |      360|     2059|      306|      170|    19|   1037|   176|   3600|    55|   1525|     0|    433|
|Lak     |Balsam_lake         |      445|     2232|      403|      233|    26|    855|   152|   3112|    39|   1336|     0|    363|
|Lak     |Beaver_lake         |      391|     2011|      765|      235|    10|    857|    66|   2788|    24|   1229|     0|    329|
|Lak     |Big_hope_lake       |      693|     2747|      858|      258|     7|    678|    45|   2491|    13|   1149|     0|    273|
|Lak     |Brandy_lake         |      174|      813|       85|       97|     0|    324|     6|   1192|     0|    491|     0|    129|
|Lak     |Bridge_brook_lake   |     1539|     6338|     1931|      629|   119|   1663|   502|   6036|   195|   2628|    15|    762|
|Lak     |Brook_trout_lake    |       15|       46|       10|        0|     0|     96|     0|    302|     0|    152|     0|     40|
|Lak     |Buck_pond           |      443|     1051|      122|        0|     7|    512|    27|   1802|     6|    751|     0|    203|
|Lak     |Burntbridge_lake    |      295|     1599|      247|       55|     8|    658|    58|   2457|    17|   1049|     0|    279|
|Lak     |Cascade_lake        |      126|      539|      208|       54|     3|    554|    15|   1895|     5|    798|     0|    240|
|Lak     |Chub_lake           |       72|      408|      118|       27|     2|    360|    18|   1375|     2|    591|     0|    159|
|Lak     |Chub_pond           |     1180|     3100|     1048|      802|    23|    904|   144|   3341|    48|   1407|     0|    422|
|Lak     |Connera_lake        |      787|     4035|     1455|      384|    23|   1122|   206|   3820|    82|   1753|     0|    408|
|Lak     |Constable_lake      |       72|      255|       56|        0|     0|    323|     5|   1017|     0|    562|     0|    159|
|Lak     |Deep_lake           |       21|       70|       19|        0|     0|    168|     0|    550|     0|    258|     0|     67|
|Lak     |Emerald_lake        |       48|      136|       70|        0|     0|    172|     0|    650|     0|    247|     0|     75|
|Lak     |Falls_lake          |      327|      876|      268|       40|     5|    463|    27|   1635|     5|    788|     0|    214|
|Lak     |Fawn_lake           |      165|      512|      233|       64|     0|    351|     6|   1262|     0|    555|     0|    153|
|Lak     |Federation_lake     |       85|      171|       64|        9|     0|    156|     0|    488|     0|    263|     0|     60|
|Lak     |Goose_lake          |       61|      522|      151|       57|     3|    450|    43|   1568|     2|    667|     0|    210|
|Lak     |Grass_lake          |      265|     1027|      292|      119|     9|    779|    44|   2505|    29|   1181|     0|    299|
|Lak     |Gull_lake           |      514|     1172|      434|      183|     8|    751|    57|   2678|    17|   1298|     0|    329|
|Lak     |Gull_lake_north     |       21|       47|       18|        0|     0|     91|     0|    313|     0|    143|     0|     40|
|Lak     |Helldiver_pond      |      360|      967|      354|       92|     4|    535|    11|   1758|     0|    733|     0|    205|
|Lak     |High_pond           |      117|      276|      103|       30|     0|    214|     0|    643|     0|    333|     0|     86|
|Lak     |Hoel_lake           |     1393|     5109|     2488|      991|    47|   1204|   211|   4459|    70|   1938|     3|    496|
|Lak     |Horseshoe_Lake      |      352|     1595|      699|      213|    26|   1010|   126|   3285|    49|   1373|     0|    388|
|Lak     |Indian_Lake         |      281|      581|       72|        0|     0|    276|     3|    937|     0|    483|     0|    134|
|Lak     |Little_Rainbow_Lake |      915|     2094|      467|      175|    22|    873|    89|   3280|    38|   1318|     0|    351|
|Lak     |Long_Lake           |      827|     3756|     1237|      656|    34|   1011|   181|   3881|    59|   1667|     0|    430|
|Lak     |Loon_Lake           |      159|      635|      190|       81|     2|    471|    20|   1800|     0|    700|     0|    189|
|Lak     |Lost_Lake           |      327|      623|      348|       48|     0|    402|     5|   1197|     0|    548|     0|    141|
|Lak     |Lost_Lake_East      |      265|      893|      181|       35|     1|    404|     8|   1408|     0|    610|     0|    158|
|Lak     |Lower_Sister_Lake   |      249|      880|      244|      149|     2|    480|    21|   1611|     4|    763|     0|    216|
|Lak     |Oswego_Lake         |      256|      608|      250|       30|     0|    341|     5|   1232|     0|    548|     0|    144|
|Lak     |Owl_Lake            |      129|      367|       29|        0|     0|    286|     2|    910|     0|    450|     0|    104|
|Lak     |Rat_Lake            |      398|     1675|      721|      259|    20|    943|   138|   3175|    34|   1361|     0|    363|
|Lak     |Razorback_Lake      |      291|     1048|      298|       96|     4|    500|    15|   1750|     6|    804|     0|    210|
|Lak     |Rock_Lake           |      113|      107|       22|        0|     0|    155|     1|    593|     0|    276|     0|     68|
|Lak     |Russian_Lake        |      110|      212|       64|       20|     0|    263|     2|    979|     0|    474|     0|    111|
|Lak     |Safford_Lake        |      406|     1301|      564|      206|     9|    694|    52|   2521|     2|   1076|     0|    244|
|Lak     |Sand_Lake           |       68|      277|      133|       28|     0|    276|     0|    982|     0|    402|     0|    124|
|Lak     |South_Lake          |      100|       90|        0|        0|     0|    150|     0|    482|     0|    214|     0|     60|
|Lak     |Squaw_Lake          |      234|     1197|      303|       88|     4|    526|    23|   1783|    10|    754|     0|    202|
|Lak     |Stink_Lake          |      596|     2278|      656|      221|    22|    935|   114|   3246|    47|   1474|     0|    388|
|Lak     |Twelfth_Tee_Lake    |       89|      318|       96|       16|     0|    265|     6|    822|     0|    353|     0|    107|
|Lak     |Twin_Lake_East      |       16|       20|        4|        0|     0|     69|     0|    193|     0|     91|     0|     20|
|Lak     |Twin_Lake_West      |      127|      219|       11|        0|     1|    394|     4|   1364|     0|    553|     0|    178|
|Lak     |Whipple_Lake        |      199|      582|      200|      154|     0|    380|     8|   1262|     0|    579|     0|    167|
|Lak     |Wolf_Lake           |       45|      182|       33|        0|     0|    241|     0|    806|     0|    368|     0|     76|

Table: Motif counts for the empirical networks and 99% confidence intervals based on 1000 assembly model networks. Where EC is exploitative competition, AC apparent competition, TT tri-trophic chain and OM is omnivory. Quantities marked with '*' are significant at 1% level.

|Metaweb |Network             | Size|      chi2| pvalue|
|:----|:-------------------|----:|---------:|------:|
|Ant  |Weddell             |  435|   23.3577| 0.0003*|
|Ant  |Potter              |   92|   21.3429| 0.0001*|
|Isl  |E3                  |  211|    3.0768| 0.4339|
|Isl  |E1                  |  210|    0.3572| 0.9850|
|Isl  |E2                  |   59|    3.5984| 0.3026|
|Isl  |E9                  |   56|    6.7691| 0.0148|
|Isl  |E7                  |   54|    1.5924| 0.4295|
|Lak  |Bridge brook lake   |   75|    3.3781| 0.2529|
|Lak  |Hoel lake           |   72|    3.8121| 0.0847|
|Lak  |Connera lake        |   65|    1.6687| 0.5011|
|Lak  |Long Lake           |   65|   16.0644| 0.0001*|
|Lak  |Big hope lake       |   61|   13.4552| 0.0007*|
|Lak  |Alford lake         |   56|    3.3363| 0.3304|
|Lak  |Beaver lake         |   56|    2.2095| 0.5351|
|Lak  |Chub pond           |   54|    1.1128| 0.4668|
|Lak  |Burntbridge lake    |   53|    0.8862| 0.8029|
|Lak  |Stink Lake          |   53|    2.0000| 1.0000|
|Lak  |Little Rainbow Lake |   52|    2.0065| 0.7288|
|Lak  |Balsam lake         |   50|    3.2709| 0.3198|
|Lak  |Rat Lake            |   50|    7.0667| 0.0184|
|Lak  |Horseshoe Lake      |   49|    0.8528| 1.0000|
|Lak  |Gull lake           |   45|    0.8916| 1.0000|
|Lak  |Grass lake          |   44|    4.6074| 0.2103|
|Lak  |Safford Lake        |   44|    3.6056| 0.0897|
|Lak  |Razorback Lake      |   42|    1.5594| 0.5021|
|Lak  |Buck pond           |   41|    1.9042| 1.0000|
|Lak  |Helldiver pond      |   41|    1.5808| 0.5128|
|Lak  |Lost Lake East      |   41|    2.1565| 0.2310|
|Lak  |Squaw Lake          |   41|    0.7267| 1.0000|
|Lak  |Goose lake          |   40|    1.0630| 0.4851|
|Lak  |Falls lake          |   39|    0.8771| 1.0000|
|Lak  |Lower Sister Lake   |   37|    2.8668| 0.2599|
|Lak  |Chub lake           |   36|    3.7050| 0.1606|
|Lak  |Cascade lake        |   35|   18.8867| 0.0001*|
|Lak  |Indian Lake         |   35|    1.8944| 0.7453|
|Lak  |Loon Lake           |   35|    1.3402| 0.8283|
|Lak  |Oswego Lake         |   33|    1.1566| 0.4657|
|Lak  |Constable lake      |   32|    0.0506| 1.0000|
|Lak  |Fawn lake           |   32|    0.1304| 1.0000|
|Lak  |Whipple Lake        |   32|    2.8355| 0.3149|
|Lak  |Lost Lake           |   31|    0.1525| 0.7855|
|Lak  |Twelfth Tee Lake    |   31|    1.1683| 0.4744|
|Lak  |Brandy lake         |   30|    2.0703| 0.6864|
|Lak  |Owl Lake            |   30|    2.0048| 0.7394|
|Lak  |Sand Lake           |   29|    2.3968| 0.5064|
|Lak  |Wolf Lake           |   27|    0.6926| 0.6199|
|Lak  |Twin Lake West      |   26|    4.7582| 0.0537|
|Lak  |High pond           |   24|    0.7980| 1.0000|
|Lak  |Russian Lake        |   24|    1.9385| 0.2839|
|Lak  |Emerald lake        |   22|    0.0000| 1.0000|
|Lak  |Federation lake     |   22|    0.9783| 1.0000|
|Lak  |Rock Lake           |   22|    0.1431| 1.0000|
|Lak  |South Lake          |   22|    0.2337| 1.0000|
|Lak  |Deep lake           |   19|    5.0592| 0.0360|
|Lak  |Gull lake north     |   16|    0.0000| 1.0000|
|Lak  |Brook trout lake    |   15|    1.0000| 0.4123|
|Lak  |Twin Lake East      |   13|    1.0400| 1.0000|

Table: Comparison of empirical proportions of Topological Roles with one assembly model realization.  Only Potter, Weddell,Long Lake, Big hope lake, Cascade lake, 9% (5/57) are different from the metaweb assembly model. 

\newpage


![The four three-species sub-networks analysed: apparent competition, exploitative competition, tri-trophic chain, and omnivory. These four sub-networks have been explored both theoreticall and empirically in ecological networks and are the most common sub-networks found in food webs](Figures/Fig1Motifs.png)


![Connectance comparison for local empirical networks (dots) and assembly model networks. We ran 1000 simulations of the model fitted to local networks to build the 99% confidence intervals of the metric (vertical lines). Where Ant is the Antarctic metaweb, Isl is the Islands, and Lak the lakes metaweb.](Figures/Connectance_Assembly_byMeta.png){ width=100% }

![Number of species (Size) comparison for local empirical networks (dots) and assembly model networks. We ran 1000 simulations of the model fitted to local networks to build the 99% confidence intervals of the metric (vertical lines). Where Ant is the Antarctic metaweb, Isl is the Islands, and Lak the lakes metaweb](Figures/Size_Assembly_byMeta.png) 

![Trohpic Coherence (Q) comparison for local empirical networks (dots) and assembly model networks. We ran 1000 simulations of the model fitted to local networks to build the 99% confidence intervals of the metric (vertical lines). Where Ant is the Antarctic metaweb, Isl is the Islands, and Lak the lakes metaweb](Figures/Q_Assembly_byMeta.png) 


![Topological roles comparison for local empirical networks (dots) and assembly model networks for the Lakes metaweb. Only 3 local food webs have proportions different from the metaweb assembly model.  The topological roles are: *Hub connectors* have a high number of between module links, *Module connectors* have a low number of links mostly between modules,  *Module hubs* have a high number of links inside its module. *Module specialists* have a low number of links inside its module. Lakes marked with '*' are significant at 1% level](Figures/Lak_TopoRoles_ByNetwork_Model.png)

## Bibliography

