#
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



# Calculation of the clustering coefficients and average path for random network simulations
#
#
calc_cpl_cc <- function(size,links, nsim=1000){
  redes.r <- lapply(1:nsim, function (x) erdos.renyi.game(size, links, type="gnm")) 
  
  cha.path.r <- c() 
  for (i in 1:nsim){
    cha.path.r <- c(cha.path.r,average.path.length(redes.r[[i]]))
  }
  
  clus.coef.r <- c() 
  for (i in 1:nsim){
    clus.coef.r <- c(clus.coef.r,transitivity(redes.r[[i]], type="Global"))
  }
  qcc <- quantile(clus.coef.r,c(0.025,0.975))
  qcp <- quantile(cha.path.r,c(0.025,0.975))
  mcc <- mean(clus.coef.r)
  mcp <- mean(cha.path.r)
  
  return(data_frame(cha.pathMean= mcp,clus.coefMean=mcc,cha.pathLow=qcp[1],cha.pathUp=qcp[2], clus.coefLow=qcc[1],clus.coefHigh=qcc[2]))         
}

# Generate a data.frame with all simulations
#
genrnd_cpl_cc <- function(size,links, nsim=1000){
  redes.r <- lapply(1:nsim, function (x) erdos.renyi.game(size, links, type="gnm")) 
  
  cha.path.r <- c() 
  for (i in 1:nsim){
    cha.path.r <- c(cha.path.r,average.path.length(redes.r[[i]]))
  }
  
  clus.coef.r <- c() 
  for (i in 1:nsim){
    clus.coef.r <- c(clus.coef.r,transitivity(redes.r[[i]], type="Global"))
  }
  return(data_frame(cha.path=cha.path.r, clus.coef=clus.coef.r))         
}


# Test SW in Watts Strogatz model against random
#
genWattsStrogatz_cpl_cc <- function(size,links, ratio=1.1,nsim=100){

  redes.r <- lapply(1:nsim, function (x) { 
                  sw <- sample_smallworld(1,size, links/(size*runif(1,0.8,1.2)), 0.5)
                  sw <- simplify(sw,remove.loops = FALSE)})

  swr <- data_frame()
  
  for (i in 1:nsim){
    sw1 <- redes.r[[i]]
    swr <- bind_rows(swr, calc_cpl_cc(gorder(sw1),gsize(sw1)) %>% 
      mutate(Size=gorder(sw1),Links=gsize(sw1),CPL=average.path.length(sw1),CC=transitivity(sw1,type="global")) %>% 
      mutate(isInsideCPL = (CPL >= cha.pathLow*(1/ratio) & CPL<=cha.pathUp*ratio), isGreaterCC =( CC>clus.coefHigh)))
  }

  return(swr)
  
}