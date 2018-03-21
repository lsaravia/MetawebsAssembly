#include <Rcpp.h>
// [[Rcpp::plugins(cpp11)]]

using namespace Rcpp;

//#define DBG(MSG,X) Rcpp::Rcout << MSG << "\t" << X << std::endl;
#define DBG(MSG,X) 



//’ Simulation of a neutral network assembly procesess
//’
//’ @param rho metacommunity number of species
//’ @param m   migration rate (probability) from the meta-web   
//’ @param q   probability of interaction 
//’ @param a   mortality parameter for C   
//’ @return
// [[Rcpp::export]]
List neutralNetAssembly(double rho,double m, double q, double a, int time) {
  
  NumericVector S(time);
  IntegerVector LL(time);
  
  LogicalMatrix A(rho,rho);
  LogicalVector Spc(rho);
  unsigned long L=0;

  // Basal species migration 
  unsigned long BB=rpois(1,rho*m)[0];
  for(auto s=0; s<BB; s++){
    Spc[s]=true;
    S[0]=BB;
  }      
  for(auto t=1; t<time; t++){
    DBG("\n============ t:",t)
    
    // Add Species m*(rho-S)
    //

    for(auto s=0; s<rho; s++){
      auto r=runif(1)[0];
      if(r<m)
        if(!Spc[s])
          Spc[s]=true;
    }
    S[t]=sum(Spc);
    DBG("Spc:", Spc)  
    DBG("St:",S[t])
      
    // Add interactions L with probability q* S * (S-1) / 2
    //  
    for(auto i=0; i<rho; i++ ) {
      for( auto j=0; j<rho; j++) {
        if( Spc[i] && Spc[j] && i!=j){
          auto r=runif(1)[0];
          if(r<q) {
              A(j,i)=true; // j-->i
            }
          }
        }
      }
    DBG("Interactions A: \n",A)
    L = sum(A);
    DBG("L ", L)
      
    // Extinctions  a L / S^2
    //
    double e=a*L/(S[t]*S[t]);
    //e = rpois(1, e)[0];
    for(auto i=0; i<rho; i++ ) {
      if(Spc[i]){
        auto r=runif(1)[0];
        if(r<e) {
          DBG("SE EXTINGUE i ",i)
          // if species i extinct all column of interactions is deleted
          for( auto j=0; j<rho; j++) {   
            A(j,i)=false; // j-->i
          }
          // if species i extinct all row of interactions is deleted
          for( auto j=0; j<rho; j++) {   
            A(i,j)=false; // j-->i
          }
          S[t]--;
          Spc[i]=false;
        }
      }
    }
    
    DBG("Extinctions A: \n",A)
    L = sum(A);  // Borrar porque no es necesario recalcular
    DBG("L :", L)
    DBG("St:",S[t])
    DBG("Spc:",Spc)
    LL[t]=L;  
      
  }
  return List::create(Named("S") = S, 
                      Named("L") = LL,
                      Named("A") = A);
  
}


// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically 
// run after the compilation.
//

//’ Simulation of a Cascade fod web assembly procesess
//’
//’ @param rho metacommunity number of species
//’ @param m   migration rate (probability) from the meta-web   
//’ @param q   probability of interaction 
//’ @param a   mortality parameter for C   
//’ @return
// [[Rcpp::export]]
List cascadeNetAssembly(double rho,double m, double q, double a, int time) {
  
  NumericVector S(time);
  IntegerVector LL(time);
  
  LogicalMatrix A(rho,rho);
  LogicalVector Spc(rho);
  LogicalVector Bas(rho);
  unsigned long L=0;
  
  // Basal species migration 
  unsigned long BB=rpois(1,rho*m)[0];
  for(auto s=0; s<BB; s++){
    Spc[s]=true;
    Bas[s]=true;
    S[0]=BB;
  }      
  
  DBG("Bas",Bas)
    
  for(auto t=1; t<time; t++){
    DBG("\n============ t:",t)
    
    // Add Species m*(rho-S)
    //
    
    for(auto s=0; s<rho; s++){
      auto r=runif(1)[0];
      if(r<m)
        if(!Spc[s])
          Spc[s]=true;
    }
    // Update number of species
    S[t]=sum(Spc);
    DBG("Spc:", Spc)  
    DBG("Bas:",Bas)
    DBG("St:",S[t])
      
    // Add interactions Cascade model species i>j then i<--j i=predator j=prey
    //  
    for(auto i=0; i<rho; i++ ) {
      for( auto j=0; j<rho; j++) {
        if( Spc[i] && Spc[j] && i>j && !Bas[i]){
          auto r=runif(1)[0];
          if(r<q) {
            A(j,i)=true; // j-->i
          }
        }
      }
    }
    DBG("Interactions A: \n",A)
    L = sum(A);
    DBG("L ", L)
      
    // Extinctions  a L / S^2
    //
    double e=a*L/(S[t]*S[t]);
    //e = rpois(1, e)[0];
    for(auto i=0; i<rho; i++ ) {
      if(Spc[i]){
        auto r=runif(1)[0];
        if(r<e) {
          DBG("SE EXTINGUE i ",i)
          // if species i extinct all column of interactions is deleted
          for( auto j=0; j<rho; j++) {   
            A(j,i)=false; // j-->i
          }
          // if species i extinct all row of interactions is deleted
          for( auto j=0; j<rho; j++) {   
            A(i,j)=false; // j-->i
          }
          S[t]--;
          Spc[i]=false;
        }
      }
    }
    
    // Extinciones Secundarias
    //
    auto noSecondary=false;
    do{
      noSecondary=false;
      auto r=colSums(A);
      DBG("R:", r)
      for(auto i=0; i<rho; i++ ) {
        if(Spc[i]){
          if(r[i]==0) {
            if(!Bas[i]){                // if it is not basal secondary exctinction
              DBG("EXTINCION SECUNDARIA i ",i)
              for( auto j=0; j<rho; j++) {   // Delete row i (predators), column i (preys) is already 0
                A(i,j)=false; // j-->i
              }
              noSecondary=true;
              S[t]--;
              Spc[i]=false;
            }
          }
        }
      }
    } while (noSecondary);
    DBG("Extinctions A: \n",A)
    L = sum(A);  // Borrar porque no es necesario recalcular
    DBG("L :", L)
    DBG("St:",S[t])
    DBG("Spc:",Spc)
    DBG("Basal:",Bas)
    LL[t]=L;  
    
  }
  BB = sum(Bas*Spc);  
  return List::create(Named("S") = S, 
                      Named("L") = LL,
                      Named("B") = BB,
                      Named("A") = A);
  
}


/*** R
require(Rcpp)
set.seed(123)
AA <- cascadeNetAssembly(20,0.2,0.25,0.1,10)
g <- graph_from_adjacency_matrix( AA$A, mode  = "directed")
dg <- components(g)
g <- induced_subgraph(g, which(dg$membership == which.max(dg$csize)))
AA$S
AA$L
AA$B
degree(g,mode="in")
vcount(g)
TrophInd(get.adjacency(g,sparse=F))

*/
