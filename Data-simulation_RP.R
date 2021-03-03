## Author: A.D. Wright
## Project: NCRN Amphibians - Monitoring Optimization
## Code: Data simulation and analysis for the Rotating Panel case study

#rm(list = ls())
#options(max.print = 1000)

## TABLE OF CONTENTS
  ## Packages, working directory, and data      15            
  ## Global parameters for simulation           29
  ## General f()'s for simulation               103
  ## Run and analyze simulations                279

#########
## Part - Packages, working directory, and data  
#########

##
#### Install Packages
##

#tidyverse
if(!require(tidyverse)) {install.packages('tidyverse');require(tidyverse)}
#jagsUI
if(!require(jagsUI)) {install.packages('jagsUI');require(jagsUI)}


#########
## Part - Global parameters for simulation
#########

set.seed(25)

##
#### Sampling dimensions
##

#Years
Y <- 10
#Sampling Occassions per Year
K <- 6
Kmed <- 4 
Klow <- 2

#Units
R <- 10
#Sites per unit 
JMax <- 100     
JMin <- 10
Jr <- as.integer(runif(n = R, min = JMin, max = JMax))

#Species Total (will vary by park)
I <- 25
M <- 25

#Datasets per scenario
#5 sampling scenarios:
scenarios <- c('stratified','indicator','rotating','split','weighted')
#5 sampling efforts: #(10%, 20%, 30%, 40%, 50%) 
effort <- c(0.1, 0.2, 0.3, 0.4, 0.5) 


##
#### Global, regional, and species parameters
##

#Global
#Unit Occupancy
mean.c0 <- 0.4      
sd.c0 <- 0.25 
#Site Occupancy
#Intercept
mean.a0.global <- 0.3 
sd.a0.global <- 0.5
sd.a0 <- 0.5
#Site effect  
mu.a1.global <- 0.8 
sd.a1.global <- 0.5
sd.a1 <- 0.5
#Year effect
mu.a2.global <- -0.4 
sd.a2.global <- 0.5
sd.a2 <- 0.5
#Autologistic effect
mu.a3.global <- 0.4 
sd.a3.global <- 0.5
sd.a3 <- 0.5
#Detection
mean.b0.global <- 0.3 
sd.b0.global <- 0.5
sd.b0 <- 0.5

##
#### Generate covaraite data
##

Site_effect_a1 <- array(rnorm(JMax*R, 0, 1), dim = c(100,10))
Year <- 1:10
Year_effect_a2 <- (Year - mean(Year))/sd(Year)


#########
## Part - General f()'s for simulation
#########


##
#### Simulation f() - A blend of Sutherland et al. 2016 S2 & simDCM
##

#Basic Function
sim_community <- function(R. = R, # of spatial units
                          I. = I, # of species
                          M. = M, # of augmented species
                          Y. = Y, # of years
                          K. = K, # of sampling occassions per year
                          JMax = max(Jr), # sites max per unit 
                          Jr. = Jr, # of sites per spatial unit
                          mean.c0. = mean.c0, sd.c0. = sd.c0,  #unit occupancy
                          mean.a0.global. = mean.a0.global, sd.a0.global. = sd.a0.global, sd.a0. = sd.a0, #mu.a0. = mu.a0, a0. = a0, #site occupancy
                          mu.a1.global. = mu.a1.global, sd.a1.global. = sd.a1.global, sd.a1. = sd.a1, #mu.a1. = mu.a1, a1. = a1, #site effect on occupancy
                          mu.a2.global. = mu.a2.global, sd.a2.global. = sd.a2.global, sd.a2. = sd.a2, #mu.a2. = mu.a2, a2. = a2, #year effect on occupancy
                          mu.a3.global. = mu.a3.global, sd.a3.global. = sd.a3.global, sd.a3. = sd.a3, #mu.a3. = mu.a3, a3. = a3, #auto effect on occupancy
                          mean.b0.global. = mean.b0.global, sd.b0.global. = sd.b0.global, sd.bo. = sd.b0, #mu.b0. = mu.b0, b0. = b0,#detection   
                          Site_effect_a1. = Site_effect_a1, Year_effect_a2. = Year_effect_a2 #covariates
){
  
  #Create empty objects for loops
  #Region (and species - in 2nd loop)
  mu.a0 <- mu.a1 <- mu.a2 <- mu.a3 <- mu.b0 <- omega <- N_unit <- array(NA, dim = R)
  a0 <- a1 <- a2 <- a3 <- b0 <- array(NA, dim = c(I+M,R))
  W_mat <- array(NA, c(I+M,R))
  Z_mat <- logit_psi <- array(NA, c(JMax, Y, I+M, R))
  X_mat <- array(NA, c(JMax, K, Y, I+M, R))
  
  #Generate park and species parameters
  for(r in 1:R){
    omega[r] <- plogis(rnorm(1,qlogis(mean.c0),sd.c0))
    #Occupancy
    mu.a0[r] <- rnorm(1, mean = qlogis(mean.a0.global), sd = sd.a0.global)
    mu.a1[r] <- rnorm(1, mean = mu.a1.global, sd = sd.a1.global)
    mu.a2[r] <- rnorm(1, mean = mu.a2.global, sd = sd.a2.global)
    mu.a3[r] <- rnorm(1, mean = mu.a3.global, sd = sd.a3.global)
    #Detection
    mu.b0[r] <- rnorm(1, mean = qlogis(mean.b0.global), sd = sd.b0.global)
    for(i in 1:(I+M)){
      W_mat[i,r] <- rbinom(1, 1, omega[r])
      #Species 
      #Occupancy
      a0[i,r] <- rnorm(1, mean = mu.a0[r], sd = sd.a0)
      a1[i,r] <- rnorm(1, mean = mu.a1[r], sd = sd.a1)
      a2[i,r] <- rnorm(1, mean = mu.a2[r], sd = sd.a2)
      a3[i,r] <- rnorm(1, mean = mu.a3[r], sd = sd.a3)
      #Detection
      b0[i,r] <- rnorm(1, mean = mu.b0[r], sd = sd.b0)
    }
    N_unit[r] <- sum(W_mat[,r])
  }

  #Generate data
  for(r in 1:R){
    for(i in 1:(I+M)){  
      for(j in 1:Jr[r]) {
        logit_psi[j,1,i,r] <- a0[i,r] + a1[i,r]*Site_effect_a1[j,r] + a2[i,r]*Year_effect_a2[1]
        Z_mat[j,1,i,r] <- rbinom(1, 1, plogis(logit_psi[j,1,i,r])*W_mat[i,r]) 
        for(y in 2:Y){
          logit_psi[j,y,i,r] <- a0[i,r] + a1[i,r]*Site_effect_a1[j,r] + a2[i,r]*Year_effect_a2[y] + a3[i,r]*Z_mat[j,y-1,i,r]
          Z_mat[j,y,i,r] <- rbinom(1, 1, plogis(logit_psi[j,y,i,r])*W_mat[i,r]) 
        } #y
        for(y in 1:Y){
          for(k in 1:K){
            X_mat[j,k,y,i,r] <- rbinom(1, 1, Z_mat[j,y,i,r]*plogis(b0[i,r]))
          } #k
        } #y
      } #j
    } #i
  } #r
  
  return(list(X_mat = X_mat, logit_psi = logit_psi, Z_mat = Z_mat,                                                     #the simulated data
              R = R, I = I, M = M, Y = Y, K = K, JMax = JMax, Jr = Jr,                                                 #the dimensions used to simulate the data
              Site_effect_a1 = Site_effect_a1, Year_effect_a2 = Year_effect_a2,                                        #the covariates used to simulate the data
              mean.c0 = mean.c0, sd.c0 = sd.c0, omega = omega, W_mat = W_mat, N_unit = N_unit,                         #the parameters used to simulate data - unit occupancy
              mean.a0.global = mean.a0.global, sd.a0.global = sd.a0.global, sd.a0 = sd.a0, mu.a0 = mu.a0, a0 = a0,     #the parameters used to simulate data - site occupancy (intercept)
              mu.a1.global = mu.a1.global, sd.a1.global = sd.a1.global, sd.a1 = sd.a1, mu.a1 = mu.a1, a1 = a1,         #the parameters used to simulate data - site occupancy (slope - site)
              mu.a2.global = mu.a2.global, sd.a2.global = sd.a2.global, sd.a2 = sd.a2, mu.a2 = mu.a2, a2 = a2,         #the parameters used to simulate data - site occupancy (slope - year)
              mu.a3.global = mu.a3.global, sd.a3.global = sd.a3.global, sd.a3 = sd.a3, mu.a3 = mu.a3, a3 = a3,         #the parameters used to simulate data - site occupancy (slope - auto)
              mean.b0.global = mean.b0.global, sd.b0.global = sd.b0.global, sd.b0 = sd.b0, mu.b0 = mu.b0, b0 = b0      #the parameters used to simulate data - detection (intercept)
  ))
  
} #f() - sim_community



##
#### Base function to create tables of results for plotting purposes
##

#This should work for both vary vs non-vary scenarios
org_results <- function(jagsOut, td){

  nPark <- td$R 
  nSpp <- dim(td$W_mat)[1]*dim(td$W_mat)[2]
  
  #Global
  simTab_g <- data.frame(mean.c0 = NA,
                         sd.c0 = NA,
                         mu.a0.global = NA, 
                         sd.a0.global = NA,
                         sd.a0 = NA,
                         mu.b0.global = NA, 
                         sd.b0.global = NA,
                         sd.b0 = NA,
                         mu.a1.global = NA,
                         sd.a1.global = NA,
                         sd.a1 = NA,
                         mu.a2.global = NA,
                         sd.a2.global = NA,
                         sd.a2 = NA,
                         mu.a3.global = NA,
                         sd.a3.global = NA,
                         sd.a3 = NA
                        )

  simTab_g$mean.c0 <- jagsOut$mean$mean.c0 - td$mean.c0
  simTab_g$sd.c0 <- jagsOut$mean$sd.c0 - td$sd.c0
  simTab_g$mu.a0.global <- jagsOut$mean$mu.a0.global - mean(td$mu.a0)  
  simTab_g$sd.a0.global <- jagsOut$mean$sd.a0.global - td$sd.a0.global
  simTab_g$sd.a0 <- jagsOut$mean$sd.a0 - td$sd.a0
  simTab_g$mu.a1.global <- jagsOut$mean$mu.a1.global - mean(td$mu.a1)   
  simTab_g$sd.a1.global <- jagsOut$mean$sd.a1.global - td$sd.a1.global
  simTab_g$sd.a1 <- jagsOut$mean$sd.a1 - td$sd.a1
  simTab_g$mu.a2.global <- jagsOut$mean$mu.a2.global - mean(td$mu.a2)   
  simTab_g$sd.a2.global <- jagsOut$mean$sd.a2.global - td$sd.a2.global
  simTab_g$sd.a2 <- jagsOut$mean$sd.a2 - td$sd.a2
  simTab_g$mu.a3.global <- jagsOut$mean$mu.a3.global - mean(td$mu.a3)   
  simTab_g$sd.a3.global <- jagsOut$mean$sd.a3.global - td$sd.a3.global
  simTab_g$sd.a3 <- jagsOut$mean$sd.a3 - td$sd.a3
  simTab_g$mu.b0.global <- jagsOut$mean$mu.b0.global - mean(td$mu.b0)  
  simTab_g$sd.b0.global <- jagsOut$mean$sd.b0.global - td$sd.b0.global
  simTab_g$sd.b0 <- jagsOut$mean$sd.b0 - td$sd.b0

  #Park
  simTab_p <- data.frame(mu.a0 = rep(NA,nPark),
                         mu.b0 = rep(NA,nPark),
                         mu.a1 = rep(NA,nPark),
                         mu.a2 = rep(NA,nPark),
                         mu.a3 = rep(NA,nPark)
                        )
  
  simTab_p$mu.a0[1:nPark] <- (jagsOut$mean$mu.a0 - apply(td$a0,2,mean)) 
  simTab_p$mu.a1[1:nPark] <- (jagsOut$mean$mu.a1 - apply(td$a1,2,mean)) 
  simTab_p$mu.a2[1:nPark] <- (jagsOut$mean$mu.a2 - apply(td$a2,2,mean)) 
  simTab_p$mu.a3[1:nPark] <- (jagsOut$mean$mu.a3 - apply(td$a3,2,mean)) 
  simTab_p$mu.b0[1:nPark] <- (jagsOut$mean$mu.b0 - apply(td$b0,2,mean)) 

  #Species
  simTab_s <- data.frame(a0 = rep(NA,nSpp),
                         b0 = rep(NA,nSpp),
                         a1 = rep(NA,nSpp),
                         a2 = rep(NA,nSpp),
                         a3 = rep(NA,nSpp)
  )

    simTab_s$a0[1:nSpp] <- as.vector(jagsOut$mean$a0*na_if(td$W_mat, 0)) - (td$a0*na_if(td$W_mat, 0)) 
    simTab_s$b0[1:nSpp] <- as.vector(jagsOut$mean$b0*na_if(td$W_mat, 0)) - (td$b0*na_if(td$W_mat, 0)) 
    simTab_s$a1[1:nSpp] <- as.vector(jagsOut$mean$a1*na_if(td$W_mat, 0)) - (td$a1*na_if(td$W_mat, 0)) 
    simTab_s$a2[1:nSpp] <- as.vector(jagsOut$mean$a2*na_if(td$W_mat, 0)) - (td$a2*na_if(td$W_mat, 0)) 
    simTab_s$a3[1:nSpp] <- as.vector(jagsOut$mean$a3*na_if(td$W_mat, 0)) - (td$a3*na_if(td$W_mat, 0)) 

  
  #Put results all together
  x <- list(global = simTab_g, park = simTab_p, species = simTab_s)
  return(x)
  
}


#########
## Part - Run and analyze simulations
#########


## Looping Variables
start <- 1
end <- 10 #Run this script 10 times in HPCC for a total of 650 sims: for i in {1..65}; do sbatch amphibianRP.sb; done
results <- maxJr_temp <- Jr_temp <- K_temp <- list()
converge <- vector()

##Loop 
for(i in start:end){ 
  
  #Remove seed so simulations in parallel are all different
  set.seed(NULL)
  
  #Simulate a data set
  td <- sim_community()
  
  ## Simulaiton specific variable
  strategy <- "rotatPan"
  effort <- 0.5
  Jr_temp[[i]] <- round(td$Jr*(effort*2)) 
  maxJr_temp[[i]] <- max(Jr_temp[[i]])
  K_temp[[i]] <- 4

  #Need to run when effort = 0.5
  #Need to rewrite Jr_temp[[6]] for loop to work
  Jr_temp[[i]][6] <- 96
  X_mat_placeholder <- td$X_mat[97:98,,,,6]
  Z_mat_placeholder <- td$Z_mat[97:98,,,6]
  
  #Need to rewrite Z_mat and W_mat based on effort for initial values  
  for(r in 1:td$R){
    for(m in 1:(td$I+td$M)){
      for(j in (Jr_temp[[i]][r]+1):td$JMax) {
        for(y in 1:td$Y){
            td$Z_mat[j,y,m,r] <- NA
          for(k in 1:6){
            td$X_mat[j,k,y,m,r] <- NA
          } #k
        } #y
      } #j
    } #i
  } #r
  
  #Need to run when effort = 0.5
  #Add X_mat and Z_mat values back in for the sites that were taken out
  td$X_mat[97:98,,,,6] <- X_mat_placeholder
  td$Z_mat[97:98,,,6] <- Z_mat_placeholder
  Jr_temp[[i]][6] <- 98
  

  #Need to remove data from sites/reps not sampling
  td$X_mat <- td$X_mat[1:maxJr_temp[[i]],1:K,1:10,1:50,1:10]
  td$Z_mat <- td$Z_mat[1:maxJr_temp[[i]],1:10,1:50,1:10]
  #Need to remove data from years not sampling certain parks
  for (z in 1:10){
    ifelse(z == 1 | z == 2 | z == 5 |z == 6 | z == 9 | z == 10,
           group <- c(3,4,7,8,10),
           group <- c(1,2,5,6,9)
    )
    td$X_mat[1:maxJr_temp[[i]],1:K,z,1:50,group] <- NA #Remove data from parks that didn't collect data
    td$Z_mat[1:maxJr_temp[[i]],z,1:50,group] <- NA #Remove data from parks that didn't collect data
  }

  
  # Organize data for jags
  jagsDat <- list(X = td$X_mat, #Detection data
                  R = td$R, I = td$I, M = td$M, Y = td$Y, K = K_temp[[i]], Jr = Jr_temp[[i]], #Looping variables
                  Site_effect_a1 = td$Site_effect_a1, Year_effect_a2 = td$Year_effect_a2 #Covariates
                  )
  
  # Compile inititial values for jags
  jagsIni <- function(){
    list(Z=td$Z_mat, W=td$W_mat) 
  }
  
  # Paramaters to monitor for jags
  jagsPar <- c('mean.c0', 'sd.c0',                                            #unit occupancy
               'mu.a0.global', 'sd.a0.global', 'sd.a0', 'mu.a0', 'a0',        #site occupancy (intercept)
               'mu.a1.global', 'sd.a1.global', 'sd.a1', 'mu.a1', 'a1',        #site occupancy (slope)
               'mu.a2.global', 'sd.a2.global', 'sd.a2', 'mu.a2', 'a2',        #site occupancy (slope)
               'mu.a3.global', 'sd.a3.global', 'sd.a3', 'mu.a3', 'a3',        #site occupancy (slope)
               'mu.b0.global', 'sd.b0.global', 'sd.b0', 'mu.b0', 'b0'         #detection (intercept)
  )
  

  #Run jags()
  jagsFit <- autojags(data = jagsDat,
                      inits = jagsIni,
                      parameters.to.save = jagsPar,
                      model.file = "mrcm_jags.txt",
                      parallel=T,
                      n.chains=3,
                      n.adapt=1000,
                      iter.increment=10000,
                      max.iter=50000,
                      n.burnin=5000,
                      n.thin=10,
                      Rhat.limit = 1.1
                    )
  
  # Append this run to one full results object
  results[[i]] <- org_results(jagsOut = jagsFit, td = td)
  converge[i] <- max(unlist(jagsFit$Rhat))
  
}# END OF LOOP


##Save results file
date <- gsub(pattern = c(":| "), replacement = "-", x = as.character(Sys.time()))

file_str <- paste("jagsFit_","Simul_", effort*100, strategy,"_",date,".R",sep="")
#Save
save(results, converge, file=file_str)


