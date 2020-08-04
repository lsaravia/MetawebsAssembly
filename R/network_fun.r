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
  return(list(su=data_frame(rndCC=mcc,rndCP=mcp,rndMO=mmo,rndGR=mgr,SWness=mSW,SWnessCI=mCI,MOlow=qmo[1],MOhigh=qmo[2],
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
        while(components(e)$no>1 | basal==0){
          e <- erdos.renyi.game(t$Size, t$Links, type="gnm",directed = TRUE)
          basal <- length(V(e)[degree(e,mode="in")==0])
        }
      return(e) }
    )
    
    ind <- data.frame()
    require(doParallel)
    cn <-detectCores()
    # #  cl <- makeCluster(cn,outfile="foreach.log") # Logfile to debug 
    cl <- makeCluster(cn)
    registerDoParallel(cl)
    
    ind <- foreach(i=1:nsim,.combine='rbind',.inorder=FALSE,.packages='igraph',.export = 'calc_incoherence') %do% 
    {
      m<-calc_incoherence(redes.r[[i]])
      data.frame(Q=m$Q,mTI=m$mTI)
    }
    stopCluster(cl)
    
    qQ <- quantile(ind$Q,c(0.005,0.995))
    qTI <- quantile(ind$mTI,c(0.005,0.995))
    rndQ <- mean(ind$Q)
    rndTI <- mean(ind$mTI)

    m <- calc_incoherence(g,ti)
    
    zQ <-  (m$Q- rndQ)/sd(ind$Q)
    zTI <- (m$mTI - rndTI)/sd(ind$mTI) # the same as sd(ind$mTI)
    #
    return(list(su=data_frame(rndQ=rndQ,rndTI=rndTI,Qlow=qQ[1],Qhigh=qQ[2],
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
  require(doParallel)
  cn <-detectCores()
  #  cl <- makeCluster(cn,outfile="foreach.log") # Logfile to debug 
  cl <- makeCluster(cn)
  registerDoParallel(cl)
  
  toRol <- foreach(idx=1:nsim,.combine='rbind',.inorder=FALSE,.packages='igraph') %dopar% 
  {
    # within-module degree
    #
    # Standarized Within module degree z-score 
    #
    m<-cluster_spinglass(g)
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
  stopCluster(cl)
  
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
plot_topological_roles <- function(tRoles,g,spingB){
  
  
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
  
  #points(r[modhub], l[modhub], cex=4, col="blue", pch=20)
  
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
  }
  
  #points(r[modhub], l[modhub], cex=4, col="blue", pch=20)
  if(length(modhub)){
    hub_conn <- rbind(hub_conn, data.frame(type="hubcon",node=modhub,name=modlbl))  
  }
  
  # Which are the module specialist: Few links and most of them within its own module
  #
  modhub <- which(l<=2.5)
  modhub <- modhub[which(l<=2.5) %in% which(r<=0.625)]
  modlbl <- unlist(vertex_attr(g,index=modhub))
  if(is.null(modlbl))
    modlbl <- modhub
  
  hub_conn <- rbind(hub_conn, data.frame(type="modspe",node=modhub,name=modlbl))  
  
  # Which are the module connectors: Few links and between modules
  #
  modhub <- which(l<=2.5)
  modhub <- modhub[which(l<=2.5) %in% which(r>0.625)]
  modlbl <- unlist(vertex_attr(g,index=modhub))
  if(is.null(modlbl))
    modlbl <- modhub
  
  hub_conn <- rbind(hub_conn, data.frame(type="modcon",node=modhub,name=modlbl))  
  
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

plotTopoRolesByTLByMod <- function(netName,deadNodes,modulObj,topoFrame,legendPos="",redl=NULL,netFrame=NULL){
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
      troph.net2<-TrophInd(get.adjacency(redl,sparse=F))
  else
      troph.net2<-TrophInd(get.adjacency(redl,sparse=F),Dead=deadNodes)
  
  layout.matrix.1<-matrix(
    nrow=length(V(redl)),  # Rows equal to the number of vertices
    ncol=2
  )
  
  # 
  # Add colors with topological roles to nodes 
  #
  require(dplyr)
  require(RColorBrewer)
  colnet <- brewer.pal(4,"Paired")
  
  hc <- topoFrame %>% mutate(type = factor(type)) %>% filter(Network==netName) %>% arrange(node) %>% mutate(col= as.numeric(type), TL=troph.net2[,1]) 
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
  layout.matrix.1[,2]<-jitter(troph.net2$TL,0.4) # y-axis value based on trophic level
  layout.matrix.1[,1]<-jitter(modulObj$membership,1) # randomly assign along x-axis
  
  
  plot(redl, vertex.color=vertex_attr(redl)$cor,vertex.label=NA,
       vertex.size=log(3*igraph::degree(redl)),
       edge.width=.3,edge.arrow.size=.2, 
       edge.color=add.alpha("grey50",0.5),
       edge.curved=0.3, layout=layout.matrix.1)
  
  
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

getTopoRolesTLdegree <- function(netFrame,netName,deadNodes,topoFrame,topoType=NULL){
  # 
  # Igraph object from dataframe
  #
  dtot1 <- as.matrix(netFrame %>% filter(Network==netName) %>% dplyr::select(Prey_name,Predator_name))
  redl <- graph_from_edgelist(dtot1, directed  = T)
  redl <- simplify(redl)
  
  require(NetIndices)
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
plot_NetAssemblyModel <- function(AA,timeW,fname=NULL){
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
    g1 <- ggplot(dfA, aes(x=T,y=S)) + geom_line() + theme_bw() + geom_hline(yintercept = mean(dfA$S),linetype=3)
    g2 <- ggplot(dfA, aes(x=T,y=L)) + geom_line() + theme_bw() + ylab("L") + geom_hline(yintercept = mean(dfA$L),linetype=3)
    g3 <- plot_grid(g1,g2,labels = c("A","B"),align = "h")
    save_plot(fname,g3,base_width=8,base_height=5,dpi=600)
  }
}


#' Title Plot net assembly model S and L average by a moving window to check if equilibrium is reached
#'
#' @param AA output of a net assembly model
#' @param timeW time window used
#' @param fname file name to save the plot 
#'
#' @return
#' @export
#'
#' @examples
plot_NetAssemblyModel_eqw <- function(AA,timeW,fname=NULL){

  df <- data.frame(S=AA$S,L=as.numeric(AA$L),T=c(1:tf))
  grandS <- mean(df$S[timeW:nrow(df)])
  grandL <- mean(df$L[timeW:nrow(df)])
  
  df$gr <- rep(1:(nrow(df)/timeW), each = timeW)
  df <- df %>% group_by(gr) %>% summarise(mS=mean(S),sdS=sd(S), mL=mean(L), sdL=sd(L),time=max(T))
  if(is.null(fname)){
    print(ggplot(df,aes(y=mS,x=time,colour=time))+ theme_bw() + geom_point() + geom_errorbar(aes(ymin=mS-sdS,ymax=mS+sdS)) + scale_color_distiller(palette = "RdYlGn",guide=FALSE)+ geom_hline(yintercept =grandS,linetype=3 ))
    print(ggplot(df,aes(y=mL,x=time,colour=time))+ theme_bw() + geom_point() + geom_errorbar(aes(ymin=mL-sdL,ymax=mL+sdL))+ scale_color_distiller(palette = "RdYlGn",guide=FALSE)+ geom_hline(yintercept =grandL,linetype=3 ))
  } else {
    require(cowplot)
    g1 <- ggplot(df,aes(y=mS,x=time,colour=time))+ theme_bw() + geom_point() + geom_errorbar(aes(ymin=mS-sdS,ymax=mS+sdS)) + scale_color_distiller(palette = "RdYlGn",guide=FALSE)+ geom_hline(yintercept =grandS,linetype=3 )
    g2 <- ggplot(df,aes(y=mL,x=time,colour=time))+ theme_bw() + geom_point() + geom_errorbar(aes(ymin=mL-sdL,ymax=mL+sdL))+ scale_color_distiller(palette = "RdYlGn",guide=FALSE)+ geom_hline(yintercept =grandL,linetype=3 )
    g3 <- plot_grid(g1,g2,labels = c("A","B"),align = "h")
    save_plot(fname,g3,base_width=8,base_height=5,dpi=600)
  }
    
  return(df)
}



#' Estimation of z-scores using Meta-Web assembly model as a null 
#'
#' @param red This is the reference network as an igraph object
#' @param Adj Adyacency matrix for the meta-web
#' @param mig Migration parameter of the meta-Web assembly model
#' @param ext Exctinction parameter of the meta-Web assembly model
#' @param ti  trophic level vector 
#' @param nsim number of simulations
#'
#' @return
#' @export
#'
#' @examples
calc_modularity_metaWebAssembly<- function(red, Adj, mig,ext,nsim=1000,ti=NULL){
  
  t <- calc_topological_indices(red)
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
                 .export = c('Adj','ext','mig','final_time','calc_incoherence')) %dopar% 
  {
    AA <- metaWebNetAssembly(Adj,mig,ext,final_time)
    g <- graph_from_adjacency_matrix( AA$A, mode  = "directed")
    # Select only a connected subgraph graph 
    dg <- components(g)
    g <- induced_subgraph(g, which(dg$membership == which.max(dg$csize)))
    mmm<-cluster_spinglass(g)
    modl <- mmm$modularity
    ngrp <- length(mmm$csize)
    clus.coef <- transitivity(g, type="Global")
    cha.path  <- average.path.length(g)
    mmm<-calc_incoherence(g)

    data.frame(modularity=modl,ngroups=ngrp,clus.coef=clus.coef,cha.path=cha.path,Q=mmm$Q,mTI=mmm$mTI)
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

  qQ <- quantile(ind$Q,c(0.005,0.995))
  qTI <- quantile(ind$mTI,c(0.005,0.995))
  mdlQ <- mean(ind$Q)
  mdlTI <- mean(ind$mTI)
  
  m <- calc_incoherence(red,ti)
  
  zQ <-  (m$Q- mdlQ)/sd(ind$Q)
  zTI <- (m$mTI - mdlTI)/sd(ind$mTI) # the same as sd(ind$mTI)
  
  return(list(su=data_frame(mdlCC=mcc,mdlCP=mcp,mdlMO=mmo,mdlGR=mgr,SWness=mSW,SWnessCI=mCI,MOlow=qmo[1],MOhigh=qmo[2],
                    GRlow=qgr[1],GRhigh=qgr[2], mdlQ=mdlQ,mdlTI=mdlTI,Qlow=qQ[1],Qhigh=qQ[2],
                                                 TIlow=qTI[1],TIhigh=qTI[2],zQ=zQ,zTI=zTI,MOsd=sd(ind$modularity)),sim=ind))         
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
calc_qss_metaWebAssembly<- function(red, Adj, mig,ext,nsim=1000,ncores=0){
  
  t <- calc_QSS(red,10000,ncores)
  final_time <- 500  # Final time used in simulations of the meta-web assembly
  mig <- rep(mig,nrow(Adj))
  ext <- rep(ext,nrow(Adj))
  ind <- data.frame()

  require(doFuture)
  registerDoFuture()
  if(ncores) {
    cn <- future::availableCores()
    if(ncores>cn)
      ncores <- cn
    plan(multiprocess, workers=ncores)
    # cl <- makeCluster(cn,outfile="foreach.log") # Logfile to debug
    # cl <- parallel::makeCluster(ncores)
    # doParallel::registerDoParallel(cl)
    # on.exit(parallel::stopCluster(cl))
  } else {
    plan(sequential)
  }

  ind <- foreach(i=1:nsim,.combine='rbind',.inorder=FALSE) %do% 
    {
      AA <- metaWebNetAssembly(Adj,mig,ext,final_time)
      g <- graph_from_adjacency_matrix( AA$A, mode  = "directed")
      dg <- components(g)
      g <- induced_subgraph(g, which(dg$membership == which.max(dg$csize)))
      
      size <- vcount(g)
      links <- ecount(g)
      
      # Select only a connected subgraph graph 
      print(paste("Sim:",i, "Size:", size))
      bind_cols(data.frame(Size=size,Links=links),calc_QSS(g,10000,ncores))
    }
  # 99% confidence interval
  #
  q_qss <- quantile(ind$QSS,c(0.005,0.995),na.rm = TRUE)
  m_qss <- mean(ind$QSS)
  q_meing <- quantile(ind$MEing,c(0.005,0.995),na.rm = TRUE)
  m_meing <- mean(ind$MEing)
  
  zQSS <- (t$QSS - m_qss)/sd(ind$QSS) # the same as sd(ind$mTI)
  zMEing <- (t$MEing - m_meing)/sd(ind$MEing)
  return(list(su=data_frame(QSS=t$QSS,mdlQSS=m_qss,QSSlow=q_qss[1],QSShigh=q_qss[2],
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
  
  return(data_frame(explComp=obs[4],apprComp=obs[5],triTroph=obs[6],omnivory=obs[9],zEC=zEC,zAC=zAC,zTT=zTT,zOM=zOM,EClow=qEC[1],EChigh=qEC[2],AClow=qAC[1],AChigh=qAC[2],TTlow=qTT[1],TThigh=qTT[2],OMlow=qOM[1],OMhigh=qOM[2]))         
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
  
  while (!(cond1 & cond2)) {
      
    #
    # Calc topological roles 100 simulations
    #
    tR1 <- calc_topological_roles(gr,100)
    tR  <- tR1 %>% group_by(node) %>% summarize(wtmLowCI=quantile(within_module_degree,0.005,na.rm=TRUE),
                                                wtmHiCI=quantile(within_module_degree,0.995,na.rm=TRUE),
                                                amcLowCI=quantile(among_module_conn,0.005,na.rm=TRUE),
                                                amcHiCI=quantile(among_module_conn,0.995,na.rm=TRUE),
                                                within_module_degree=mean(within_module_degree,na.rm=TRUE),
                                                among_module_conn=mean(among_module_conn,na.rm=TRUE))
    
    tR1 <- bind_rows(tR1, calc_topological_roles(redl,10))

    tR2 <-   tR1 %>% group_by(node) %>% summarize(wtmLowCI=quantile(within_module_degree,0.005,na.rm=TRUE),
                                                  wtmHiCI=quantile(within_module_degree,0.995,na.rm=TRUE),
                                                  amcLowCI=quantile(among_module_conn,0.005,na.rm=TRUE),
                                                  amcHiCI=quantile(among_module_conn,0.995,na.rm=TRUE),
                                                  within_module_degree=mean(within_module_degree,na.rm=TRUE),
                                                  among_module_conn=mean(among_module_conn,na.rm=TRUE))
    
    
    
    
    require(kSamples)
    ad1 <- ad.test(list(tR$among_module_conn,tR2$among_module_conn))
    ad2 <- ad.test(list(tR$within_module_degree,tR2$within_module_degree))
    
    cond1 <- all(ad1$ad[,3] > 0.1)
    cond2 <- all(ad2$ad[,3] > 0.1)
    
    print( nrow(tR1)/igraph::gorder(gr))
  }
  dz_pc <- tR2 %>% mutate(Network=name)
  return(dz_pc)
}



compare_with_ER <- function(redl, network_name,nsims=1000,rnd_seed=123){
  #
  # Run modularity 
  #
  set.seed(rnd_seed)
  modulos<-cluster_spinglass(redl)
  websTbl <- multiweb::calc_topological_indices(redl)  %>% mutate(Network=network_name,Groups=length(modulos$csize),Modularity=modulos$modularity)
  
  #
  # Compare with random networks
  #
  tbl <- data.frame()
  tbl <- calc_modularity_random(redl,nsims)
  #saveRDS(tbl,"tbl.rds")
  #tbl <- readRDS("tbl.rds")
  websTbl <- websTbl %>% bind_cols(tbl$su)
  
  sim <- tbl$sim

  #
  # Calculate Trophic Position
  #
  require(NetIndices)
  trophl<-TrophInd(get.adjacency(redl,sparse=F))
  
  #
  # Calc incoherence
  #
  q <- calc_incoherence(redl,trophl)
  websTbl$Q[1] <- q$Q
  websTbl$rQ[1] <- q$rQ  # ratio of Q/eQ expected coherence under null -  Significant coherence rQ< 1, Significant incoherence rQ>1
  websTbl$mTI[1] <- q$mTI # mean trophic level 
  websTbl$rTI[1] <- q$rTI   # ratio of mTI/eTI expected under null 
  
  # Calc incoherence z-score based in random E-R networks with the condition of at least one basal node
  #
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
  websTbl$zMO[1] <- with(websTbl[1,], (Modularity - rndMO)/sd(sim$modularity))
  
  sim <- sim %>% bind_cols(tbl$sim) %>% mutate(Network=network_name) 
  
  
  return(list(su=websTbl,sim=sim))
}

approximate_incident_edges <- function(g, v){
  vv <- V(wedd)[grep(v, V(wedd)$name)]
  incident_edges(wedd, vv,mode= "all") 
}
