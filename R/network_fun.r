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
  return(data_frame(rndCC=mcc,rndCP=mcp,rndMO=mmo,rndGR=mgr,SWness=mSW,SWnessCI=mCI,MOlow=qmo[1],MOhigh=qmo[2],
                    GRlow=qgr[1],GRhigh=qgr[2]))         
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
  if(is.null(ti))
      ti<-TrophInd(get.adjacency(g,sparse=FALSE))
  v <- ti$TL
  z <- outer(v,v,'-');
  A <- get.adjacency(g,sparse = FALSE)
  xx <- A>0
  x <- (A*t(z))[xx]
  #meanQ <- sum(x)/ecount(g) 
  #sdQ <- sqrt(sum((x-1)^2)/vcount(g) )
  Q <- sqrt(sum(x*x-1)/ecount(g) )
  
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
calc_incoherence_z <- function(g,ti=0,nsim=1000) {

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
    
    ind <- foreach(i=1:nsim,.combine='rbind',.inorder=FALSE,.packages='igraph',.export = 'calc_incoherence') %dopar% 
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
    return(data_frame(rndQ=rndQ,rndTI=rndTI,Qlow=qQ[1],Qhigh=qQ[2],
                      TIlow=qTI[1],TIhigh=qTI[2],zQ=zQ,zTI=zTI))         
    
    
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
  if(length(modhub)) {
    text(r[modhub],l[modhub],labels = modlbl,cex=0.7,pos=3)
  }
  
  #points(r[modhub], l[modhub], cex=4, col="blue", pch=20)
  hub_conn <- rbind(hub_conn, data.frame(type="hubcon",node=modhub,name=modlbl))  

  
  # Which are the module specialist: Few links and most of them within its own module
  #
  modhub <- which(l<=2.5)
  modhub <- modhub[which(l<=2.5) %in% which(r<=0.625)]
  modlbl <- unlist(vertex_attr(g,index=modhub))
  hub_conn <- rbind(hub_conn, data.frame(type="modspe",node=modhub,name=modlbl))  
  
  # Which are the module connectors: Few links and between modules
  #
  modhub <- which(l<=2.5)
  modhub <- modhub[which(l<=2.5) %in% which(r>0.625)]
  modlbl <- unlist(vertex_attr(g,index=modhub))
  hub_conn <- rbind(hub_conn, data.frame(type="modcon",node=modhub,name=modlbl))  
  
}



#' Plot topological roles
#'
#' @param netFrame dataframe with all the networks 
#' @param netName String with name of the food web to analyse
#' @param deadNodes Vector of strings with name of dead nodes to calculate trophic level
#' @param modulObj Igraph community object with the module organization of the food web
#' @param topoFrame dataframe with topological role and node index
#' @param legendPos position of the legend "topleft", "topright" or if "" no legend.
#'
#' @return
#' @export
#'
#' @examples

plotTopoRolesByTLByMod <- function(netFrame,netName,deadNodes,modulObj,topoFrame,legendPos=""){
  # 
  # Local 
  #
  dtot1 <- as.matrix(netFrame %>% filter(Network==netName) %>% dplyr::select(Prey_name,Predator_name))
  redl <- graph_from_edgelist(dtot1, directed  = T)
  redl <- simplify(redl)
  
  require(NetIndices)
  troph.net2<-TrophInd(get.adjacency(redl,sparse=F),Dead=deadNodes)
  layout.matrix.1<-matrix(
    nrow=length(V(redl)),  # Rows equal to the number of vertices
    ncol=2
  )
  
  # 
  # Add colors with topological roles to nodes 
  #
  require(RColorBrewer)
  colnet <- brewer.pal(4,"RdYlGn")
  
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
#'
#' @return
#' @export
#'
#' @examples
plot_NetAssemblyModel <- function(AA,timeW){
  tf <- length(AA$L)
  if(tf<timeW) stop("timeW parameter must be less than the time of the simulation")
  
  dfA <- data.frame(S=AA$S[(tf-timeW):tf],L=as.numeric(AA$L[(tf-timeW):tf]),T=c((tf-timeW):tf))
  dfA$C <- dfA$L/(dfA$S*dfA$S)
  print(ggplot(dfA, aes(x=T,y=S)) + geom_line() + theme_bw() + geom_hline(yintercept = mean(dfA$S)))
  print(ggplot(dfA, aes(x=T,y=L)) + geom_line() + theme_bw() + ylab("L") + geom_hline(yintercept = mean(dfA$L)))
  print(ggplot(dfA, aes(x=T,y=C)) + geom_line() + theme_bw() + ylab("C") + geom_hline(yintercept = mean(dfA$C)))
}


#' Title Plot net assembly model S and L average by a moving window to check if equilibrium is reached
#'
#' @param AA output of a net assembly model
#' @param timeW time window used
#'
#' @return
#' @export
#'
#' @examples
plot_NetAssemblyModel_eqw <- function(AA,timeW){

  df <- data.frame(S=AA$S,L=as.numeric(AA$L),T=c(1:tf))
  grandS <- mean(df$S[timeW:nrow(df)])
  grandL <- mean(df$L[timeW:nrow(df)])
  
  df$gr <- rep(1:(nrow(df)/timeW), each = timeW)
  df <- df %>% group_by(gr) %>% summarise(mS=mean(S),sdS=sd(S), mL=mean(L), sdL=sd(L),time=max(T))
  print(ggplot(df,aes(y=mS,x=time,colour=time))+ theme_bw() + geom_point() + geom_errorbar(aes(ymin=mS-sdS,ymax=mS+sdS)) + scale_color_distiller(palette = "RdYlGn",guide=FALSE)+ geom_hline(yintercept =grandS,linetype=3 ))
  print(ggplot(df,aes(y=mL,x=time,colour=time))+ theme_bw() + geom_point() + geom_errorbar(aes(ymin=mL-sdL,ymax=mL+sdL))+ scale_color_distiller(palette = "RdYlGn",guide=FALSE)+ geom_hline(yintercept =grandL,linetype=3 ))
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
  
  ind <- data.frame()
  require(doParallel)
  cn <-detectCores()
  #  cl <- makeCluster(cn,outfile="foreach.log") # Logfile to debug 
  cl <- makeCluster(cn)
  registerDoParallel(cl)
  ind <- foreach(i=1:nsim,.combine='rbind',.inorder=FALSE,.packages=c('MetaWebAssemblyModels','igraph'), 
                 .export = c('Adj','ext','mig','final_time','calc_incoherence')) %dopar% 
  {
    AA <- metaWebNetAssembly(Adj,mig,1,ext,final_time)
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
  
  return(data_frame(mdlCC=mcc,mdlCP=mcp,mdlMO=mmo,mdlGR=mgr,SWness=mSW,SWnessCI=mCI,MOlow=qmo[1],MOhigh=qmo[2],
                    GRlow=qgr[1],GRhigh=qgr[2], mdlQ=mdlQ,mdlTI=mdlTI,Qlow=qQ[1],Qhigh=qQ[2],
                                                 TIlow=qTI[1],TIhigh=qTI[2],zQ=zQ,zTI=zTI))         
}
