# Plot modules vs trophic level
#
#
plot_modules_TL <- function(redl,modulos)
{
  #
  # Calculate Trophic Position
  #
  require(NetIndices)
  troph.net2<-TrophInd(get.adjacency(redl,sparse=F))
  layout.matrix.1<-matrix(
    nrow=length(V(redl)),  # Rows equal to the number of vertices
    ncol=2
  )
  
  # 
  # Add colors to nodes 
  #
  require(RColorBrewer)
  
  colTL <-as.numeric(cut(troph.net2$TL,11))
  colnet <- brewer.pal(11,"RdYlGn")
  V(redl)$color <- colnet[12-colTL]
  
  #
  # Plot modules
  #
  layout.matrix.1[,2]<-jitter(troph.net2$TL,0.4) # y-axis value based on trophic level
  layout.matrix.1[,1]<-jitter(modulos$membership,1) # randomly assign along x-axis
  
#  png("Figures/RegionalFoodWeb.png",width=6,height=6,units="in",res=600)
#  par(fig = c(0, 1, 0, 1), oma = c(0, 0, 0, 0), mar = c(0, 0, 0, 0))
  
  plot(redl, vertex.color=vertex_attr(redl)$cor, #vertex.label=NA,
       #vertex.size=log(3*igraph::degree(redl)),
       edge.width=.3,edge.arrow.size=.4, 
       edge.color="grey50",
       edge.curved=0.3, layout=layout.matrix.1)
  
}

# Calc connectivity clustering coeficient and path length 
#
#
calc_topological_indices <- function(red.e)
{
  size.e <- vcount(red.e)
  links.e <- ecount(red.e)
  link.den <- links.e/size.e
  conn.e <- links.e/size.e^2
  cha.path.e <- average.path.length(red.e)
  clus.coef.e <- transitivity(red.e, type = "global") 
  #degree.e <- degree(red.e)
  return(data.frame(Size=size.e,Links=links.e, LD=link.den,Connectance=conn.e,PathLength=cha.path.e,Clustering=clus.coef.e))
}

# Calculate motif for random networks and observed network
#
#
calc_motif_random <- function(red, nsim=1000)
{
    t <- calc_topological_indices(red)
    
    redes.r <- lapply(1:nsim, function (x) {
      e <- erdos.renyi.game(t$Size, t$Links, type="gnm",directed = TRUE)
      while(components(e)$no>1)
        e <- erdos.renyi.game(t$Size, t$Links, type="gnm",directed = TRUE)
      
      return(e) }
    )
    
    ind <- data.frame()
    require(doParallel)
    cn <-detectCores()
    #  cl <- makeCluster(cn,outfile="foreach.log") # Logfile to debug 
    cl <- makeCluster(cn)
    registerDoParallel(cl)
    
    ind <- foreach(i=1:nsim,.combine='rbind',.inorder=FALSE,.packages='igraph') %dopar% 
    {
      mot <- triad_census(redes.r[[i]])
      mot[4] # Exploitative competition
      mot[5] # Apparent competition
      mot[6] # Tri-trophic chain
      mot[9] # Omnivory

     data.frame(explComp=mot[4],apprComp=mot[5],triTroph=mot[6],omnivory=mot[9])
    }
    stopCluster(cl)
    # 99% confidence interval
    #
    
    qEC <- quantile(ind$explComp,c(0.005,0.995))
    qAC <- quantile(ind$apprComp,c(0.005,0.995))
    qTT <- quantile(ind$triTroph,c(0.005,0.995))
    qOM <- quantile(ind$omnivory,c(0.005,0.995))
    
    # Calculate motif for the original network
    obs <- triad_census(red)
    
    zEC <- (obs[4] - mean(ind$explComp))/sd(ind$explComp)
    zAC <- (obs[5] - mean(ind$apprComp))/sd(ind$apprComp)
    zTT <- (obs[6] - mean(ind$triTroph))/sd(ind$triTroph)
    zOM <- (obs[9] - mean(ind$omnivory))/sd(ind$omnivory)
    
    return(data_frame(explComp=obs[4],apprComp=obs[5],triTroph=obs[6],omnivory=obs[9],zEC=zEC,zAC=zAC,zTT=zTT,zOM=zOM,EClow=qEC[1],EChigh=qEC[2],AClow=qAC[1],AChigh=qAC[2],TTlow=qTT[1],TThigh=qTT[2],OMlow=qOM[1],OMhigh=qOM[2]))         
}    

# Calculation of the clustering coefficients and average path for random network simulations
#
#
calc_modularity_random<- function(red, nsim=1000){
  
  t <- calc_topological_indices(red)
    
  redes.r <- lapply(1:nsim, function (x) {
    e <- erdos.renyi.game(t$Size, t$Links, type="gnm",directed = TRUE)
    while(components(e)$no>1)
      e <- erdos.renyi.game(t$Size, t$Links, type="gnm",directed = TRUE)
    
    return(e) }
    )

  ind <- data.frame()
  require(doParallel)
  cn <-detectCores()
#  cl <- makeCluster(cn,outfile="foreach.log") # Logfile to debug 
  cl <- makeCluster(cn)
  registerDoParallel(cl)
  
  ind <- foreach(i=1:nsim,.combine='rbind',.inorder=FALSE,.packages='igraph') %dopar% 
    {
    m<-cluster_spinglass(redes.r[[i]])
    modl <- m$modularity
    ngrp <- length(m$csize)
    clus.coef <- transitivity(redes.r[[i]], type="Global")
    cha.path  <- average.path.length(redes.r[[i]])
    data.frame(modularity=modl,ngroups=ngrp,clus.coef=clus.coef,cha.path=cha.path)
  }
  stopCluster(cl)
  ind <- ind %>% mutate(gamma=t$Clustering/clus.coef,lambda=t$PathLength/cha.path,SWness=gamma/lambda)
  # 99% confidence interval
  #
  qSW <- quantile(ind$SWness,c(0.005,0.995))
  qmo <- quantile(ind$modularity,c(0.005,0.995))
  qgr <- quantile(ind$ngroups,c(0.005,0.995))
  mcc <- mean(ind$clus.coef)
  mcp <- mean(ind$cha.path)
  mmo <- mean(ind$modularity)
  mgr <- mean(ind$ngroups)
  mSW <- mean(t$Clustering/mcc*mcp/t$PathLength)
  mCI <- 1+(qSW[2]-qSW[1])/2  
  return(data_frame(rndCC=mcc,rndCP=mcp,rndMO=mmo,rndGR=mgr,SWness=mSW,SWnessCI=mCI,MOlow=qmo[1],MOhigh=qmo[2],
                    GRlow=qgr[1],GRhigh=qgr[2]))         
}

#
# Calculate incoherence Q
#
calc_incoherence <- function(g,ti=0) {
  require(igraph)
  require(NetIndices)
  if(ti==0)
      ti<-TrophInd(get.adjacency(g,sparse=FALSE))
  v <- ti$TL
  z <- outer(v,v,'-');
  A <- get.adjacency(g,sparse = FALSE)
  xx <- A>0
  x <- (A*t(z))[xx]
  meanQ <- sum(x)/vcount(g) 
  sdQ <- sqrt(sum((x-1)^2)/vcount(g) )
  }