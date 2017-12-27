require(dplyr)
require(igraph)
dtot1[1:10,]
dtot1 <- as.matrix(dtot %>% filter(Network=="Meta") %>% dplyr::select(Prey_name,Predator_name))
g <- graph_from_edgelist(dtot1[1:10,], directed  = T)

# Test motif
#
g <- graph( c(2,1,3,1,4,2,5,2,6,3,7,3,8,7,9,7) )
ecount(g)
plot(g, edge.arrow.size=.3, edge.color="orange",
vertex.color="orange", vertex.frame.color="#ffffff",
vertex.label.color="black")
#
# Calculate incoherence Q
#
ti<-TrophInd(get.adjacency(g,sparse=F))
v <- ti$TL
z <- outer(v,v,'-');
A <- get.adjacency(g,sparse=F)
xx <- A>0
x <- (A*t(z))[xx]
meanQ <- sum(x)/ecount(g) 
sdQ <- sqrt(sum((x-1)^2)/ecount(g) )


g1 <- read.delim("R/Ythan96.dat",header=FALSE)
g1 <- read.delim("R/Weddel_sea.dat",header=FALSE,sep=" ")
g <- graph_from_edgelist(as.matrix(g1[,c(2,1)]), directed  = T)
q <- calc_incoherence(g)


# Species topological roles 
#
which(triad_census(g)==1)
plot(simplify(g))


g <- erdos.renyi.game(37, 79, type="gnm",directed = TRUE)
g <- simplify(g)
V(g)$comp <- components(g)$membership
g <- induced_subgraph(g,V(g)$comp==1)
plot(g,edge.arrow.size=.4)
E(g)
V(g)
spingB<-spinglass.community(g, spins=25, gamma=1)
spingB.mem<- spingB$membership
plot_modules_TL(g,spingB)


# Calc species topological roles 
#
# Degree of all species
deg<- as.numeric(degree(g))

# within-module degree
#
# Standarized Within module degree z-score 
#
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

# Plot
colbar<- c("red","lightgreen","orange","blue","magenta","black")
colbar.FG<- c("grey","lightgreen","cyan","orange","blue","magenta","lightpink")
groups.B<- spingB.mem # 1=phytopl, 2=zoopl, 3=benthos, 4=fish, 5=birds, 6=mammals

par(mfrow=c(1,1))
par(oma=c(2.7,1.3,0.7,1)) # change outer figure margins
par(mai=c(1,1,0.7,0.7)) # size of figure margins

plot(l~r, type="n", axes=T ,tck=F, lwd=2, ann=F, cex.axis=1.2, xlim=c(0,0.8), ylim=c(-1.5,5))
lines(c(0.625,0.625), c(-1.5, 5), col="grey")
lines(c(0,0.8), c(2.5, 2.5), col="grey")
points(r, l, col=colbar.FG[groups.B], pch=20, cex=2)
mtext(2, text="Within module degree", line=4,font=2, cex=1.2)
mtext(1, text="Among module connectivity",line=4, font=2, cex=1.2)
axis(1, tck=0.02, lwd=1,las=2,lty=1, labels=F, xlim=c(0,1))
axis(2,tck=0.02, labels=FALSE)
points(r[128], l[128], cex=4, col="blue", pch=20)
points(r[144], l[144], cex=4, col="blue", pch=20)

# Among module connectivity
top <- data.frame(within_module_degree=l, among_module_conn=r)

top %>% filter(within_module_degree>2.5, among_module_conn>0.625)

sublr <- which(l>2.5)
sublr <- sublr[which(l>2.5) %in% which(r>0.625)]
l[sublr]
r[sublr]
