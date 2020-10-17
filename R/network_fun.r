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
  layout.matrix.1[,2]<-jitter(troph.net2$TL,0.1) # y-axis value based on trophic level
  layout.matrix.1[,1]<-jitter(modulos$membership,1) # randomly assign along x-axis
  
#  png("Figures/RegionalFoodWeb.png",width=6,height=6,units="in",res=600)
#  par(fig = c(0, 1, 0, 1), oma = c(0, 0, 0, 0), mar = c(0, 0, 0, 0))
  
  plot(redl, vertex.color=vertex_attr(redl)$cor, #vertex.label=NA,
       #vertex.size=log(3*igraph::degree(redl)),
       edge.width=.3,edge.arrow.size=.4, 
       edge.color="grey50",
       edge.curved=0.3, layout=layout.matrix.1)
  
}

#' Calculate motif counts for observed network and CI for erdos-renyi random networks and Z-scores 
#'
#' @param red igraph network object
#' @param nsim number of simulation to calculate random networks with the same nodes and links
#'
#' @return data.frame with all the results
#' @export
#'
#' @examples
calc_motif_random <- function(red, nsim=1000)
{
    Size <- vcount(red)
    Links <- ecount(red)
    
    redes.r <- lapply(1:nsim, function (x) {
      e <- erdos.renyi.game(Size, Links, type="gnm",directed = TRUE)
      while(components(e)$no>1)
        e <- erdos.renyi.game(Size, Links, type="gnm",directed = TRUE)
      
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
    
    return(tibble(explComp=obs[4],apprComp=obs[5],triTroph=obs[6],omnivory=obs[9],zEC=zEC,zAC=zAC,zTT=zTT,zOM=zOM,EClow=qEC[1],EChigh=qEC[2],AClow=qAC[1],AChigh=qAC[2],TTlow=qTT[1],TThigh=qTT[2],OMlow=qOM[1],OMhigh=qOM[2]))         
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
  require(doFuture)
  registerDoFuture()
  plan(multiprocess)
  
#   require(doParallel)
#   cn <-detectCores()
# #  cl <- makeCluster(cn,outfile="foreach.log") # Logfile to debug 
#   cl <- makeCluster(cn)
#   registerDoParallel(cl)
  
  ind <- foreach(i=1:nsim,.combine='rbind',.inorder=FALSE,.packages='igraph') %dopar% 
    {
    m<-calc_modularity_unconnected(redes.r[[i]])
    modl <- m$modularity
    ngrp <- max(m$membership) 
    clus.coef <- transitivity(redes.r[[i]], type="Global")
    cha.path  <- average.path.length(redes.r[[i]])
    data.frame(modularity=modl,ngroups=ngrp,clus.coef=clus.coef,cha.path=cha.path)
  }
  # stopCluster(cl)
  plan(sequential)
  ind <- ind %>% mutate(gamma=t$Clustering/clus.coef,lambda=t$PathLength/cha.path,SWness=gamma/lambda)
  # 99% confidence interval
  #
  qSW <- quantile(ind$SWness,c(0.005,0.995),na.rm = TRUE)
  qmo <- quantile(ind$modularity,c(0.005,0.995))
  qgr <- quantile(ind$ngroups,c(0.005,0.995))
  mcc <- mean(ind$clus.coef)
  mcp <- mean(ind$cha.path)
  mmo <- mean(ind$modularity)
  mgr <- mean(ind$ngroups)
  mSW <- mean(t$Clustering/mcc*mcp/t$PathLength)
  mCI <- 1+(qSW[2]-qSW[1])/2  
  return(list(su=tibble(rndCC=mcc,rndCP=mcp,rndMO=mmo,rndGR=mgr,SWness=mSW,SWnessCI=mCI,MOlow=qmo[1],MOhigh=qmo[2],
                    GRlow=qgr[1],GRhigh=qgr[2]), sim=ind))         
}

#
# Calculate 
#      Q: incoherence (0=coherent) 
#      rQ: ratio of Q with expected Q 
#           under null expectation given N=nodes L=links B=basal nodes Lb=basal links
#      mTi: mean trophic level
#      rTI: ration of TI with expected TI under the same null
#
calc_incoherence <- function(g,ti=NULL) {
  require(igraph)
  require(NetIndices)
  if(is.null(ti) )
      ti<-TrophInd(get.adjacency(g,sparse=FALSE))
  v <- ti$TL
  z <- outer(v,v,'-');
  A <- get.adjacency(g,sparse = FALSE)
  xx <- A>0
  x <- (A*t(z))[xx]
  #meanQ <- sum(x)/ecount(g) 
  #sdQ <- sqrt(sum((x-1)^2)/vcount(g) )
  Q <- round(sqrt(sum((x-1)^2)/ecount(g) ),8)
  
  basal <- which(round(v,8)==1)
  bedges <- sum(degree(g,basal,mode='out'))
  mTI <- mean(v)
  mK <- mean(degree(g,mode='out'))
  eTI <- 1+(1-length(basal)/vcount(g))*ecount(g)/bedges
  eQ <- sqrt(ecount(g)/bedges-1)
  data.frame(Q=Q,rQ=Q/eQ,mTI=mTI,rTI=mTI/eTI)
}


#' Calc incoherence z-score and confidence interval under a random Erdos-Renyi 
#' networks with the condition of at least one basal node
#'
#' @param g igraph network object
#' @param ti trophic level vector
#'
#' @return
#' @export
#'
#' @examples
calc_incoherence_z <- function(g,ti=NULL,nsim=1000) {

    t <- calc_topological_indices(g)
    
    redes.r <- lapply(1:nsim, function (x) {
        e <- erdos.renyi.game(t$Size, t$Links, type="gnm",directed = TRUE)
        basal <- length(V(e)[degree(e,mode="in")==0])
        # while(components(e)$no>1 | basal==0){
        #   e <- erdos.renyi.game(t$Size, t$Links, type="gnm",directed = TRUE)
        #   basal <- length(V(e)[degree(e,mode="in")==0])
        # }
      return(e) }
    )
    
    ind <- data.frame()
    
    # require(doParallel)
    # cn <-detectCores()
    # # #  cl <- makeCluster(cn,outfile="foreach.log") # Logfile to debug 
    # cl <- makeCluster(cn)
    # registerDoParallel(cl)
    require(future.apply)
    plan(multiprocess)
    
    ind <- foreach(i=1:nsim,.combine='rbind',.inorder=FALSE,.packages='igraph',.export = 'calc_incoherence') %dopar% 
    {
      m<-calc_incoherence(redes.r[[i]])
      data.frame(Q=m$Q,mTI=m$mTI)
    }
    #stopCluster(cl)
    
    qQ <- quantile(ind$Q,c(0.005,0.995))
    qTI <- quantile(ind$mTI,c(0.005,0.995))
    rndQ <- mean(ind$Q)
    rndTI <- mean(ind$mTI)

    m <- calc_incoherence(g,ti)
    
    zQ <-  (m$Q- rndQ)/sd(ind$Q)
    zTI <- (m$mTI - rndTI)/sd(ind$mTI) # the same as sd(ind$mTI)
    #
    plan(sequential)
    
    return(list(su=tibble(rndQ=rndQ,rndTI=rndTI,Qlow=qQ[1],Qhigh=qQ[2],
                      TIlow=qTI[1],TIhigh=qTI[2],zQ=zQ,zTI=zTI),sim=ind))         
    
}
  

#' Calc topological roles 
#'
#' @param g an Igraph object with the network 
#' @param nsim  number of simulations with different community
#'
#' @return a  data frame with two fields: within_module_degree, among_module_conn
#' @export
#'
#' @examples
calc_topological_roles <- function(g,nsim=1000)
{
  
  toRol <- data.frame()
  require(doFuture)
  registerDoFuture()
  plan(multiprocess)
  # cn <-detectCores()
  # #  cl <- makeCluster(cn,outfile="foreach.log") # Logfile to debug 
  # cl <- makeCluster(cn)
  # registerDoParallel(cl)
  
  toRol <- foreach(idx=1:nsim,.combine='rbind',.inorder=FALSE,.packages='igraph') %dopar% 
  {
    # within-module degree
    #
    # Standarized Within module degree z-score 
    #
    m<-calc_modularity_unconnected(g)
    spingB.mem<- m$membership
    
    l<-vector()
    memMod<-vector()
    
    for (i in 1:vcount(g)){
      
      sp.in.deg <- V(g)[nei(i, "in")]
      sp.out.deg<- V(g)[nei(i, "out")]
      mem.sp<-spingB.mem[i]
      k<- length(which(spingB.mem[c(sp.in.deg, sp.out.deg)]==mem.sp))
      mem<- which(spingB.mem==mem.sp)
      
      for (m in 1:length(mem)){
        mem.in.deg <- V(g)[nei(mem[m], "in")]
        mem.out.deg<- V(g)[nei(mem[m], "out")]
        memMod.id<- length(which(spingB.mem[c(mem.in.deg, mem.out.deg)]==mem.sp))
        memMod[m]<- memMod.id
      }
      
      k.ave<- mean(memMod)
      k.sd<- sd(memMod)
      l[i]<- (k-k.ave)/k.sd
    }
    
    # among module connectivity
    r<- vector()
    for (i in 1:vcount(g)){
      
      d<-degree(g)[i]
      sp.in.deg <- V(g)[nei(i, "in")]
      sp.out.deg<- V(g)[nei(i, "out")]
      mod.sp<-table(spingB.mem[c(sp.in.deg, sp.out.deg)])
      mod.no<-as.numeric(names(mod.sp))
      mod<-rep(0, length(unique(spingB.mem)))
      mod[mod.no]<-c(mod.sp)
      r[i]<- 1-(sum((mod/d)^2))
    }
    return(data.frame(node=1:vcount(g),within_module_degree=l, among_module_conn=r))
    
  }
  #stopCluster(cl)
  plan(sequential)
  # toRol %>% group_by(node) %>% summarize(wtmLowCI=quantile(within_module_degree,0.005,na.rm=TRUE),
  #                                        wtmHiCI=quantile(within_module_degree,0.995,na.rm=TRUE),
  #                                        amcLowCI=quantile(among_module_conn,0.005,na.rm=TRUE),
  #                                        amcHiCI=quantile(among_module_conn,0.995,na.rm=TRUE),
  #                                        within_module_degree=mean(within_module_degree,na.rm=TRUE),
  #                                        among_module_conn=mean(among_module_conn,na.rm=TRUE))
  return(toRol)
}


#' Plot topological roles
#'
#' @param tRoles Calculated topological roles with the function calc_topological_roles
#' @param g Igraph network object   
#' @param spingB Igraph community object
#'
#' @return
#' @export
#'
#' @examples
plot_topological_roles <- function(tRoles,g,spingB=NULL){
  
  if( is.null(spingB) )
    spingB <- calc_modularity_unconnected(g)
  
  spingB.mem<- spingB$membership
  
  l <- tRoles$within_module_degree
  r <- tRoles$among_module_conn
  # Plot
  require(RColorBrewer)
  colbar.FG <- brewer.pal(length(spingB$csize),"Dark2")
  groups.B<- spingB.mem # 1=phytopl, 2=zoopl, 3=benthos, 4=fish, 5=birds, 6=mammals
  
  par(mfrow=c(1,1))
  par(oma=c(2.7,1.3,0.7,1)) # change outer figure margins
  par(mai=c(1,1,0.7,0.7)) # size of figure margins
  yran <- range(l)
  xran <- range(r)
  plot(l~r, type="n", axes=T ,tck=F, lwd=2, ann=F, cex.axis=1.2, xlim=xran, ylim=yran)
  lines(c(0.625,0.625), yran, col="grey")
  lines(xran, c(2.5, 2.5), col="grey")
  points(r, l, col=colbar.FG[groups.B], pch=20, cex=2)
  mtext(2, text="Within module degree", line=4,font=2, cex=1.2)
  mtext(1, text="Among module connectivity",line=4, font=2, cex=1.2)
  axis(1, tck=0.02, lwd=1,las=2,lty=1, labels=F, xlim=c(0,1))
  axis(2,tck=0.02, labels=FALSE)
  
  # Which are the module hubs: many links within its own module.
  #
  modhub <- which(l>2.5)
  modhub <- modhub[which(l>2.5) %in% which(r<=0.625)]
  modlbl <- unlist(vertex_attr(g,index=modhub))
  if(is.null(modlbl))
    modlbl <- modhub
  hub_conn <- data.frame()
  
  if(length(modhub)) {
    text(r[modhub],l[modhub],labels = modlbl,cex=0.7,pos=3)
    hub_conn <- data.frame(type="modhub",node=modhub,name=modlbl)  
  }
  
  points(r[modhub], l[modhub], cex=4, col="blue", pch=20)
  
  # Which are the hub connectors: high within and between-module connectivity
  #                              and are classified super-generalists
  #
  modhub <- which(l>2.5)
  modhub <- modhub[which(l>2.5) %in% which(r>0.625)]
  modlbl <- unlist(vertex_attr(g,index=modhub))
  if(is.null(modlbl))
    modlbl <- modhub
  if(length(modhub)) {
    text(r[modhub],l[modhub],labels = modlbl,cex=0.7,pos=3)
    hub_conn <- rbind(hub_conn, data.frame(type="hubcon",node=modhub,name=modlbl))  
  }
  
  # Which are the module specialist: Few links and most of them within its own module
  #
  modhub <- which(l<=2.5)
  modhub <- modhub[which(l<=2.5) %in% which(r<=0.625)]
  modlbl <- unlist(vertex_attr(g,index=modhub))
  if(is.null(modlbl))
    modlbl <- modhub
  if(length(modhub)){
    hub_conn <- rbind(hub_conn, data.frame(type="modspe",node=modhub,name=modlbl))  
  }
  # Which are the module connectors: Few links and between modules
  #
  modhub <- which(l<=2.5)
  modhub <- modhub[which(l<=2.5) %in% which(r>0.625)]
  modlbl <- unlist(vertex_attr(g,index=modhub))
  if(is.null(modlbl))
    modlbl <- modhub
  if(length(modhub)){
    hub_conn <- rbind(hub_conn, data.frame(type="modcon",node=modhub,name=modlbl))  
  }
  return(hub_conn)
}


classify_topological_roles <- function(tRoles,g,spingB=NULL){
  
  if( is.null(spingB) )
    spingB <- calc_modularity_unconnected(g)
  
  spingB.mem<- spingB$membership
  
  l <- tRoles$within_module_degree
  r <- tRoles$among_module_conn
  # Plot

  # Which are the module hubs: many links within its own module.
  #
  modhub <- which(l>2.5)
  modhub <- modhub[which(l>2.5) %in% which(r<=0.625)]
  modlbl <- unlist(vertex_attr(g,index=modhub))
  if(is.null(modlbl))
    modlbl <- modhub
  hub_conn <- data.frame()
  
  if(length(modhub)) {
    hub_conn <- data.frame(type="modhub",node=modhub,name=modlbl)  
  }
  
  # Which are the hub connectors: high within and between-module connectivity
  #                              and are classified super-generalists
  #
  modhub <- which(l>2.5)
  modhub <- modhub[which(l>2.5) %in% which(r>0.625)]
  modlbl <- unlist(vertex_attr(g,index=modhub))
  if(is.null(modlbl))
    modlbl <- modhub
  if(length(modhub)) {
    hub_conn <- rbind(hub_conn, data.frame(type="hubcon",node=modhub,name=modlbl))  
  }
  
  # Which are the module specialist: Few links and most of them within its own module
  #
  modhub <- which(l<=2.5)
  modhub <- modhub[which(l<=2.5) %in% which(r<=0.625)]
  modlbl <- unlist(vertex_attr(g,index=modhub))
  if(is.null(modlbl))
    modlbl <- modhub
  if(length(modhub)){
    hub_conn <- rbind(hub_conn, data.frame(type="modspe",node=modhub,name=modlbl))  
  }
  # Which are the module connectors: Few links and between modules
  #
  modhub <- which(l<=2.5)
  modhub <- modhub[which(l<=2.5) %in% which(r>0.625)]
  modlbl <- unlist(vertex_attr(g,index=modhub))
  if(is.null(modlbl))
    modlbl <- modhub
  if(length(modhub)){
    hub_conn <- rbind(hub_conn, data.frame(type="modcon",node=modhub,name=modlbl))  
  }
  return(hub_conn)
}

#' Calculate average topological roles doing nsimStep simulations and repeating until there is no
#' differences using an Anderson Darling test.
#'
#' @param g igraph object with the network 
#' @param nsimStep number of repeated simulations until testing for differences, the minimun number of simulations is nsimStep*2
#'
#' @return data.frame with topological roles averaged over n*nsimStep repetitions
#' @export
#'
#' @examples
calc_avg_topological_roles <- function(g, net_name,nsimStep){
  
  tR1 <- calc_topological_roles(g,nsimStep)                       # 30 simulations is enough to obtain stable topological roles
  tsim <- nsimStep
  topoRoles_mWA_temp  <- tR1 %>% group_by(node) %>% summarize(wtmLowCI=quantile(within_module_degree,0.005,na.rm=TRUE),
                                              wtmHiCI=quantile(within_module_degree,0.995,na.rm=TRUE),
                                              amcLowCI=quantile(among_module_conn,0.005,na.rm=TRUE),
                                              amcHiCI=quantile(among_module_conn,0.995,na.rm=TRUE),
                                              within_module_degree=mean(within_module_degree,na.rm=TRUE),
                                              among_module_conn=mean(among_module_conn,na.rm=TRUE))
  
  
  print(tsim)
  # Loop
  while(TRUE){
    tR1 <- bind_rows(tR1, calc_topological_roles(g,nsimStep))
    
    saveRDS(tR1,"TopoRoles_mWA_temp.rds")
    
    #tR1 <- readRDS("TopoRoles_mWA_temp.rds")
    
    tR  <- tR1 %>% group_by(node) %>% summarize(wtmLowCI=quantile(within_module_degree,0.005,na.rm=TRUE),
                                                wtmHiCI=quantile(within_module_degree,0.995,na.rm=TRUE),
                                                amcLowCI=quantile(among_module_conn,0.005,na.rm=TRUE),
                                                amcHiCI=quantile(among_module_conn,0.995,na.rm=TRUE),
                                                within_module_degree=mean(within_module_degree,na.rm=TRUE),
                                                among_module_conn=mean(among_module_conn,na.rm=TRUE))
    
    
    require(kSamples)
    t1 <- ad.test(list(tR$among_module_conn,topoRoles_mWA_temp$among_module_conn),method="simulated",nsim=1000)
    t2 <- ad.test(list(tR$within_module_degree,topoRoles_mWA_temp$within_module_degree),method="simulated",nsim=1000)
    topoRoles_mWA_temp <- tR %>% mutate(Network=net_name)
    tsim <- tsim +nsimStep
    print(tsim)
    if(t1$ad[1,4]>0.1 && t2$ad[1,4]>0.1) break()
    
  }
  
  return(topoRoles_mWA_temp)
}

#' Plot topological roles by trophic level and module
#'
#' @param netFrame dataframe with all the networks 
#' @param netName String with name of the food web to analyse
#' @param deadNodes Vector of strings with name of dead nodes to calculate trophic level
#' @param modulObj Igraph community object with the module organization of the food web
#' @param topoFrame dataframe with topological role and node index
#' @param legendPos position of the legend "topleft", "topright" or if "" no legend.
#' @param redl igraph object, if it is not null the network is taken from it    
#'
#' @return
#' @export
#'
#' @examples

plotTopoRolesByTLByMod <- function(netName,deadNodes,modulObj=NULL,topoFrame,legendPos="",redl=NULL,netFrame=NULL){
  # 
  # Local 
  #
  if(is.null(redl)){
    
    dtot1 <- as.matrix(netFrame %>% filter(Network==netName) %>% dplyr::select(Prey_name,Predator_name))
    redl <- graph_from_edgelist(dtot1, directed  = T)
    redl <- simplify(redl)
  }
  require(NetIndices)
  if(deadNodes[1]=="")
      tl<-TrophInd(get.adjacency(redl,sparse=F))
  else
      tl<-TrophInd(get.adjacency(redl,sparse=F),Dead=deadNodes)

  if(is.null(modulObj))
    modulObj<-cluster_spinglass(redl)
    
  lMat<-matrix(
    nrow=length(V(redl)),  # Rows equal to the number of vertices
    ncol=2
  )
  
  # 
  # Add colors with topological roles to nodes 
  #
  require(dplyr)
  require(RColorBrewer)
  colnet <- brewer.pal(4,"Paired")
  
  hc <- topoFrame %>% mutate(type = factor(type)) %>% filter(Network==netName) %>% arrange(node) %>% mutate(col= as.numeric(type), TL=tl[,1]) 
  V(redl)$color <- colnet[hc$col]
  
  # Transform y-axis coordinates
  #
  maxnew <- max(hc$TL)
  minnew <- min(hc$TL)
  maxold <- 1
  minold <- -1
  t2 <- function(x) (maxold-minold)/(maxnew -minnew)*(x - maxnew)+maxold 
  
  
  #
  # Plot modules
  #
  lMat[,2]<-jitter(tl$TL,0.4) # y-axis value based on trophic level
  # Order groups in ascending trofic level
  #
  df <- data.frame(tl=tl$TL,m=modulObj$membership)
  df <- df %>% mutate(m = dense_rank(ave(tl, m, FUN = max)))
  lMat[,1]<-jitter(df$m,1) # randomly assign along x-axis
  
  plot(redl, vertex.color=vertex_attr(redl)$cor,vertex.label=NA,
       vertex.size=log(3*igraph::degree(redl)),
       edge.width=.3,edge.arrow.size=.2, 
       edge.color=add.alpha("grey50",0.5),
       edge.curved=0.3, layout=lMat)
  
  
  axis(side=2,at=t2(1:4),labels=1:4,  las=1, col = NA, col.ticks = 1)
  
  legstr <- levels(hc$type)
  legstr <- c("Hub conn.", "Mod. Conn.", "Mod. Hubs", "Mod. Spec.")
  if(legendPos!="")
      legend(legendPos, pch=19, col=colnet, legend= legstr)
  
}


# Add alpha to base plot colors
# 
#
add.alpha <- function(col, alpha=1){
  if(missing(col))
    stop("Please provide a vector of colours.")
  apply(sapply(col, col2rgb)/255, 2, 
        function(x) 
          rgb(x[1], x[2], x[3], alpha=alpha))  
}



#' Curbe ball algorithm 
#' Strona, G. et al. 2014. A fast and unbiased procedure to randomize ecological binary matrices with 
#' fixed row and column totals. -Nat. Comm. 5: 4114. doi: 10.1038/ncomms5114
#'
#' @param g igraph object to extract adjacency matrix  
#'
#' @return
#' @export
#'
#' @examples
curve_ball<-function(g){
  require(igraph)
  m <- get.adjacency(g,sparse=F)
  RC=dim(m)
  R=RC[1]
  C=RC[2]
  hp=list()
  for (row in 1:dim(m)[1]) {hp[[row]]=(which(m[row,]==1))}
  l_hp=length(hp)
  for (rep in 1:5*l_hp){
    AB=sample(1:l_hp,2)
    a=hp[[AB[1]]]
    b=hp[[AB[2]]]
    ab=intersect(a,b)
    l_ab=length(ab)
    l_a=length(a)
    l_b=length(b)
    if ((l_ab %in% c(l_a,l_b))==F){
      tot=setdiff(c(a,b),ab)
      l_tot=length(tot)
      tot=sample(tot, l_tot, replace = FALSE, prob = NULL)
      L=l_a-l_ab
      hp[[AB[1]]] = c(ab,tot[1:L])
      hp[[AB[2]]] = c(ab,tot[(L+1):l_tot])}
    
  }
  rm=matrix(0,R,C)
  for (row in 1:R){rm[row,hp[[row]]]=1}
  graph_from_adjacency_matrix(rm,mode="directed") 
}


#' Get species names in degree/preys outdegree/predators of one topological role ("hubcon","modspe","modcon","modhub")
#'
#' @param netFrame dataframe with all the networks 
#' @param netName String with name of the food web to analyse
#' @param deadNodes Vector of strings with name of dead nodes to calculate trophic level
#' @param topoFrame dataframe with topological role and node index
#'
#' @return
#' @export
#'
#' @examples

getTopoRolesTLdegree <- function(redl,netName,topoFrame,deadNodes="",topoType=NULL){
  # 
  # Igraph object from dataframe
  #
  require(NetIndices)  
  if(deadNodes[1]=="")
    TL<-TrophInd(get.adjacency(redl,sparse=F))
  else
    TL<-TrophInd(get.adjacency(redl,sparse=F),Dead=deadNodes)

  if(!is.null(topoType)){
    topoFrame %>% filter(type==topoType,Network==netName) %>% rowwise() %>% mutate( preys=degree(redl,node,mode=c("in")), predators= degree(redl,node,mode=c("out")), trophLevel=TL[node,1])
  } else {
    topoFrame %>% filter(Network==netName) %>% group_by(type) %>% rowwise() %>% mutate( preys=degree(redl,node,mode=c("in")), predators= degree(redl,node,mode=c("out")), trophLevel=TL[node,1])
  }
}
  
#' Title Plot net assembly model time series of S and L only the last timeW steps are ploted
#'
#' @param AA output of a net assembly model
#' @param timeW time window used
#' @param fname file name to save the plot 
#'
#' @return
#' @export
#'
#' @examples
plot_NetAssemblyModel <- function(AA,timeW,fname=NULL,emp=NULL){
  require(viridis)
  colnet <- viridis(3)
  
  tf <- length(AA$L)
  if(tf<timeW) stop("timeW parameter must be less than the time of the simulation")
  
  dfA <- data.frame(S=AA$S[(tf-timeW):tf],L=as.numeric(AA$L[(tf-timeW):tf]),T=c((tf-timeW):tf))
  dfA$C <- dfA$L/(dfA$S*dfA$S)
  if(is.null(fname)){
    gS <- ggplot(dfA, aes(x=T,y=S)) + geom_line(colour=colnet[1]) + theme_bw() + geom_hline(yintercept = mean(dfA$S),linetype = 2,colour="grey50")
    print(gS)
    gL <- ggplot(dfA, aes(x=T,y=L)) + geom_line(colour=colnet[2]) + theme_bw() + ylab("L") + geom_hline(yintercept = mean(dfA$L),linetype = 2,colour="grey50")
    print(gL)
    gC <- ggplot(dfA, aes(x=T,y=C)) + geom_line(colour=colnet[3]) + theme_bw() + ylab("C") + geom_hline(yintercept = mean(dfA$C),linetype = 2,colour="grey50")
    print(gC)
    return(list(gS=gS,gL=gL,gC=gC))
  } else {
    require(cowplot)
    g1 <- ggplot(dfA, aes(x=T,y=S)) + geom_line(colour=colnet[1]) + theme_bw() + geom_hline(yintercept = mean(dfA$S),linetype=3) + geom_hline(yintercept = mean(emp$Size),linetype=2)
    g2 <- ggplot(dfA, aes(x=T,y=C)) + geom_line(colour=colnet[3]) + theme_bw() + ylab("C") + geom_hline(yintercept = mean(dfA$C),linetype=3) + geom_hline(yintercept = mean(emp$Connectance),linetype=2)
    g3 <- plot_grid(g1,g2,labels = c("A","B"),align = "h")
    save_plot(fname,g3,base_width=8,base_height=5,dpi=600)
  }
}


#' Title Plot net assembly model S and L average by a moving window to check if equilibrium is reached
#'
#' @param AA output of a net assembly model
#' @param timeW time window used
#' @param fname file name to save the plot 
#' @param emp data.frame with empirical values of S an C
#'
#' @return
#' @export
#'
#' @examples
plot_NetAssemblyModel_eqw <- function(AA,timeW,fname=NULL,emp=NULL){

  df <- data.frame(S=AA$S,L=as.numeric(AA$L),T=c(1:tf)) %>% mutate(C=L/(S*S))
  grandS <- mean(df$S[timeW:nrow(df)])
  grandC <- mean(df$C[timeW:nrow(df)])
  
  df$gr <- rep(1:(nrow(df)/timeW), each = timeW)
  df <- df %>% filter(!is.nan(C)) %>% group_by(gr) %>% summarise(mS=mean(S),sdS=sd(S), mL=mean(L), sdL=sd(L),time=max(T),mC=mean(C),sdC=sd(C))
  if(is.null(fname)){
    print(g1 <- ggplot(df,aes(y=mS,x=time,colour=time))+ theme_bw() + geom_point() + geom_errorbar(aes(ymin=mS-sdS,ymax=mS+sdS)) + scale_color_distiller(palette = "RdYlGn",guide=FALSE)+ geom_hline(yintercept =grandS,linetype=3 ))
    print(g2 <- ggplot(df,aes(y=mC,x=time,colour=time))+ theme_bw() + geom_point() + geom_errorbar(aes(ymin=mC-sdC,ymax=mC+sdC))+ scale_color_distiller(palette = "RdYlGn",guide=FALSE)+ geom_hline(yintercept =grandC,linetype=3 ))
  } else {
    require(cowplot)
    g1 <- ggplot(df,aes(y=mS,x=time,colour=time))+ theme_bw() + geom_point() + geom_errorbar(aes(ymin=mS-sdS,ymax=mS+sdS)) + scale_color_distiller(palette = "RdYlGn",guide=FALSE)+ geom_hline(yintercept =grandS,linetype=3 ) + geom_hline(yintercept =emp$Size,linetype=2 )
    g2 <- ggplot(df,aes(y=mC,x=time,colour=time))+ theme_bw() + geom_point() + geom_errorbar(aes(ymin=mC-sdC,ymax=mC+sdC))+ scale_color_distiller(palette = "RdYlGn",guide=FALSE)+ geom_hline(yintercept =grandC,linetype=3 ) + geom_hline(yintercept =emp$Connectance,linetype=2 )
    g3 <- plot_grid(g1,g2,labels = c("A","B"),align = "h")
    save_plot(fname,g3,base_width=8,base_height=5,dpi=600)
  }
    
  return(list(g1=g1,g2=g2))
}



#' Estimation of z-scores using Meta-Web assembly model as a null 
#'
#' @param webs table with the parameters of the reference network
#' @param web_name name of the reference network
#' @param Adj Adyacency matrix for the meta-web
#' @param mig Migration parameter of the meta-Web assembly model
#' @param ext Exctinction parameter of the meta-Web assembly model
#' @param sec Secondary exctinctions parameter of the meta-Web assembly model
#' @param nsim number of simulations
#' @param final_time number of steps of the simulations 
#'
#' @return
#' @export
#'
#' @examples
calc_modularity_metaWebAssembly<- function(webs, web_name, Adj, mig,ext,sec,nsim=1000,final_time=1000){
  
  t <- webs %>% filter(Network==web_name)

  mig <- rep(mig,nrow(Adj))
  ext <- rep(ext,nrow(Adj))
  sec <- rep(sec,nrow(Adj))
  ind <- data.frame()
  require(doFuture)
  registerDoFuture()
  plan(multiprocess)
  
  ind <- foreach(i=1:nsim,.combine='rbind',.inorder=FALSE,.packages=c('meweasmo','igraph'), 
                 .export = c('Adj','ext','mig','final_time')) %dopar% 
  {
    AA <- metaWebNetAssemblyCT(Adj,mig,ext,sec,final_time)
    g <- graph_from_adjacency_matrix( AA$A, mode  = "directed")
    # Select only a connected subgraph graph 
    dg <- components(g)
    g <- induced_subgraph(g, which(dg$membership == which.max(dg$csize)))
    mmm <- calc_modularity_unconnected(g)
    modl <- mmm$modularity
    ngrp <- length(mmm$csize)
    clus.coef <- transitivity(g, type="Global")
    cha.path  <- average.path.length(g)
    size <- vcount(g)
    links <- ecount(g)
    
    mmm <- calc_incoherence(g)
    #qss <- calc_QSS(g,10000,ncores=4)

    bind_cols(data.frame(Size=size,Links=links,modularity=modl,ngroups=ngrp,clus.coef=clus.coef,cha.path=cha.path,Q=mmm$Q,mTI=mmm$mTI))#,qss)
  }
  plan(sequential)
  
  ind <- ind %>% mutate(gamma=t$Clustering/clus.coef,lambda=t$PathLength/cha.path,SWness=gamma/lambda)
  # 99% confidence interval
  #
  qSW <- quantile(ind$SWness,c(0.005,0.995), na.rm = TRUE)
  qmo <- quantile(ind$modularity,c(0.005,0.995), na.rm = TRUE)
  qgr <- quantile(ind$ngroups,c(0.005,0.995), na.rm = TRUE)
  mcc <- mean(ind$clus.coef, na.rm = TRUE)
  mcp <- mean(ind$cha.path, na.rm = TRUE)
  mmo <- mean(ind$modularity, na.rm = TRUE)
  mgr <- mean(ind$ngroups, na.rm = TRUE)
  mSW <- mean(t$Clustering/mcc*mcp/t$PathLength, na.rm = TRUE)
  mCI <- 1+(qSW[2]-qSW[1])/2  

  qQ <- quantile(ind$Q,c(0.005,0.995), na.rm = TRUE)
  qTI <- quantile(ind$mTI,c(0.005,0.995), na.rm = TRUE)
  mdlQ <- mean(ind$Q, na.rm = TRUE)
  mdlTI <- mean(ind$mTI, na.rm = TRUE)
  # m <-calc_incoherence(red,ti)
  
  zQ <-  (t$Q- mdlQ)/sd(ind$Q)
  zTI <- (t$mTI - mdlTI)/sd(ind$mTI) # the same as sd(ind$mTI)

  zMO <- (t$Modularity- mmo)/sd(ind$modularity)
  # 99% confidence interval
  #
  # q_qss <- quantile(ind$QSS,c(0.005,0.995),na.rm = TRUE)
  # m_qss <- mean(ind$QSS)
  # q_meing <- quantile(ind$MEing,c(0.005,0.995),na.rm = TRUE)
  # m_meing <- mean(ind$MEing)
  
  # zQSS <- (t$QSS - m_qss)/sd(ind$QSS) 
  # zMEing <- (t$MEing - m_meing)/sd(ind$MEing)

  return(list(su=tibble(mdlCC=mcc,mdlCP=mcp,mdlMO=mmo,mdlGR=mgr,SWness=mSW,SWnessCI=mCI,MOlow=qmo[1],MOhigh=qmo[2],
                    GRlow=qgr[1],GRhigh=qgr[2], mdlQ=mdlQ,mdlTI=mdlTI,Qlow=qQ[1],Qhigh=qQ[2],
                    TIlow=qTI[1],TIhigh=qTI[2],zQ=zQ,zTI=zTI,zMO=zMO
                    #mdlQSS=m_qss,QSSlow=q_qss[1],QSShigh=q_qss[2],
                    #zQSS=zQSS,mdlMEing=m_meing,MEingLow=q_meing[1],MEingHigh=q_meing[2],zMEing=zMEing
                    )
              ,sim=ind))         
}



#' Estimation of QSS z-scores using Meta-Web assembly model as a null 
#'
#' @param red This is the reference network as an igraph object
#' @param Adj Adyacency matrix for the meta-web
#' @param mig Migration parameter of the meta-Web assembly model
#' @param ext Exctinction parameter of the meta-Web assembly model
#' @param nsim number of simulations
#'
#' @return
#' @export
#'
#' @examples
calc_qss_metaWebAssembly<- function(webs, web_name, Adj, mig,ext,sec,nsim=1000,final_time=1000,ncores=0){
  
  t <- webs %>% filter(Network==web_name)
  mig <- rep(mig,nrow(Adj))
  ext <- rep(ext,nrow(Adj))
  sec <- rep(sec,nrow(Adj))
  
  ind <- data.frame()

  require(doFuture)
  registerDoFuture()
  plan(multiprocess)
  
  ind <- foreach(i=1:nsim,.combine='rbind',.inorder=FALSE) %dopar% 
  {
    AA <- metaWebNetAssemblyCT(Adj,mig,ext,sec,final_time)
    g <- graph_from_adjacency_matrix( AA$A, mode  = "directed")
    dg <- components(g)
    g <- induced_subgraph(g, which(dg$membership == which.max(dg$csize)))
    
    size <- vcount(g)
    links <- ecount(g)
    
    # Select only a connected subgraph graph 
    # print(paste("Sim:",i, "Size:", size))
    bind_cols(data.frame(Size=size,Links=links),calc_QSS(g,10000))
  }
  plan(sequential)
  
  # 99% confidence interval
  #
  q_qss <- quantile(ind$QSS,c(0.005,0.995),na.rm = TRUE)
  m_qss <- mean(ind$QSS)
  q_meing <- quantile(ind$MEing,c(0.005,0.995),na.rm = TRUE)
  m_meing <- mean(ind$MEing)
  
  zQSS <- (t$QSS - m_qss)/sd(ind$QSS) 
  zMEing <- (t$MEing - m_meing)/sd(ind$MEing)
  return(list(su=tibble(QSS=t$QSS,mdlQSS=m_qss,QSSlow=q_qss[1],QSShigh=q_qss[2],
                zQSS=zQSS,MEing=t$MEing,mdlMEing=m_meing,MEingLow=q_meing[1],MEingHigh=q_meing[2],zMEing=zMEing),sim=ind))         
}


#' Calculate motif counts for observed network and CI for meta-web assembly model networks and Z-scores 
#'
#' @param red igraph network object
#' @param Adj Adyacency matrix for the meta-web
#' @param mig Migration parameter of the meta-Web assembly model
#' @param ext Exctinction parameter of the meta-Web assembly model
#' @param nsim number of simulation to calculate random networks with the same nodes and links
#'
#' @return data.frame with all the results
#' @export
#'
#' @examples
calc_motif_metaWebAssembly<- function(red, Adj, mig, ext, nsim=1000)
{
  require(doParallel)
  cn <-detectCores()
  #  cl <- makeCluster(cn,outfile="foreach.log") # Logfile to debug 
  cl <- makeCluster(cn)
  registerDoParallel(cl)
  
  final_time <- 500  # Final time used in simulations of the meta-web assembly
  mig <- rep(mig,nrow(Adj))
  ext <- rep(ext,nrow(Adj))

  ind <- data.frame()
  require(doParallel)
  cn <-detectCores()
  #  cl <- makeCluster(cn,outfile="foreach.log") # Logfile to debug 
  cl <- makeCluster(cn)
  registerDoParallel(cl)

  ind <- foreach(i=1:nsim,.combine='rbind',.inorder=FALSE,.packages=c('MetaWebAssemblyModels','igraph'), 
                 .export = c('Adj','ext','mig','final_time')) %dopar% 
  {
    AA <- metaWebNetAssembly(Adj,mig,ext,final_time)
    g <- graph_from_adjacency_matrix( AA$A, mode  = "directed")
    # Select only a connected subgraph graph 
    dg <- components(g)
    g <- induced_subgraph(g, which(dg$membership == which.max(dg$csize)))
    
    mot <- triad_census(g)
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
  
  return(tibble(explComp=obs[4],apprComp=obs[5],triTroph=obs[6],omnivory=obs[9],zEC=zEC,zAC=zAC,zTT=zTT,zOM=zOM,EClow=qEC[1],EChigh=qEC[2],AClow=qAC[1],AChigh=qAC[2],TTlow=qTT[1],TThigh=qTT[2],OMlow=qOM[1],OMhigh=qOM[2]))         
}    



#' Title Plot 5 simulations of net assembly model time series of S and L only the last timeW steps are ploted
#'
#' @param metaW meta-web adjacency matrix 
#' @param m     migration
#' @param q     probability of link
#' @param a     extinction
#' @param timeW time window used
#'
#' @return
#' @export
#'
#' @examples
plot_NetAssemblyModel_sims <- function(metaW,m, q, a, tf,timeW){
  require(viridis)

  if(tf<timeW) stop("timeW parameter must be less than the time of the simulation")
  
  dfA <- data.frame()
  
  for(n in 1:5){
    AA <- metaWebNetAssembly(metaW,m,q,a,tf)
    tdfA <- data.frame(S=AA$S[(tf-timeW):tf],L=as.numeric(AA$L[(tf-timeW):tf]),T=c((tf-timeW):tf))
    tdfA$C <- tdfA$L/(tdfA$S*tdfA$S)
    tdfA$sim <- n
    dfA <- bind_rows(dfA,tdfA)
  }
  gS <- ggplot(dfA, aes(x=T,y=S,colour=sim)) + geom_point() + theme_bw() + geom_hline(yintercept = mean(dfA$S),linetype = 2,colour="grey50") + scale_color_viridis(guide=FALSE)
  print(gS)
  gL <- ggplot(dfA, aes(x=T,y=L,colour=sim)) + geom_point() + theme_bw() + ylab("L") + geom_hline(yintercept = mean(dfA$L),linetype = 2,colour="grey50") + scale_color_viridis(guide=FALSE)
  print(gL)
  gC <- ggplot(dfA, aes(x=T,y=C,colour=sim)) + geom_point() + theme_bw() + ylab("C") + geom_hline(yintercept = mean(dfA$C),linetype = 2,colour="grey50") + scale_color_viridis(guide=FALSE)
  print(gC)
  return(list(gS=gS,gL=gL,gC=gC))
}


#' Calculate means and CI for within module degree dz and among-module connectivity participation coefficient pc. 
#' Do 100 simulations and then 10 simulations more to check if dz and pc are stable
#' 
#' @param gr  igraph network
#' @param name name of the network
#' @param mod_gr intial modular structure (igraph community)
#'
#' @return a data frame with mean dz, pc, and 99% CI 
#' @export
#'
#' @examples
incremental_topoRoles <- function(gr,name)
{
  cond1 <- cond2 <- FALSE
  tR2 <- data.frame()
  nsim <- 0
  while (!(cond1 & cond2)) {
      
    #
    # Calc topological roles 100 simulations
    #  
    message(paste("\n calc_topological_roles 100-", name))

    
    tR1 <- calc_topological_roles(gr,100)
    tR  <- tR1 %>% group_by(node) %>% summarize(wtmLowCI=quantile(within_module_degree,0.005,na.rm=TRUE),
                                                wtmHiCI=quantile(within_module_degree,0.995,na.rm=TRUE),
                                                amcLowCI=quantile(among_module_conn,0.005,na.rm=TRUE),
                                                amcHiCI=quantile(among_module_conn,0.995,na.rm=TRUE),
                                                within_module_degree=mean(within_module_degree,na.rm=TRUE),
                                                among_module_conn=mean(among_module_conn,na.rm=TRUE))
    
    message(paste("\n calc_topological_roles 10-", name))
    nsim <- nsim + 100
    tR1 <- bind_rows(tR1, calc_topological_roles(gr,10))

    tR2 <-   tR1 %>% group_by(node) %>% summarize(wtmLowCI=quantile(within_module_degree,0.005,na.rm=TRUE),
                                                  wtmHiCI=quantile(within_module_degree,0.995,na.rm=TRUE),
                                                  amcLowCI=quantile(among_module_conn,0.005,na.rm=TRUE),
                                                  amcHiCI=quantile(among_module_conn,0.995,na.rm=TRUE),
                                                  within_module_degree=mean(within_module_degree,na.rm=TRUE),
                                                  among_module_conn=mean(among_module_conn,na.rm=TRUE))
    
    
    nsim <- nsim + 10
    
    if(nsim >=1000)
       break
    
    require(kSamples)
    ad1 <- ad.test(list(tR$among_module_conn,tR2$among_module_conn))
    ad2 <- ad.test(list(tR$within_module_degree,tR2$within_module_degree))
    
    cond1 <- (ad1$ad[2,3] > 0.1)
    cond2 <- (ad2$ad[2,3] > 0.1)
    
#    message( nrow(tR1)/igraph::gorder(gr))
  }
  dz_pc <- tR2 %>% mutate(Network=name)
  return(dz_pc)
}



compare_with_ER <- function(redl, network_name,nsims=1000,rnd_seed=123){
  
  message(paste("\n calc_topological_indices -", network_name))
  #
  # calc topological indices  
  #
  set.seed(rnd_seed)
  modulos<-calc_modularity_unconnected(redl)
  websTbl <- multiweb::calc_topological_indices(redl)  %>% mutate(Network=network_name,Groups=length(modulos$csize),Modularity=modulos$modularity)

  message(paste("\ncalc_modularity_random -", network_name))
  #
  # Compare with random networks
  #
  tbl <- data.frame()
  tbl <- calc_modularity_random(redl,nsims)
  
  websTbl <- websTbl %>% bind_cols(tbl$su)
  
  sim <- tbl$sim
  
  #
  # Modularity z-score
  #
  websTbl$zMO[1] <- with(websTbl[1,], (Modularity - rndMO)/sd(sim$modularity))
  
  message(paste("\n TrophInd -", network_name))
  #
  # Calculate Trophic Position
  #
  require(NetIndices)
  trophl<-TrophInd(get.adjacency(redl,sparse=F))
  
  message(paste("\n calc_incoherence -", network_name))
  #
  # Calc incoherence
  #
  q <- calc_incoherence(redl,trophl)
  websTbl$Q[1] <- q$Q
  websTbl$rQ[1] <- q$rQ  # ratio of Q/eQ expected coherence under null -  Significant coherence rQ< 1, Significant incoherence rQ>1
  websTbl$mTI[1] <- q$mTI # mean trophic level 
  websTbl$rTI[1] <- q$rTI   # ratio of mTI/eTI expected under null 

    
  message(paste("\n calc_incoherence_z -", network_name))
  #
  # Calc incoherence z-score based in random E-R networks with the condition of at least one basal node
  #
  tbl <- calc_incoherence_z(redl,trophl,nsims)
  zq <- tbl$su
  websTbl$rndQ[1] <- zq$rndQ
  websTbl$rndTI[1] <- zq$rndTI
  websTbl$Qlow[1] <- zq$Qlow
  websTbl$Qhigh[1] <- zq$Qhigh
  websTbl$TIlow[1] <- zq$TIlow
  websTbl$TIhigh[1] <- zq$TIhigh
  websTbl$zQ[1] <- zq$zQ
  websTbl$zTI[1] <- zq$zTI
  
  sim <- sim %>% bind_cols(tbl$sim) %>% mutate(Network=network_name) 
  
  message(paste("\n calc_QSS -", network_name))
  
  websTbl <- bind_cols(websTbl, calc_QSS(redl,10000,48))
  
  message(paste("\n calc_QSS1 -", network_name))
  
  websTbl <- bind_cols(websTbl, calc_QSS(redl,10000,48,negative=-1,positive=1))
    
  return(list(su=websTbl,sim=sim))
}

approximate_incident_edges <- function(g, v){
  vv <- V(wedd)[grep(v, V(wedd)$name)]
  incident_edges(wedd, vv,mode= "all") 
}



sim_metaWebAssembly_lhs <- function(no_parms,no_sims,par_ranges,A,model_type=0){

  stopifnot( no_parms %in% c(2,3))
  dimA <- nrow(A)
  X <- randomLHS(no_sims, no_parms)
  
  if(no_parms==2) {
    m <- qunif(X[,1], par_ranges[1,1], par_ranges[1,2])
    e <- qunif(X[,2], par_ranges[2,1], par_ranges[2,2])
    se <- rep(par_ranges[3,1],times=no_sims)
  } else {
    m <- qunif(X[,1], par_ranges[1,1], par_ranges[1,2])
    e <- qunif(X[,2], par_ranges[2,1], par_ranges[2,2])
    se <- qunif(X[,3], par_ranges[3,1], par_ranges[3,2])
  }
  arguments <- data.frame(m = m , e = e, se = se)
  
  # simMetaWebAssembly <- data.frame()
  
  tf <- 1000
  sim <- data.frame()
  require(doParallel)
  cn <-detectCores()
  #  cl <- makeCluster(cn,outfile="foreach.log") # Logfile to debug 
  cl <- makeCluster(cn)
  registerDoParallel(cl)
  sim <- foreach(i=1:no_sims,.combine='rbind',.inorder=FALSE,.packages='meweasmo') %dopar% 
  {
      mm <- rep(arguments[i,1],times=dimA)
      aa <- rep(arguments[i,2],times=dimA)
      ee <- rep(arguments[i,3],times=dimA)
      
      if( model_type == 0 ) {
        AA <- metaWebNetAssembly(A,mm,aa,ee,tf)
      } else { 
        AA <- metaWebNetAssemblyCT(A,mm,aa,ee,tf)
      }
      
      dfA <- data.frame(S=AA$S[(tf-100):tf],L=as.numeric(AA$L[(tf-100):tf]),T=c((tf-100):tf))
      #dfA [dfA$T %% 10 == 0,]$L 
      data.frame(m=mm[1],a=aa[1], se=ee[1], S=mean(dfA$S),L=mean(dfA$L),C=mean(dfA$L)/(mean(dfA$S)*mean(dfA$S)))
  }
  stopCluster(cl)
  return(sim)
}


#' Return the names of the basal species: nodes with no incoming links 
#'
#' @param g igraph network
#'
#' @return the basal species 
#' @export
#'
#' @examples
basal_species <- function(g){
  deg <- degree(g, mode="in") # calculate the in-degree: the number of preys
  
  V(g)$indegree <-  deg
  
  basal <- V(g)[indegree==0]
  
  V(g)[basal]$name
  
}


calc_compare_motif <- function(redl, network_name,nsims=1000,rnd_seed=123){
  #
  # Motif
  #
  mot <- triad_census(redl)
  
  # mot[4] = Exploitative competition
  # mot[5] = Apparent competition
  # mot[6] = Tri-trophic chain
  # mot[9] = Omnivory
  # mot[10] = Loop 
  
  freq_all_Motif <- data.frame(Network=network_name,t(mot))
  
  set.seed(rnd_seed)
  motif_ER <- calc_motif_random(redl,nsims) %>% mutate(Network=network_name)
  
  return(list(moter=motif_ER,fallm=freq_all_Motif))
}



#' Calculates modularity taking into account possible unconected networks,  
#' using [igraph::cluster_spinglass] for the connected components. 
#' The same could be done using [igraph::cluster_infomap] that is much faster.
#'  
#' @param g igraph Network
#'
#' @return community object
#' @export
#'
#' @examples
calc_modularity_unconnected <- function(g)
{
  if(count_components(g)>1){
    if(!is.named(g)) V(g)$name <- (1:vcount(g))
    dg <- components(g)
    V(g)$membership = 0
    for(comp in unique(dg$membership)) {
      g1 <- induced_subgraph(g, which(dg$membership == comp))
      m<-cluster_spinglass(g1)
      if(comp == 1 ) {
        V(g)[V(g1)$name]$membership <-  m$membership 
      } else {
        V(g)[V(g1)$name]$membership <-  m$membership + max(V(g)$membership)
      }
    }
    m$membership <- V(g)$membership
    m$modularity <- modularity(g,m$membership)
  } else {
    m<-cluster_spinglass(g)
  }
  return(m)
}

#' Fit metaweb assembly model from simulations 
#'
#' @param webs data frame with info about the web we are fitting
#' @param web_name name of the web we are fitting
#' @param sims data frame with simulations
#' @param tol  tolerance of the fitting for the plot
#' @param plot logical if true make and save a plot of the fitting
#'
#' @return
#' @export
#'
#' @examples
fit_metaWebAssembly_model <- function(webs, web_name, sims, tol=0.1, plot=TRUE){

  # Use this tolerance = tol to display a more detailed plot 
  web <- webs %>% filter(Network==web_name)
  metaweb_name <-  str_sub(web_name,1,3)
  sims <- sims %>% filter(Metaweb == metaweb_name)
  while (TRUE) {
    
    sel <- sims %>% group_by(model) %>% mutate(alpha=m/a) %>% filter(S>web$Size*(1-tol),S<web$Size*(1+tol)) %>% arrange(S)
    if(nrow(sel)> 0) break
    tol <- tol * 2
  }
  #
  # Fit using the distance to S and C
  #
  sel <- sel %>% group_by(model,model_type) %>% mutate(distance = sqrt(((web$Size - S)/web$Size)^2 +  ((web$Connectance - C )/web$Connectance)^2), min_dist = (distance == min(distance))) %>% arrange(distance)
  #sel %>% group_by(model,model_type) %>% filter(min_dist)
  
  fittedmw <- sel %>% filter(min_dist) %>% mutate(Network=web_name,fit_type="S-C")
  
  if(plot) {
    print(
      ggplot(sel, aes(S,C, color=min_dist)) + geom_point(alpha=0.5) + theme_bw() + 
        geom_point(data=web, aes(Size,Connectance,color=Network)) + facet_wrap(~model)  + 
        scale_color_viridis_d(name="",labels=c("Simulations", "Empirical","Fit" ))
      )
  
    ggsave(paste0("Figures/Metaweb_fit_",web_name,"_byModel.png"),width=8,height=5,units="in",dpi=600)
  }
  return(fittedmw)
}


#' Fit metaweb assembly model from simulations using abc and perform a gof test
#'
#' @param webs data frame with info about the web we are fitting
#' @param web_name name of the web we are fitting
#' @param sims data frame with simulations
#' @param tol  tolerance of the fitting for the plot
#' @param plot logical if true make and save a plot of the fitting
#'
#' @return
#' @export
#'
#' @examples
CI_metaWebAssembly_model <- function(webs, web_name, sims, tol=0.1, plot=TRUE){
  
  # Use this tolerance = tol to display a more detailed plot 
  web <- webs %>% filter(Network==web_name)
  metaweb_name <-  str_sub(web_name,1,3)
  sims <- sims %>% filter(Metaweb == metaweb_name)
  while (TRUE) {
    
    sel <- sims %>% group_by(model) %>% mutate(alpha=m/a) %>% filter(S>web$Size*(1-tol),S<web$Size*(1+tol)) %>% arrange(S)
    if(nrow(sel)> 0) break
    tol <- tol * 2
  }
  #
  # Fit using the distance to S and C
  #
  sel <- sel %>% group_by(model,model_type) %>% mutate(distance = sqrt(((web$Size - S)/web$Size)^2 +  ((web$Connectance - C )/web$Connectance)^2), min_dist = (distance == min(distance)),type="Simulations") %>% arrange(distance) 
  #sel %>% group_by(model,model_type) %>% filter(min_dist)
  sel1 <- tibble(S=web$Size,C=web$Connectance,type="Empirical")
  gof <- sel %>% group_modify(  ~ { 
    gg <- summary(abc::gfit(target=sel1[1, 1:2], sumstat=.x[,c("S", "C")],nb.replicate=1000))
    tibble(gof_pvalue= gg$pvalue)}) %>% mutate(Network=web_name,fit_type="S-C")
  rej <- sel %>% group_modify(  ~ { 
    a <- summary(abc::abc(target=sel1[1, 1:2], param = .x[,c("m","a","se")], sumstat=.x[,c("S", "C")], tol=0.05,method = "rejection"))
    bind_rows(a[3,])})
  rej <- inner_join(gof,rej)
  if(plot) {
    print(
      
      ggplot(sel , aes(S,C,color=type)) + geom_point(alpha=0.1) +  theme_bw() + stat_ellipse() +
        facet_wrap(~model)  + geom_point(data=sel1, aes(S,C,color=type)) +
        scale_color_viridis_d(name="",labels=c("Empirical","Simulations" ))
    )
    
    ggsave(paste0("Figures/Metaweb_fit_",web_name,"_byModel.png"),width=8,height=5,units="in",dpi=600)
  }
  return(rej)
}

list_obj_sizes <- function(list_obj=ls(envir=.GlobalEnv)){ 	
  sizes <- sapply(list_obj, function(n) object.size(get(n)), simplify = FALSE) 	
  print(sapply(sizes[order(-as.integer(sizes))], function(s) format(s, unit = 'auto'))) 
} 


#' Simulate and Plot meta web assembly model
#'
#' @param meta igraph metaweb 
#' @param fitted Data frame with the fitted parameters if more than one record select the first
#' @param webst Data frame with the information about networks
#' @param netname Name of the network
#' 
#' @return
#' @export
#'
#' @examples
simulate_plot_metaweb_assembly <- function(meta,fitted,webst,netname){
  # Model with probability of secundary extinction se>0 & se<1
  #
  # Potter
  #
  A <- get.adjacency(meta,sparse=F)

  tf <- 1000
  set.seed(1110) 
  f <- fitted %>% filter(Network==netname) 
  mm <- rep(f$m[1],nrow(A))
  aa <- rep(f$a[1],nrow(A))
  se <- rep(f$se[1],nrow(A))
  AA <- metaWebNetAssemblyCT(A,mm,aa,se,tf)
  
  figname <- paste0("Figures/",netname,"_metawebSim_avg.png")
  # Running averages
  plot_NetAssemblyModel_eqw(AA,50,figname,webst %>% filter(Network==netname))
  
  # Time series plot
  figname <- paste0("Figures/",netname,"_metawebSim_ts.png")
  plot_NetAssemblyModel(AA,300,figname,webst %>% filter(Network==netname))
  
  return(f[1,])
}