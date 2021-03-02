## Author: A.D. Wright
## Project: NCRN Amphibians - Monitoring Optimization
## Code: Results-Plots for data simulation experiments 

#rm(list = ls())
#options(max.print = 100)

## TABLE OF CONTENTS
  ## Packages, working directory, and data      18          
  ## Status                                     358
  ## Trend                                      703  
  ## Driver/Autologistic                        1046
  ## Driver/Site-specific                       1385
  ## Combined Plots                             1724


#########
## Part - Packages, working directory, and data  
#########

##
#### Install Packages
##

if(!require(tidyverse)) {install.packages('tidyverse');require(tidyverse)}
if(!require(jagsUI)) {install.packages('jagsUI');require(jagsUI)}
if(!require(ggpubr)) {install.packages('ggpubr');require(ggpubr)}
if(!require(viridis)) {install.packages('viridis');require(viridis)}

##
#### Set Working Directory 
##

#setwd('')

##
#### Load results
##

#Change memory limit if necessary
  #https://stackoverflow.com/questions/10917532/memory-allocation-error-cannot-allocate-vector-of-size-75-1-mb
#memory.limit(size=1000000)

#Results
  #Random Strat
    #10% Effort
filenames_RS10 <- list.files(path = "Z:/NCRN-Amphibians/Monitoring_simulation/RS_10", pattern = "jagsFit", full.names = T)
load(filenames_RS10[1])
output_RS10 <- results
converge_RS10 <- converge
for(i in 2:length(filenames_RS10)){
  load(filenames_RS10[i])
  output_RS10 <- c(output_RS10, results)
  converge_RS10 <- c(converge_RS10, converge)
  }
outCon_RS10 <- output_RS10[converge_RS10 < 1.1] # length(outCon_RS10)
outCon_RS10 <- outCon_RS10[1:500]
    #20% Effort
filenames_RS20 <- list.files(path = "Z:/NCRN-Amphibians/Monitoring_simulation/RS_20", pattern = "jagsFit", full.names = T)
load(filenames_RS20[1])
output_RS20 <- results
converge_RS20 <- converge
for(i in 2:length(filenames_RS20)){
  load(filenames_RS20[i])
  output_RS20 <- c(output_RS20, results)
  converge_RS20 <- c(converge_RS20, converge)
  }
outCon_RS20 <- output_RS20[converge_RS20 < 1.1] # length(outCon_RS20)
outCon_RS20 <- outCon_RS20[1:500]
    #30% Effort
filenames_RS30 <- list.files(path = "Z:/NCRN-Amphibians/Monitoring_simulation/RS_30", pattern = "jagsFit_", full.names = T)
load(filenames_RS30[1])
output_RS30 <- results
converge_RS30 <- converge
for(i in 2:length(filenames_RS30)){
  load(filenames_RS30[i])
  output_RS30 <- c(output_RS30, results)
  converge_RS30 <- c(converge_RS30, converge)
  }
outCon_RS30 <- output_RS30[converge_RS30 < 1.1] # length(outCon_RS30)
outCon_RS30 <- outCon_RS30[1:500]
    #40% Effort
filenames_RS40 <- list.files(path = "Z:/NCRN-Amphibians/Monitoring_simulation/RS_40", pattern = "jagsFit", full.names = T)
load(filenames_RS40[1])
output_RS40 <- results
converge_RS40 <- converge
for(i in 2:length(filenames_RS40)){
  load(filenames_RS40[i])
  output_RS40 <- c(output_RS40, results)
  converge_RS40 <- c(converge_RS40, converge)
  }
outCon_RS40 <- output_RS40[converge_RS40 < 1.1] # length(outCon_RS40)
outCon_RS40 <- outCon_RS40[1:500]
    #50% Effort
filenames_RS50 <- list.files(path = "Z:/NCRN-Amphibians/Monitoring_simulation/RS_50", pattern = "jagsFit", full.names = T)
load(filenames_RS50[1])
output_RS50 <- results
converge_RS50 <- converge
for(i in 2:length(filenames_RS50)){
  load(filenames_RS50[i])
  output_RS50 <- c(output_RS50, results)
  converge_RS50 <- c(converge_RS50, converge)
  }
outCon_RS50 <- output_RS50[converge_RS50 < 1.1] # length(outCon_RS50)
outCon_RS50 <- outCon_RS50[1:500]

  #Indicator Units
    #10% Effort
filenames_IU10 <- list.files(path = "Z:/NCRN-Amphibians/Monitoring_simulation/IU_10", pattern = "jagsFit", full.names = T)
load(filenames_IU10[1])
output_IU10 <- results
converge_IU10 <- converge
for(i in 2:length(filenames_IU10)){
  load(filenames_IU10[i])
  output_IU10 <- c(output_IU10, results)
  converge_IU10 <- c(converge_IU10, converge)
  }
outCon_IU10 <- output_IU10[converge_IU10 < 1.1] # length(outCon_IU10)
outCon_IU10 <- outCon_IU10[1:500]
    #20% Effort
filenames_IU20 <- list.files(path = "Z:/NCRN-Amphibians/Monitoring_simulation/IU_20", pattern = "jagsFit", full.names = T)
load(filenames_IU20[1])
output_IU20 <- results
converge_IU20 <- converge
for(i in 2:length(filenames_IU20)){
  load(filenames_IU20[i])
  output_IU20 <- c(output_IU20, results)
  converge_IU20 <- c(converge_IU20, converge)
  }
outCon_IU20 <- output_IU20[converge_IU20 < 1.1] # length(outCon_IU20)
outCon_IU20 <- outCon_IU20[1:500]
    #30% Effort
filenames_IU30 <- list.files(path = "Z:/NCRN-Amphibians/Monitoring_simulation/IU_30", pattern = "jagsFit", full.names = T)
load(filenames_IU30[1])
output_IU30 <- results
converge_IU30 <- converge
for(i in 2:length(filenames_IU30)){
  load(filenames_IU30[i])
  output_IU30 <- c(output_IU30, results)
  converge_IU30 <- c(converge_IU30, converge)
  }
outCon_IU30 <- output_IU30[converge_IU30 < 1.1] # length(outCon_IU30)
outCon_IU30 <- outCon_IU30[1:500]
    #40% Effort
filenames_IU40 <- list.files(path = "Z:/NCRN-Amphibians/Monitoring_simulation/IU_40", pattern = "jagsFit", full.names = T)
load(filenames_IU40[1])
output_IU40 <- results
converge_IU40 <- converge
for(i in 2:length(filenames_IU40)){
  load(filenames_IU40[i])
  output_IU40 <- c(output_IU40, results)
  converge_IU40 <- c(converge_IU40, converge)
  }
outCon_IU40 <- output_IU40[converge_IU40 < 1.1] # length(outCon_IU40)
outCon_IU40 <- outCon_IU40[1:500]
    #50% Effort
filenames_IU50 <- list.files(path = "Z:/NCRN-Amphibians/Monitoring_simulation/IU_50", pattern = "jagsFit", full.names = T)
load(filenames_IU50[1])
output_IU50 <- results
converge_IU50 <- converge
for(i in 2:length(filenames_IU50)){
  load(filenames_IU50[i])
  output_IU50 <- c(output_IU50, results)
  converge_IU50 <- c(converge_IU50, converge)
  }
outCon_IU50 <- output_IU50[converge_IU50 < 1.1] # length(outCon_IU50)
outCon_IU50 <- outCon_IU50[1:500]

  #Weighted Effort
    #10% Effort
filenames_WE10 <- list.files(path = "Z:/NCRN-Amphibians/Monitoring_simulation/WE_10", pattern = "jagsFit", full.names = T)
load(filenames_WE10[1])
output_WE10 <- results
converge_WE10 <- converge
for(i in 2:length(filenames_WE10)){
  load(filenames_WE10[i])
  output_WE10 <- c(output_WE10, results)
  converge_WE10 <- c(converge_WE10, converge)
  }
outCon_WE10 <- output_WE10[converge_WE10 < 1.1] # length(outCon_WE10)
outCon_WE10 <- outCon_WE10[1:500]
  #20% Effort
filenames_WE20 <- list.files(path = "Z:/NCRN-Amphibians/Monitoring_simulation/WE_20", pattern = "jagsFit", full.names = T)
load(filenames_WE20[1])
output_WE20 <- results
converge_WE20 <- converge
for(i in 2:length(filenames_WE20)){
  load(filenames_WE20[i])
  output_WE20 <- c(output_WE20, results)
  converge_WE20 <- c(converge_WE20, converge)
  }
outCon_WE20 <- output_WE20[converge_WE20 < 1.1] # length(outCon_WE20)
outCon_WE20 <- outCon_WE20[1:500]
  #30% Effort
filenames_WE30 <- list.files(path = "Z:/NCRN-Amphibians/Monitoring_simulation/WE_30", pattern = "jagsFit", full.names = T)
load(filenames_WE30[1])
output_WE30 <- results
converge_WE30 <- converge
for(i in 2:length(filenames_WE30)){
  load(filenames_WE30[i])
  output_WE30 <- c(output_WE30, results)
  converge_WE30 <- c(converge_WE30, converge)
  }
outCon_WE30 <- output_WE30[converge_WE30 < 1.1] # length(outCon_WE30)
outCon_WE30 <- outCon_WE30[1:500]
  #40% Effort
filenames_WE40 <- list.files(path = "Z:/NCRN-Amphibians/Monitoring_simulation/WE_40", pattern = "jagsFit", full.names = T)
load(filenames_WE40[1])
output_WE40 <- results
converge_WE40 <- converge
for(i in 2:length(filenames_WE40)){
  load(filenames_WE40[i])
  output_WE40 <- c(output_WE40, results)
  converge_WE40 <- c(converge_WE40, converge)
  }
outCon_WE40 <- output_WE40[converge_WE40 < 1.1] # length(outCon_WE40)
outCon_WE40 <- outCon_WE40[1:500]
    #50% Effort
filenames_WE50 <- list.files(path = "Z:/NCRN-Amphibians/Monitoring_simulation/WE_50", pattern = "jagsFit", full.names = T)
load(filenames_WE50[1])
output_WE50 <- results
converge_WE50 <- converge
for(i in 2:length(filenames_WE50)){
  load(filenames_WE50[i])
  output_WE50 <- c(output_WE50, results)
  converge_WE50 <- c(converge_WE50, converge)
  }
outCon_WE50 <- output_WE50[converge_WE50 < 1.1] # length(outCon_WE50)
outCon_WE50 <- outCon_WE50[1:500]

  #Rotating Panel
    #10% Effort
filenames_RP10 <- list.files(path = "Z:/NCRN-Amphibians/Monitoring_simulation/RP-2_10", pattern = "jagsFit", full.names = T)
load(filenames_RP10[1])
output_RP10 <- results
converge_RP10 <- converge
for(i in 2:length(filenames_RP10)){
  load(filenames_RP10[i])
  output_RP10 <- c(output_RP10, results)
  converge_RP10 <- c(converge_RP10, converge)
  }
outCon_RP10 <- output_RP10[converge_RP10 < 1.1] # length(outCon_RP10)
outCon_RP10 <- outCon_RP10[1:500]
    #20% Effort
filenames_RP20 <- list.files(path = "Z:/NCRN-Amphibians/Monitoring_simulation/RP-2_20", pattern = "jagsFit", full.names = T)
load(filenames_RP20[1])
output_RP20 <- results
converge_RP20 <- converge
for(i in 2:length(filenames_RP20)){
  load(filenames_RP20[i])
  output_RP20 <- c(output_RP20, results)
  converge_RP20 <- c(converge_RP20, converge)
  }
outCon_RP20 <- output_RP20[converge_RP20 < 1.1] # length(outCon_RP20)
outCon_RP20 <- outCon_RP20[1:500]
    #30% Effort
filenames_RP30 <- list.files(path = "Z:/NCRN-Amphibians/Monitoring_simulation/RP-2_30", pattern = "jagsFit", full.names = T)
load(filenames_RP30[1])
output_RP30 <- results
converge_RP30 <- converge
for(i in 2:length(filenames_RP30)){
  load(filenames_RP30[i])
  output_RP30 <- c(output_RP30, results)
  converge_RP30 <- c(converge_RP30, converge)
  }
outCon_RP30 <- output_RP30[converge_RP30 < 1.1] # length(outCon_RP30)
outCon_RP30 <- outCon_RP30[1:500]
    #40% Effort
filenames_RP40 <- list.files(path = "Z:/NCRN-Amphibians/Monitoring_simulation/RP-2_40", pattern = "jagsFit", full.names = T)
load(filenames_RP40[1])
output_RP40 <- results
converge_RP40 <- converge
for(i in 2:length(filenames_RP40)){
  load(filenames_RP40[i])
  output_RP40 <- c(output_RP40, results)
  converge_RP40 <- c(converge_RP40, converge)
  }
outCon_RP40 <- output_RP40[converge_RP40 < 1.1] # length(outCon_RP40)
outCon_RP40 <- outCon_RP40[1:500]
    #50% Effort
filenames_RP50 <- list.files(path = "Z:/NCRN-Amphibians/Monitoring_simulation/RP-2_50", pattern = "jagsFit", full.names = T)
load(filenames_RP50[1])
output_RP50 <- results
converge_RP50 <- converge
for(i in 2:length(filenames_RP50)){
  load(filenames_RP50[i])
  output_RP50 <- c(output_RP50, results)
  converge_RP50 <- c(converge_RP50, converge)
  }
outCon_RP50 <- output_RP50[converge_RP50 < 1.1] # length(outCon_RP50)
outCon_RP50 <- outCon_RP50[1:500]

  #Split Panel
    #10% Effort
filenames_SP10 <- list.files(path = "Z:/NCRN-Amphibians/Monitoring_simulation/SP_10", pattern = "jagsFit", full.names = T)
load(filenames_SP10[1])
output_SP10 <- results
converge_SP10 <- converge
for(i in 2:length(filenames_SP10)){
  load(filenames_SP10[i])
  output_SP10 <- c(output_SP10, results)
  converge_SP10 <- c(converge_SP10, converge)
  }
outCon_SP10 <- output_SP10[converge_SP10 < 1.1] # length(outCon_SP10)
outCon_SP10 <- outCon_SP10[1:500]
    #20% Effort
filenames_SP20 <- list.files(path = "Z:/NCRN-Amphibians/Monitoring_simulation/SP_20", pattern = "jagsFit", full.names = T)
load(filenames_SP20[1])
output_SP20 <- results
converge_SP20 <- converge
for(i in 2:length(filenames_SP20)){
  load(filenames_SP20[i])
  output_SP20 <- c(output_SP20, results)
  converge_SP20 <- c(converge_SP20, converge)
  }
outCon_SP20 <- output_SP20[converge_SP20 < 1.1] # length(outCon_SP20)
outCon_SP20 <- outCon_SP20[1:500]
    #30% Effort
filenames_SP30 <- list.files(path = "Z:/NCRN-Amphibians/Monitoring_simulation/SP_30", pattern = "jagsFit", full.names = T)
load(filenames_SP30[1])
output_SP30 <- results
converge_SP30 <- converge
for(i in 2:length(filenames_SP30)){
  load(filenames_SP30[i])
  output_SP30 <- c(output_SP30, results)
  converge_SP30 <- c(converge_SP30, converge)
  }
outCon_SP30 <- output_SP30[converge_SP30 < 1.1] # length(outCon_SP30)
outCon_SP30 <- outCon_SP30[1:500]
    #40% Effort
filenames_SP40 <- list.files(path = "Z:/NCRN-Amphibians/Monitoring_simulation/SP_40", pattern = "jagsFit", full.names = T)
load(filenames_SP40[1])
output_SP40 <- results
converge_SP40 <- converge
for(i in 2:length(filenames_SP40)){
  load(filenames_SP40[i])
  output_SP40 <- c(output_SP40, results)
  converge_SP40 <- c(converge_SP40, converge)
  }
outCon_SP40 <- output_SP40[converge_SP40 < 1.1] # length(outCon_SP40)
outCon_SP40 <- outCon_SP40[1:500]
    #50% Effort
filenames_SP50 <- list.files(path = "Z:/NCRN-Amphibians/Monitoring_simulation/SP_50", pattern = "jagsFit", full.names = T)
load(filenames_SP50[1])
output_SP50 <- results
converge_SP50 <- converge
for(i in 2:length(filenames_SP50)){
  load(filenames_SP50[i])
  output_SP50 <- c(output_SP50, results)
  converge_SP50 <- c(converge_SP50, converge)
  }
outCon_SP50 <- output_SP50[converge_SP50 < 1.1] # length(outCon_SP50)
outCon_SP50 <- outCon_SP50[1:500]



#########
## Part - Status 
#########


##
#### Status/Global 
##

##### DATA MANAGEMENT

#RS
status_RS <- data.frame(Diff = c(unlist((lapply(outCon_RS10, function (x) x$global$mu.a0.global))),
                                 unlist((lapply(outCon_RS20, function (x) x$global$mu.a0.global))),
                                 unlist((lapply(outCon_RS30, function (x) x$global$mu.a0.global))),
                                 unlist((lapply(outCon_RS40, function (x) x$global$mu.a0.global))),
                                 unlist((lapply(outCon_RS50, function (x) x$global$mu.a0.global)))
                                 ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_RS10, function (x) x$global$mu.a0.global))))),
                                   rep(20, length(unlist((lapply(outCon_RS20, function (x) x$global$mu.a0.global))))),
                                   rep(30, length(unlist((lapply(outCon_RS30, function (x) x$global$mu.a0.global))))),
                                   rep(40, length(unlist((lapply(outCon_RS40, function (x) x$global$mu.a0.global))))),
                                   rep(50, length(unlist((lapply(outCon_RS50, function (x) x$global$mu.a0.global)))))
                                   ))
status_RS$Design <- 'Stratified Random'
#Calculating RMSE
rmse_RS_10 <- status_RS %>% filter(Effort == 10)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RS_20 <- status_RS %>% filter(Effort == 20)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RS_30 <- status_RS %>% filter(Effort == 30)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RS_40 <- status_RS %>% filter(Effort == 40)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RS_50 <- status_RS %>% filter(Effort == 50)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RS_mua0global <- data.frame(RMSE = unlist(c(rmse_RS_10,rmse_RS_20,rmse_RS_30,rmse_RS_40,rmse_RS_50)), 
                                 Effort = c(10,20,30,40,50),
                                 Design = rep('Stratified Random', 5),
                                 Parameter = 'Status',
                                 Level = "Global"
                                 )
rmse_RS_mua0global %>% summarise(mean(RMSE))

  #IU
status_IU <- data.frame(Diff = c(unlist((lapply(outCon_IU10, function (x) x$global$mu.a0.global))),
                                 unlist((lapply(outCon_IU20, function (x) x$global$mu.a0.global))),
                                 unlist((lapply(outCon_IU30, function (x) x$global$mu.a0.global))),
                                 unlist((lapply(outCon_IU40, function (x) x$global$mu.a0.global))),
                                 unlist((lapply(outCon_IU50, function (x) x$global$mu.a0.global)))
                                ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_IU10, function (x) x$global$mu.a0.global))))),
                                   rep(20, length(unlist((lapply(outCon_IU20, function (x) x$global$mu.a0.global))))),
                                   rep(30, length(unlist((lapply(outCon_IU30, function (x) x$global$mu.a0.global))))),
                                   rep(40, length(unlist((lapply(outCon_IU40, function (x) x$global$mu.a0.global))))),
                                   rep(50, length(unlist((lapply(outCon_IU50, function (x) x$global$mu.a0.global)))))
                        ))
status_IU$Design <- 'Indicator Unit'
#Calculating RMSE
rmse_IU_10 <- status_IU %>% filter(Effort == 10)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_IU_20 <- status_IU %>% filter(Effort == 20)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_IU_30 <- status_IU %>% filter(Effort == 30)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_IU_40 <- status_IU %>% filter(Effort == 40)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_IU_50 <- status_IU %>% filter(Effort == 50)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_IU_mua0global <- data.frame(RMSE = unlist(c(rmse_IU_10,rmse_IU_20,rmse_IU_30,rmse_IU_40,rmse_IU_50)), 
                                 Effort = c(10,20,30,40,50),
                                 Design = rep('Indicator Unit', 5),
                                 Parameter = 'Status',
                                 Level = "Global"
                                  )
rmse_IU_mua0global %>% summarise(mean(RMSE))

  #WE
status_WE <- data.frame(Diff = c(unlist((lapply(outCon_WE10, function (x) x$global$mu.a0.global))),
                                 unlist((lapply(outCon_WE20, function (x) x$global$mu.a0.global))),
                                 unlist((lapply(outCon_WE30, function (x) x$global$mu.a0.global))),
                                 unlist((lapply(outCon_WE40, function (x) x$global$mu.a0.global))),
                                 unlist((lapply(outCon_WE50, function (x) x$global$mu.a0.global)))
                                 ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_WE10, function (x) x$global$mu.a0.global))))),
                                   rep(20, length(unlist((lapply(outCon_WE20, function (x) x$global$mu.a0.global))))),
                                   rep(30, length(unlist((lapply(outCon_WE30, function (x) x$global$mu.a0.global))))),
                                   rep(40, length(unlist((lapply(outCon_WE40, function (x) x$global$mu.a0.global))))),
                                   rep(50, length(unlist((lapply(outCon_WE50, function (x) x$global$mu.a0.global)))))
                        ))
status_WE$Design <- 'Weighted Effort'
#RMSE
rmse_WE_10 <- status_WE %>% filter(Effort == 10)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_WE_20 <- status_WE %>% filter(Effort == 20)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_WE_30 <- status_WE %>% filter(Effort == 30)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_WE_40 <- status_WE %>% filter(Effort == 40)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_WE_50 <- status_WE %>% filter(Effort == 50)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_WE_mua0global <- data.frame(RMSE = unlist(c(rmse_WE_10,rmse_WE_20,rmse_WE_30,rmse_WE_40,rmse_WE_50)), 
                                 Effort = c(10,20,30,40,50),
                                 Design = rep('Weighted Effort', 5),
                                 Parameter = 'Status',
                                 Level = "Global"
                                  )
rmse_WE_mua0global %>% summarise(mean(RMSE))


#RP
status_RP <- data.frame(Diff = c(unlist((lapply(outCon_RP10, function (x) x$global$mu.a0.global))),
                                 unlist((lapply(outCon_RP20, function (x) x$global$mu.a0.global))),
                                 unlist((lapply(outCon_RP30, function (x) x$global$mu.a0.global))),
                                 unlist((lapply(outCon_RP40, function (x) x$global$mu.a0.global))),
                                 unlist((lapply(outCon_RP50, function (x) x$global$mu.a0.global)))
                                 ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_RP10, function (x) x$global$mu.a0.global))))),
                                   rep(20, length(unlist((lapply(outCon_RP20, function (x) x$global$mu.a0.global))))),
                                   rep(30, length(unlist((lapply(outCon_RP30, function (x) x$global$mu.a0.global))))),
                                   rep(40, length(unlist((lapply(outCon_RP40, function (x) x$global$mu.a0.global))))),
                                   rep(50, length(unlist((lapply(outCon_RP50, function (x) x$global$mu.a0.global)))))
                                   ))
status_RP$Design <- 'Rotating Panel'
#Calculating RMSE
rmse_RP_10 <- status_RP %>% filter(Effort == 10)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RP_20 <- status_RP %>% filter(Effort == 20)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RP_30 <- status_RP %>% filter(Effort == 30)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) 
rmse_RP_40 <- status_RP %>% filter(Effort == 40)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RP_50 <- status_RP %>% filter(Effort == 50)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) 
rmse_RP_mua0global <- data.frame(RMSE = unlist(c(rmse_RP_10,rmse_RP_20,rmse_RP_30,rmse_RP_40,rmse_RP_50)), 
                                 Effort = c(10,20,30,40,50),
                                 Design = rep('Rotating Panel', 5),
                                 Parameter = 'Status',
                                 Level = "Global"
                                 )
rmse_RP_mua0global %>% summarise(mean(RMSE))

#SP
status_SP <- data.frame(Diff = c(unlist((lapply(outCon_SP10, function (x) x$global$mu.a0.global))),
                                 unlist((lapply(outCon_SP20, function (x) x$global$mu.a0.global))),
                                 unlist((lapply(outCon_SP30, function (x) x$global$mu.a0.global))),
                                 unlist((lapply(outCon_SP40, function (x) x$global$mu.a0.global))),
                                 unlist((lapply(outCon_SP50, function (x) x$global$mu.a0.global)))
                                 ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_SP10, function (x) x$global$mu.a0.global))))),
                                   rep(20, length(unlist((lapply(outCon_SP20, function (x) x$global$mu.a0.global))))),
                                   rep(30, length(unlist((lapply(outCon_SP30, function (x) x$global$mu.a0.global))))),
                                   rep(40, length(unlist((lapply(outCon_SP40, function (x) x$global$mu.a0.global))))),
                                   rep(50, length(unlist((lapply(outCon_SP50, function (x) x$global$mu.a0.global)))))
                                   ))
status_SP$Design <- 'Split Panel'
#Calculating RMSE
rmse_SP_10 <- status_SP %>% filter(Effort == 10)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_SP_20 <- status_SP %>% filter(Effort == 20)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_SP_30 <- status_SP %>% filter(Effort == 30)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) 
rmse_SP_40 <- status_SP %>% filter(Effort == 40)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_SP_50 <- status_SP %>% filter(Effort == 50)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) 
rmse_SP_mua0global <- data.frame(RMSE = unlist(c(rmse_SP_10,rmse_SP_20,rmse_SP_30,rmse_SP_40,rmse_SP_50)), 
                                 Effort = c(10,20,30,40,50),
                                 Design = rep('Split Panel', 5),
                                 Parameter = 'Status',
                                 Level = "Global"
                                 )
rmse_SP_mua0global %>% summarise(mean(RMSE))


#Putting them all together
status_RMSE_Global <- rbind(rmse_RS_mua0global,rmse_WE_mua0global,rmse_RP_mua0global,rmse_SP_mua0global) #rmse_IU_mua0global,
status_RMSE_Global$Effort <- factor(status_RMSE_Global$Effort, levels=unique(status_RMSE_Global$Effort))


##### Plots

## Plot RMSE
a0_RMSE <- ggplot(data = status_RMSE_Global , aes(y = RMSE, x = Effort, color = Design)) + #, shape = Design)
            geom_point(size = 2.5, alpha = 0.75) +
            theme_bw() +
            ggtitle('Region-level') +
            theme(
              panel.border = element_rect(fill = NA, color = 'gray35'),
              panel.grid.major = element_line(color='white'),
              panel.grid.minor = element_line(color='white'),
              legend.title = element_blank(),
              legend.text = element_text(size = 10),
              plot.title = element_text(size = 10),
              axis.text.y = element_text(size = 8),
              axis.text.x = element_blank(),
              axis.title.y = element_blank(),
              axis.title.x = element_blank()
              ) +
            scale_y_continuous(breaks=c(0.04,0.05,0.06,0.07,0.08,0.09,0.1), limits = c(0.045,0.105))



##
#### Status/Park
##

##### DATA MANAGEMENT

#RS
status_RS <- data.frame(Diff = c(unlist((lapply(outCon_RS10, function (x) x$park$mu.a0))),
                                 unlist((lapply(outCon_RS20, function (x) x$park$mu.a0))),
                                 unlist((lapply(outCon_RS30, function (x) x$park$mu.a0))),
                                 unlist((lapply(outCon_RS40, function (x) x$park$mu.a0))),
                                 unlist((lapply(outCon_RS50, function (x) x$park$mu.a0)))
                        ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_RS10, function (x) x$park$mu.a0))))),
                                   rep(20, length(unlist((lapply(outCon_RS20, function (x) x$park$mu.a0))))),
                                   rep(30, length(unlist((lapply(outCon_RS30, function (x) x$park$mu.a0))))),
                                   rep(40, length(unlist((lapply(outCon_RS40, function (x) x$park$mu.a0))))),
                                   rep(50, length(unlist((lapply(outCon_RS50, function (x) x$park$mu.a0)))))
                        ))
status_RS$Design <- 'Stratified Random'
status_RS$Park <- rep(1:10, times = dim(status_RS)[1]/10)
status_RS$Park <- factor(status_RS$Park, levels=unique(status_RS$Park))
rmse_RS_mua0park <- status_RS %>% group_by(Park, Effort) %>% 
                        summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) %>% 
                        mutate(Design = 'Stratified Random', 
                               Parameter = 'Status',
                               Level = "Park")
x <- rmse_RS_mua0park %>% group_by(Park) %>% summarize(Avg = mean(RMSE))
mean(x$Avg);min(x$Avg);max(x$Avg)


#IU
status_IU <- data.frame(Diff = c(unlist((lapply(outCon_IU10, function (x) x$park$mu.a0))),
                                 unlist((lapply(outCon_IU20, function (x) x$park$mu.a0))),
                                 unlist((lapply(outCon_IU30, function (x) x$park$mu.a0))),
                                 unlist((lapply(outCon_IU40, function (x) x$park$mu.a0))),
                                 unlist((lapply(outCon_IU50, function (x) x$park$mu.a0)))
                        ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_IU10, function (x) x$park$mu.a0))))),
                                   rep(20, length(unlist((lapply(outCon_IU20, function (x) x$park$mu.a0))))),
                                   rep(30, length(unlist((lapply(outCon_IU30, function (x) x$park$mu.a0))))),
                                   rep(40, length(unlist((lapply(outCon_IU40, function (x) x$park$mu.a0))))),
                                   rep(50, length(unlist((lapply(outCon_IU50, function (x) x$park$mu.a0)))))
                        ))
status_IU$Design <- 'Indicator Unit'
status_IU$Park <- rep(1:10, times = dim(status_IU)[1]/10)
status_IU$Park <- factor(status_IU$Park, levels=unique(status_IU$Park))
#Calculating RMSE
rmse_IU_mua0park <- status_IU %>% group_by(Park, Effort) %>% 
                      summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) %>% 
                      mutate(Design = 'Indicator Unit', 
                             Parameter = 'Status',
                             Level = "Park")
x <- rmse_IU_mua0park %>% group_by(Park) %>% summarize(Avg = mean(RMSE))
mean(x$Avg);min(x$Avg);max(x$Avg)


#WE
status_WE <- data.frame(Diff = c(unlist((lapply(outCon_WE10, function (x) x$park$mu.a0))),
                                 unlist((lapply(outCon_WE20, function (x) x$park$mu.a0))),
                                 unlist((lapply(outCon_WE30, function (x) x$park$mu.a0))),
                                 unlist((lapply(outCon_WE40, function (x) x$park$mu.a0))),
                                 unlist((lapply(outCon_WE50, function (x) x$park$mu.a0)))
                        ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_WE10, function (x) x$park$mu.a0))))),
                                   rep(20, length(unlist((lapply(outCon_WE20, function (x) x$park$mu.a0))))),
                                   rep(30, length(unlist((lapply(outCon_WE30, function (x) x$park$mu.a0))))),
                                   rep(40, length(unlist((lapply(outCon_WE40, function (x) x$park$mu.a0))))),
                                   rep(50, length(unlist((lapply(outCon_WE50, function (x) x$park$mu.a0)))))
                        ))
status_WE$Design <- 'Weighted Effort'
status_WE$Park <- rep(1:10, times = dim(status_WE)[1]/10)
status_WE$Park <- factor(status_WE$Park, levels=unique(status_WE$Park))
#Calculating RMSE
rmse_WE_mua0park <- status_WE %>% group_by(Park, Effort) %>% 
                      summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) %>% 
                      mutate(Design = 'Weighted Effort', 
                             Parameter = 'Status',
                             Level = "Park")
x <- rmse_WE_mua0park %>% group_by(Park) %>% summarize(Avg = mean(RMSE))
mean(x$Avg);min(x$Avg);max(x$Avg)

#RP
status_RP <- data.frame(Diff = c(unlist((lapply(outCon_RP10, function (x) x$park$mu.a0))),
                                 unlist((lapply(outCon_RP20, function (x) x$park$mu.a0))),
                                 unlist((lapply(outCon_RP30, function (x) x$park$mu.a0))),
                                 unlist((lapply(outCon_RP40, function (x) x$park$mu.a0))),
                                 unlist((lapply(outCon_RP50, function (x) x$park$mu.a0)))
                        ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_RP10, function (x) x$park$mu.a0))))),
                                   rep(20, length(unlist((lapply(outCon_RP20, function (x) x$park$mu.a0))))),
                                   rep(30, length(unlist((lapply(outCon_RP30, function (x) x$park$mu.a0))))),
                                   rep(40, length(unlist((lapply(outCon_RP40, function (x) x$park$mu.a0))))),
                                   rep(50, length(unlist((lapply(outCon_RP50, function (x) x$park$mu.a0)))))
                        ))
status_RP$Design <- 'Rotating Panel'
status_RP$Park <- rep(1:10, times = dim(status_RP)[1]/10)
status_RP$Park <- factor(status_RP$Park, levels=unique(status_RP$Park))
#Calculating RMSE
rmse_RP_mua0park <- status_RP %>% group_by(Park, Effort) %>% 
                      summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) %>% 
                      mutate(Design = 'Rotating Panel', 
                             Parameter = 'Status',
                             Level = "Park")
x <- rmse_RP_mua0park %>% group_by(Park) %>% summarize(Avg = mean(RMSE))
mean(x$Avg);min(x$Avg);max(x$Avg)

#SP
status_SP <- data.frame(Diff = c(unlist((lapply(outCon_SP10, function (x) x$park$mu.a0))),
                                 unlist((lapply(outCon_SP20, function (x) x$park$mu.a0))),
                                 unlist((lapply(outCon_SP30, function (x) x$park$mu.a0))),
                                 unlist((lapply(outCon_SP40, function (x) x$park$mu.a0))),
                                 unlist((lapply(outCon_SP50, function (x) x$park$mu.a0)))
                        ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_SP10, function (x) x$park$mu.a0))))),
                                   rep(20, length(unlist((lapply(outCon_SP20, function (x) x$park$mu.a0))))),
                                   rep(30, length(unlist((lapply(outCon_SP30, function (x) x$park$mu.a0))))),
                                   rep(40, length(unlist((lapply(outCon_SP40, function (x) x$park$mu.a0))))),
                                   rep(50, length(unlist((lapply(outCon_SP50, function (x) x$park$mu.a0)))))
                        ))
status_SP$Design <- 'Split Panel'
status_SP$Park <- rep(1:10, times = dim(status_SP)[1]/10)
status_SP$Park <- factor(status_SP$Park, levels=unique(status_SP$Park))
#Calculating RMSE
rmse_SP_mua0park <- status_SP %>% group_by(Park, Effort) %>% 
                      summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) %>% 
                      mutate(Design = 'Split Panel', 
                             Parameter = 'Status',
                             Level = "Park")
x <- rmse_SP_mua0park %>% group_by(Park) %>% summarize(Avg = mean(RMSE))
mean(x$Avg);min(x$Avg);max(x$Avg)


##### Plots
status_RMSE_Park <- rbind(rmse_RS_mua0park,rmse_WE_mua0park,rmse_RP_mua0park,rmse_SP_mua0park) # rmse_IU_mua0park,
status_RMSE_Park$Effort <- factor(status_RMSE_Park$Effort, levels=unique(status_RMSE_Park$Effort))
status_RMSE_Park$Design <- factor(status_RMSE_Park$Design, levels=unique(status_RMSE_Park$Design))

## Plot RMSE
a0_RMSE_park <- ggplot(data = status_RMSE_Park , aes(y = RMSE, x = Effort, color = Design, fill = Design)) +
                  geom_boxplot(alpha=0.5) +
                  geom_point(position=position_dodge(width=0.75),aes(group=Design)) +
                  theme_bw() +
                  ggtitle('Unit-level') +
                  theme(
                    panel.border = element_rect(fill = NA, color = 'gray35'),
                    panel.grid.major = element_line(color='white'),
                    panel.grid.minor = element_line(color='white'),
                    legend.title = element_blank(),
                    legend.text = element_text(size = 10),
                    plot.title = element_text(size = 10),
                    axis.text.y = element_text(size = 8),
                    axis.text.x = element_blank(),
                    axis.title.y = element_blank(),
                    axis.title.x = element_blank()
                    ) +
                    scale_y_continuous(breaks=c(0.1,0.2,0.3,0.4)) +
                    theme(legend.position = 'none') 
a0_RMSE_park <- annotate_figure(a0_RMSE_park,
                                right = text_grob("Status (a0)", rot = 270, size = 10)
                                )



#########
## Part - Trend   
#########

##
#### Global
##

###### DATA MANGEMENT 

#RS
trend_RS <- data.frame(Diff = c(unlist((lapply(outCon_RS10, function (x) x$global$mu.a2.global))),
                                 unlist((lapply(outCon_RS20, function (x) x$global$mu.a2.global))),
                                 unlist((lapply(outCon_RS30, function (x) x$global$mu.a2.global))),
                                 unlist((lapply(outCon_RS40, function (x) x$global$mu.a2.global))),
                                 unlist((lapply(outCon_RS50, function (x) x$global$mu.a2.global)))
                                ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_RS10, function (x) x$global$mu.a2.global))))),
                                   rep(20, length(unlist((lapply(outCon_RS20, function (x) x$global$mu.a2.global))))),
                                   rep(30, length(unlist((lapply(outCon_RS30, function (x) x$global$mu.a2.global))))),
                                   rep(40, length(unlist((lapply(outCon_RS40, function (x) x$global$mu.a2.global))))),
                                   rep(50, length(unlist((lapply(outCon_RS50, function (x) x$global$mu.a2.global)))))
                                 ))
trend_RS$Design <- 'Stratified Random'
  #Calculating RMSE
rmse_RS_10 <- trend_RS %>% filter(Effort == 10)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RS_20 <- trend_RS %>% filter(Effort == 20)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RS_30 <- trend_RS %>% filter(Effort == 30)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RS_40 <- trend_RS %>% filter(Effort == 40)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RS_50 <- trend_RS %>% filter(Effort == 50)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RS_mua2global <- data.frame(RMSE = unlist(c(rmse_RS_10,rmse_RS_20,rmse_RS_30,rmse_RS_40,rmse_RS_50)), 
                                 Effort = c(10,20,30,40,50),
                                 Design = rep('Stratified Random', 5),
                                 Parameter = 'Trend',
                                 Level = "Global"
                                )
rmse_RS_mua2global %>% summarise(mean(RMSE))

#IU
trend_IU <- data.frame(Diff = c(unlist((lapply(outCon_IU10, function (x) x$global$mu.a2.global))),
                                 unlist((lapply(outCon_IU20, function (x) x$global$mu.a2.global))),
                                 unlist((lapply(outCon_IU30, function (x) x$global$mu.a2.global))),
                                 unlist((lapply(outCon_IU40, function (x) x$global$mu.a2.global))),
                                 unlist((lapply(outCon_IU50, function (x) x$global$mu.a2.global)))
                                 ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_IU10, function (x) x$global$mu.a2.global))))),
                                   rep(20, length(unlist((lapply(outCon_IU20, function (x) x$global$mu.a2.global))))),
                                   rep(30, length(unlist((lapply(outCon_IU30, function (x) x$global$mu.a2.global))))),
                                   rep(40, length(unlist((lapply(outCon_IU40, function (x) x$global$mu.a2.global))))),
                                   rep(50, length(unlist((lapply(outCon_IU50, function (x) x$global$mu.a2.global)))))
                        ))
trend_IU$Design <- 'Indicator Unit'
  #Calculating RMSE
rmse_IU_10 <- trend_IU %>% filter(Effort == 10)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_IU_20 <- trend_IU %>% filter(Effort == 20)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_IU_30 <- trend_IU %>% filter(Effort == 30)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_IU_40 <- trend_IU %>% filter(Effort == 40)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_IU_50 <- trend_IU %>% filter(Effort == 50)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_IU_mua2global <- data.frame(RMSE = unlist(c(rmse_IU_10,rmse_IU_20,rmse_IU_30,rmse_IU_40,rmse_IU_50)), 
                                 Effort = c(10,20,30,40,50),
                                 Design = rep('Indicator Unit', 5),
                                 Parameter = 'Trend',
                                 Level = "Global"
                                )
rmse_IU_mua2global %>% summarise(mean(RMSE))

#WE
trend_WE <- data.frame(Diff = c(unlist((lapply(outCon_WE10, function (x) x$global$mu.a2.global))),
                                 unlist((lapply(outCon_WE20, function (x) x$global$mu.a2.global))),
                                 unlist((lapply(outCon_WE30, function (x) x$global$mu.a2.global))),
                                 unlist((lapply(outCon_WE40, function (x) x$global$mu.a2.global))),
                                 unlist((lapply(outCon_WE50, function (x) x$global$mu.a2.global)))
                                ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_WE10, function (x) x$global$mu.a2.global))))),
                                   rep(20, length(unlist((lapply(outCon_WE20, function (x) x$global$mu.a2.global))))),
                                   rep(30, length(unlist((lapply(outCon_WE30, function (x) x$global$mu.a2.global))))),
                                   rep(40, length(unlist((lapply(outCon_WE40, function (x) x$global$mu.a2.global))))),
                                   rep(50, length(unlist((lapply(outCon_WE50, function (x) x$global$mu.a2.global)))))
                        ))
trend_WE$Design <- 'Weighted Effort'
  #RMSE
rmse_WE_10 <- trend_WE %>% filter(Effort == 10)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_WE_20 <- trend_WE %>% filter(Effort == 20)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_WE_30 <- trend_WE %>% filter(Effort == 30)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_WE_40 <- trend_WE %>% filter(Effort == 40)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_WE_50 <- trend_WE %>% filter(Effort == 50)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_WE_mua2global <- data.frame(RMSE = unlist(c(rmse_WE_10,rmse_WE_20,rmse_WE_30,rmse_WE_40,rmse_WE_50)), 
                                 Effort = c(10,20,30,40,50),
                                 Design = rep('Weighted Effort', 5),
                                 Parameter = 'Trend',
                                 Level = "Global"
                                )
rmse_WE_mua2global %>% summarise(mean(RMSE))

#RP
trend_RP <- data.frame(Diff = c(unlist((lapply(outCon_RP10, function (x) x$global$mu.a2.global))),
                                 unlist((lapply(outCon_RP20, function (x) x$global$mu.a2.global))),
                                 unlist((lapply(outCon_RP30, function (x) x$global$mu.a2.global))),
                                 unlist((lapply(outCon_RP40, function (x) x$global$mu.a2.global))),
                                 unlist((lapply(outCon_RP50, function (x) x$global$mu.a2.global)))
                                ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_RP10, function (x) x$global$mu.a2.global))))),
                                   rep(20, length(unlist((lapply(outCon_RP20, function (x) x$global$mu.a2.global))))),
                                   rep(30, length(unlist((lapply(outCon_RP30, function (x) x$global$mu.a2.global))))),
                                   rep(40, length(unlist((lapply(outCon_RP40, function (x) x$global$mu.a2.global))))),
                                   rep(50, length(unlist((lapply(outCon_RP50, function (x) x$global$mu.a2.global)))))
                                 ))
trend_RP$Design <- 'Rotating Panel'
  #Calculating RMSE
rmse_RP_10 <- trend_RP %>% filter(Effort == 10)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RP_20 <- trend_RP %>% filter(Effort == 20)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RP_30 <- trend_RP %>% filter(Effort == 30)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) 
rmse_RP_40 <- trend_RP %>% filter(Effort == 40)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RP_50 <- trend_RP %>% filter(Effort == 50)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) 
rmse_RP_mua2global <- data.frame(RMSE = unlist(c(rmse_RP_10,rmse_RP_20,rmse_RP_30,rmse_RP_40,rmse_RP_50)), 
                                 Effort = c(10,20,30,40,50),
                                 Design = rep('Rotating Panel', 5),
                                 Parameter = 'Trend',
                                 Level = "Global"
                                )
rmse_RP_mua2global %>% summarise(mean(RMSE))

#SP
trend_SP <- data.frame(Diff = c(unlist((lapply(outCon_SP10, function (x) x$global$mu.a2.global))),
                                 unlist((lapply(outCon_SP20, function (x) x$global$mu.a2.global))),
                                 unlist((lapply(outCon_SP30, function (x) x$global$mu.a2.global))),
                                 unlist((lapply(outCon_SP40, function (x) x$global$mu.a2.global))),
                                 unlist((lapply(outCon_SP50, function (x) x$global$mu.a2.global)))
                                ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_SP10, function (x) x$global$mu.a2.global))))),
                                   rep(20, length(unlist((lapply(outCon_SP20, function (x) x$global$mu.a2.global))))),
                                   rep(30, length(unlist((lapply(outCon_SP30, function (x) x$global$mu.a2.global))))),
                                   rep(40, length(unlist((lapply(outCon_SP40, function (x) x$global$mu.a2.global))))),
                                   rep(50, length(unlist((lapply(outCon_SP50, function (x) x$global$mu.a2.global)))))
                                 ))
trend_SP$Design <- 'Split Panel'
  #Calculating RMSE
rmse_SP_10 <- trend_SP %>% filter(Effort == 10)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_SP_20 <- trend_SP %>% filter(Effort == 20)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_SP_30 <- trend_SP %>% filter(Effort == 30)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) 
rmse_SP_40 <- trend_SP %>% filter(Effort == 40)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_SP_50 <- trend_SP %>% filter(Effort == 50)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) 
rmse_SP_mua2global <- data.frame(RMSE = unlist(c(rmse_SP_10,rmse_SP_20,rmse_SP_30,rmse_SP_40,rmse_SP_50)), 
                                 Effort = c(10,20,30,40,50),
                                 Design = rep('Split Panel', 5),
                                 Parameter = 'Trend',
                                 Level = "Global"
                                )
rmse_SP_mua2global %>% summarise(mean(RMSE))


# Putting it all together
trend_RMSE_Global <- rbind(rmse_RS_mua2global,rmse_WE_mua2global,rmse_RP_mua2global,rmse_SP_mua2global) #rmse_IU_mua2global,
trend_RMSE_Global$Effort <- factor(trend_RMSE_Global$Effort, levels=unique(trend_RMSE_Global$Effort))


##### Plots

## Plot RMSE
a2_RMSE <- ggplot(data = trend_RMSE_Global , aes(y = RMSE, x = Effort, color = Design)) + 
              geom_point(size = 2.5, alpha = 0.75) +
              theme_bw() +
              theme(
                panel.border = element_rect(fill = NA, color = 'gray35'),
                panel.grid.major = element_line(color='white'),
                panel.grid.minor = element_line(color='white'),
                legend.title = element_blank(),
                legend.text = element_text(size = 10),
                axis.text.y = element_text(size = 8),
                axis.text.x = element_blank(),
                axis.title.y = element_blank(),
                axis.title.x = element_blank()
                ) +
              scale_y_continuous(breaks=c(0.04,0.05,0.06,0.07), limits = c(0.04,0.07))



##
#### Trend/Park
##

##### DATA MANAGEMENT

#RS
trend_RS <- data.frame(Diff = c(unlist((lapply(outCon_RS10, function (x) x$park$mu.a2))),
                                 unlist((lapply(outCon_RS20, function (x) x$park$mu.a2))),
                                 unlist((lapply(outCon_RS30, function (x) x$park$mu.a2))),
                                 unlist((lapply(outCon_RS40, function (x) x$park$mu.a2))),
                                 unlist((lapply(outCon_RS50, function (x) x$park$mu.a2)))
                        ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_RS10, function (x) x$park$mu.a2))))),
                                   rep(20, length(unlist((lapply(outCon_RS20, function (x) x$park$mu.a2))))),
                                   rep(30, length(unlist((lapply(outCon_RS30, function (x) x$park$mu.a2))))),
                                   rep(40, length(unlist((lapply(outCon_RS40, function (x) x$park$mu.a2))))),
                                   rep(50, length(unlist((lapply(outCon_RS50, function (x) x$park$mu.a2)))))
                        ))
trend_RS$Design <- 'Stratified Random'
trend_RS$Park <- rep(1:10, times = dim(trend_RS)[1]/10)
trend_RS$Park <- factor(trend_RS$Park, levels=unique(trend_RS$Park))
#Calculating RMSE
rmse_RS_mua2park <- trend_RS %>% group_by(Park, Effort) %>% 
                        summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) %>% 
                        mutate(Design = 'Stratified Random', 
                               Parameter = 'Trend',
                               Level = "Park")
x <- rmse_RS_mua2park %>% group_by(Park) %>% summarize(Avg = mean(RMSE))
mean(x$Avg);min(x$Avg);max(x$Avg)

#IU
trend_IU <- data.frame(Diff = c(unlist((lapply(outCon_IU10, function (x) x$park$mu.a2))),
                                 unlist((lapply(outCon_IU20, function (x) x$park$mu.a2))),
                                 unlist((lapply(outCon_IU30, function (x) x$park$mu.a2))),
                                 unlist((lapply(outCon_IU40, function (x) x$park$mu.a2))),
                                 unlist((lapply(outCon_IU50, function (x) x$park$mu.a2)))
                        ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_IU10, function (x) x$park$mu.a2))))),
                                   rep(20, length(unlist((lapply(outCon_IU20, function (x) x$park$mu.a2))))),
                                   rep(30, length(unlist((lapply(outCon_IU30, function (x) x$park$mu.a2))))),
                                   rep(40, length(unlist((lapply(outCon_IU40, function (x) x$park$mu.a2))))),
                                   rep(50, length(unlist((lapply(outCon_IU50, function (x) x$park$mu.a2)))))
                        ))
trend_IU$Design <- 'Indicator Unit'
trend_IU$Park <- rep(1:10, times = dim(trend_IU)[1]/10)
trend_IU$Park <- factor(trend_IU$Park, levels=unique(trend_IU$Park))
#Calculating RMSE
rmse_IU_mua2park <- trend_IU %>% group_by(Park, Effort) %>% 
                      summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) %>% 
                      mutate(Design = 'Indicator Unit', 
                             Parameter = 'Status',
                             Level = "Park")
x <- rmse_IU_mua2park %>% group_by(Park) %>% summarize(Avg = mean(RMSE))
mean(x$Avg);min(x$Avg);max(x$Avg)


#WE
trend_WE <- data.frame(Diff = c(unlist((lapply(outCon_WE10, function (x) x$park$mu.a2))),
                                 unlist((lapply(outCon_WE20, function (x) x$park$mu.a2))),
                                 unlist((lapply(outCon_WE30, function (x) x$park$mu.a2))),
                                 unlist((lapply(outCon_WE40, function (x) x$park$mu.a2))),
                                 unlist((lapply(outCon_WE50, function (x) x$park$mu.a2)))
                        ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_WE10, function (x) x$park$mu.a2))))),
                                   rep(20, length(unlist((lapply(outCon_WE20, function (x) x$park$mu.a2))))),
                                   rep(30, length(unlist((lapply(outCon_WE30, function (x) x$park$mu.a2))))),
                                   rep(40, length(unlist((lapply(outCon_WE40, function (x) x$park$mu.a2))))),
                                   rep(50, length(unlist((lapply(outCon_WE50, function (x) x$park$mu.a2)))))
                        ))
trend_WE$Design <- 'Weighted Effort'
trend_WE$Park <- rep(1:10, times = dim(trend_WE)[1]/10)
trend_WE$Park <- factor(trend_WE$Park, levels=unique(trend_WE$Park))
#Calculating RMSE
rmse_WE_mua2park <- trend_WE %>% group_by(Park, Effort) %>% 
                      summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) %>% 
                      mutate(Design = 'Weighted Effort', 
                             Parameter = 'Trend',
                             Level = "Park")
x <- rmse_WE_mua2park %>% group_by(Park) %>% summarize(Avg = mean(RMSE))
mean(x$Avg);min(x$Avg);max(x$Avg)



#RP
trend_RP <- data.frame(Diff = c(unlist((lapply(outCon_RP10, function (x) x$park$mu.a2))),
                                 unlist((lapply(outCon_RP20, function (x) x$park$mu.a2))),
                                 unlist((lapply(outCon_RP30, function (x) x$park$mu.a2))),
                                 unlist((lapply(outCon_RP40, function (x) x$park$mu.a2))),
                                 unlist((lapply(outCon_RP50, function (x) x$park$mu.a2)))
                        ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_RP10, function (x) x$park$mu.a2))))),
                                   rep(20, length(unlist((lapply(outCon_RP20, function (x) x$park$mu.a2))))),
                                   rep(30, length(unlist((lapply(outCon_RP30, function (x) x$park$mu.a2))))),
                                   rep(40, length(unlist((lapply(outCon_RP40, function (x) x$park$mu.a2))))),
                                   rep(50, length(unlist((lapply(outCon_RP50, function (x) x$park$mu.a2)))))
                        ))
trend_RP$Design <- 'Rotating Panel'
trend_RP$Park <- rep(1:10, times = dim(trend_RP)[1]/10)
trend_RP$Park <- factor(trend_RP$Park, levels=unique(trend_RP$Park))
#Calculating RMSE
rmse_RP_mua2park <- trend_RP %>% group_by(Park, Effort) %>% 
                        summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) %>% 
                        mutate(Design = 'Rotating Panel', 
                               Parameter = 'Trend',
                               Level = "Park")
x <- rmse_RP_mua2park %>% group_by(Park) %>% summarize(Avg = mean(RMSE))
mean(x$Avg);min(x$Avg);max(x$Avg)

#SP
trend_SP <- data.frame(Diff = c(unlist((lapply(outCon_SP10, function (x) x$park$mu.a2))),
                                 unlist((lapply(outCon_SP20, function (x) x$park$mu.a2))),
                                 unlist((lapply(outCon_SP30, function (x) x$park$mu.a2))),
                                 unlist((lapply(outCon_SP40, function (x) x$park$mu.a2))),
                                 unlist((lapply(outCon_SP50, function (x) x$park$mu.a2)))
                        ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_SP10, function (x) x$park$mu.a2))))),
                                   rep(20, length(unlist((lapply(outCon_SP20, function (x) x$park$mu.a2))))),
                                   rep(30, length(unlist((lapply(outCon_SP30, function (x) x$park$mu.a2))))),
                                   rep(40, length(unlist((lapply(outCon_SP40, function (x) x$park$mu.a2))))),
                                   rep(50, length(unlist((lapply(outCon_SP50, function (x) x$park$mu.a2)))))
                        ))
trend_SP$Design <- 'Split Panel'
trend_SP$Park <- rep(1:10, times = dim(trend_SP)[1]/10)
trend_SP$Park <- factor(trend_SP$Park, levels=unique(trend_SP$Park))
#Calculating RMSE
rmse_SP_mua2park <- trend_SP %>% group_by(Park, Effort) %>% 
                        summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) %>% 
                        mutate(Design = 'Split Panel', 
                               Parameter = 'Trend',
                               Level = "Park")
x <- rmse_SP_mua2park %>% group_by(Park) %>% summarize(Avg = mean(RMSE))
mean(x$Avg);min(x$Avg);max(x$Avg)


## Put it all together
trend_RMSE_Park <- rbind(rmse_RS_mua2park,rmse_WE_mua2park, rmse_RP_mua2park, rmse_SP_mua2park) #rmse_IU_mua2park,
trend_RMSE_Park$Effort <- factor(trend_RMSE_Park$Effort, levels=unique(trend_RMSE_Park$Effort))
trend_RMSE_Park$Design <- factor(trend_RMSE_Park$Design, levels=unique(trend_RMSE_Park$Design))

##### Plots

## Plot RMSE
a2_RMSE_park <- ggplot(data = trend_RMSE_Park , aes(y = RMSE, x = Effort, color = Design, fill = Design)) +
                  geom_boxplot(alpha=0.5) +
                  geom_point(position=position_dodge(width=0.75),aes(group=Design)) +
                  theme_bw() +
                  theme(
                    panel.border = element_rect(fill = NA, color = 'gray35'),
                    panel.grid.major = element_line(color='white'),
                    panel.grid.minor = element_line(color='white'),
                    legend.title = element_blank(),
                    legend.text = element_text(size = 10),
                    axis.text.y = element_text(size = 8),
                    axis.text.x = element_blank(),
                    axis.title.y = element_blank(),
                    axis.title.x = element_blank()
                    ) +
                    scale_y_continuous(breaks=c(0.1,0.2)) +
                    theme(legend.position = 'none') 
a2_RMSE_park <- annotate_figure(a2_RMSE_park,
                                right = text_grob("Trend (a1)", rot = 270, size = 10)
                                )



#########
## Part - Driver/Autologistic  
#########


## Global
#RS
drive2_RS <- data.frame(Diff = c(unlist((lapply(outCon_RS10, function (x) x$global$mu.a3.global))),
                                 unlist((lapply(outCon_RS20, function (x) x$global$mu.a3.global))),
                                 unlist((lapply(outCon_RS30, function (x) x$global$mu.a3.global))),
                                 unlist((lapply(outCon_RS40, function (x) x$global$mu.a3.global))),
                                 unlist((lapply(outCon_RS50, function (x) x$global$mu.a3.global)))
                                ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_RS10, function (x) x$global$mu.a3.global))))),
                                   rep(20, length(unlist((lapply(outCon_RS20, function (x) x$global$mu.a3.global))))),
                                   rep(30, length(unlist((lapply(outCon_RS30, function (x) x$global$mu.a3.global))))),
                                   rep(40, length(unlist((lapply(outCon_RS40, function (x) x$global$mu.a3.global))))),
                                   rep(50, length(unlist((lapply(outCon_RS50, function (x) x$global$mu.a3.global)))))
                        ))
drive2_RS$Design <- 'Stratified Random'
#Calculating RMSE
rmse_RS_10 <- drive2_RS %>% filter(Effort == 10)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RS_20 <- drive2_RS %>% filter(Effort == 20)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RS_30 <- drive2_RS %>% filter(Effort == 30)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RS_40 <- drive2_RS %>% filter(Effort == 40)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RS_50 <- drive2_RS %>% filter(Effort == 50)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RS_mua3global <- data.frame(RMSE = unlist(c(rmse_RS_10,rmse_RS_20,rmse_RS_30,rmse_RS_40,rmse_RS_50)), 
                                 Effort = c(10,20,30,40,50),
                                 Design = rep('Stratified Random', 5),
                                 Parameter = 'Autlogistic',
                                 Level = "Global"
                                )
rmse_RS_mua3global %>% summarise(mean(RMSE))


#IU
drive2_IU <- data.frame(Diff = c(unlist((lapply(outCon_IU10, function (x) x$global$mu.a3.global))),
                                 unlist((lapply(outCon_IU20, function (x) x$global$mu.a3.global))),
                                 unlist((lapply(outCon_IU30, function (x) x$global$mu.a3.global))),
                                 unlist((lapply(outCon_IU40, function (x) x$global$mu.a3.global))),
                                 unlist((lapply(outCon_IU50, function (x) x$global$mu.a3.global)))
                        ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_IU10, function (x) x$global$mu.a3.global))))),
                                   rep(20, length(unlist((lapply(outCon_IU20, function (x) x$global$mu.a3.global))))),
                                   rep(30, length(unlist((lapply(outCon_IU30, function (x) x$global$mu.a3.global))))),
                                   rep(40, length(unlist((lapply(outCon_IU40, function (x) x$global$mu.a3.global))))),
                                   rep(50, length(unlist((lapply(outCon_IU50, function (x) x$global$mu.a3.global)))))
                        ))
drive2_IU$Design <- 'Indicator Unit'
#Calculating RMSE
rmse_IU_10 <- drive2_IU %>% filter(Effort == 10)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_IU_20 <- drive2_IU %>% filter(Effort == 20)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_IU_30 <- drive2_IU %>% filter(Effort == 30)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_IU_40 <- drive2_IU %>% filter(Effort == 40)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_IU_50 <- drive2_IU %>% filter(Effort == 50)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_IU_mua3global <- data.frame(RMSE = unlist(c(rmse_IU_10,rmse_IU_20,rmse_IU_30,rmse_IU_40,rmse_IU_50)), 
                                 Effort = c(10,20,30,40,50),
                                 Design = rep('Indicator Unit', 5),
                                 Parameter = 'Autologistic',
                                 Level = "Global"
                                )
rmse_IU_mua3global %>% summarise(mean(RMSE))


#WE
drive2_WE <- data.frame(Diff = c(unlist((lapply(outCon_WE10, function (x) x$global$mu.a3.global))),
                                 unlist((lapply(outCon_WE20, function (x) x$global$mu.a3.global))),
                                 unlist((lapply(outCon_WE30, function (x) x$global$mu.a3.global))),
                                 unlist((lapply(outCon_WE40, function (x) x$global$mu.a3.global))),
                                 unlist((lapply(outCon_WE50, function (x) x$global$mu.a3.global)))
                        ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_WE10, function (x) x$global$mu.a3.global))))),
                                   rep(20, length(unlist((lapply(outCon_WE20, function (x) x$global$mu.a3.global))))),
                                   rep(30, length(unlist((lapply(outCon_WE30, function (x) x$global$mu.a3.global))))),
                                   rep(40, length(unlist((lapply(outCon_WE40, function (x) x$global$mu.a3.global))))),
                                   rep(50, length(unlist((lapply(outCon_WE50, function (x) x$global$mu.a3.global)))))
                        ))
drive2_WE$Design <- 'Weighted Effort'
#RMSE
rmse_WE_10 <- drive2_WE %>% filter(Effort == 10)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_WE_20 <- drive2_WE %>% filter(Effort == 20)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_WE_30 <- drive2_WE %>% filter(Effort == 30)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_WE_40 <- drive2_WE %>% filter(Effort == 40)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_WE_50 <- drive2_WE %>% filter(Effort == 50)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_WE_mua3global <- data.frame(RMSE = unlist(c(rmse_WE_10,rmse_WE_20,rmse_WE_30,rmse_WE_40,rmse_WE_50)), 
                                 Effort = c(10,20,30,40,50),
                                 Design = rep('Weighted Effort', 5),
                                 Parameter = 'Autlogisitc',
                                 Level = "Global"
                                )
rmse_WE_mua3global %>% summarise(mean(RMSE))

#RP
drive2_RP <- data.frame(Diff = c(unlist((lapply(outCon_RP10, function (x) x$global$mu.a3.global))),
                                 unlist((lapply(outCon_RP20, function (x) x$global$mu.a3.global))),
                                 unlist((lapply(outCon_RP30, function (x) x$global$mu.a3.global))),
                                 unlist((lapply(outCon_RP40, function (x) x$global$mu.a3.global))),
                                 unlist((lapply(outCon_RP50, function (x) x$global$mu.a3.global)))
                                ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_RP10, function (x) x$global$mu.a3.global))))),
                                   rep(20, length(unlist((lapply(outCon_RP20, function (x) x$global$mu.a3.global))))),
                                   rep(30, length(unlist((lapply(outCon_RP30, function (x) x$global$mu.a3.global))))),
                                   rep(40, length(unlist((lapply(outCon_RP40, function (x) x$global$mu.a3.global))))),
                                   rep(50, length(unlist((lapply(outCon_RP50, function (x) x$global$mu.a3.global)))))
                        ))
drive2_RP$Design <- 'Rotating Panel'
#Calculating RMSE
rmse_RP_10 <- drive2_RP %>% filter(Effort == 10)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RP_20 <- drive2_RP %>% filter(Effort == 20)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RP_30 <- drive2_RP %>% filter(Effort == 30)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) ##NEED TO EDIT
rmse_RP_40 <- drive2_RP %>% filter(Effort == 40)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RP_50 <- drive2_RP %>% filter(Effort == 50)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) ##NEED TO EDIT
rmse_RP_mua3global <- data.frame(RMSE = unlist(c(rmse_RP_10,rmse_RP_20,rmse_RP_30,rmse_RP_40,rmse_RP_50)), 
                                 Effort = c(10,20,30,40,50),
                                 Design = rep('Rotating Panel', 5),
                                 Parameter = 'Autlogistic',
                                 Level = "Global"
                                )
rmse_RP_mua3global %>% summarise(mean(RMSE))

#SP
drive2_SP <- data.frame(Diff = c(unlist((lapply(outCon_SP10, function (x) x$global$mu.a3.global))),
                                 unlist((lapply(outCon_SP20, function (x) x$global$mu.a3.global))),
                                 unlist((lapply(outCon_SP30, function (x) x$global$mu.a3.global))),
                                 unlist((lapply(outCon_SP40, function (x) x$global$mu.a3.global))),
                                 unlist((lapply(outCon_SP50, function (x) x$global$mu.a3.global)))
                                ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_SP10, function (x) x$global$mu.a3.global))))),
                                   rep(20, length(unlist((lapply(outCon_SP20, function (x) x$global$mu.a3.global))))),
                                   rep(30, length(unlist((lapply(outCon_SP30, function (x) x$global$mu.a3.global))))),
                                   rep(40, length(unlist((lapply(outCon_SP40, function (x) x$global$mu.a3.global))))),
                                   rep(50, length(unlist((lapply(outCon_SP50, function (x) x$global$mu.a3.global)))))
                        ))
drive2_SP$Design <- 'Split Panel'
#Calculating RMSE
rmse_SP_10 <- drive2_SP %>% filter(Effort == 10)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_SP_20 <- drive2_SP %>% filter(Effort == 20)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_SP_30 <- drive2_SP %>% filter(Effort == 30)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) ##NEED TO EDIT
rmse_SP_40 <- drive2_SP %>% filter(Effort == 40)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_SP_50 <- drive2_SP %>% filter(Effort == 50)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) ##NEED TO EDIT
rmse_SP_mua3global <- data.frame(RMSE = unlist(c(rmse_SP_10,rmse_SP_20,rmse_SP_30,rmse_SP_40,rmse_SP_50)), 
                                 Effort = c(10,20,30,40,50),
                                 Design = rep('Split Panel', 5),
                                 Parameter = 'Autlogistic',
                                 Level = "Global"
                                )
rmse_SP_mua3global %>% summarise(mean(RMSE))


#Putting them all together
drive2_RMSE_Global <- rbind(rmse_RS_mua3global,rmse_WE_mua3global,rmse_RP_mua3global,rmse_SP_mua3global) #rmse_IU_mua3global,
drive2_RMSE_Global$Effort <- factor(drive2_RMSE_Global$Effort, levels=unique(drive2_RMSE_Global$Effort))


##### Plots

## Plot RMSE
a3_RMSE <- ggplot(data = drive2_RMSE_Global , aes(y = RMSE, x = Effort, color = Design)) +
              geom_point(size = 2.5, alpha = 0.75) +
              theme_bw() +
              theme(
                panel.border = element_rect(fill = NA, color = 'gray35'),
                panel.grid.major = element_line(color='white'),
                panel.grid.minor = element_line(color='white'),
                legend.title = element_blank(),
                legend.text = element_text(size = 10),
                axis.text.y = element_text(size = 8),
                axis.text.x = element_text(size = 8),
                axis.title.y = element_blank(),
                axis.title.x = element_blank()
              ) +
            scale_y_continuous(breaks=c(0.05,0.1,0.15), limits = c(0.05,0.16))



##
#### Drive2/Park
##

##### DATA MANAGEMENT

#RS
drive2_RS <- data.frame(Diff = c(unlist((lapply(outCon_RS10, function (x) x$park$mu.a3))),
                                 unlist((lapply(outCon_RS20, function (x) x$park$mu.a3))),
                                 unlist((lapply(outCon_RS30, function (x) x$park$mu.a3))),
                                 unlist((lapply(outCon_RS40, function (x) x$park$mu.a3))),
                                 unlist((lapply(outCon_RS50, function (x) x$park$mu.a3)))
                        ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_RS10, function (x) x$park$mu.a3))))),
                                   rep(20, length(unlist((lapply(outCon_RS20, function (x) x$park$mu.a3))))),
                                   rep(30, length(unlist((lapply(outCon_RS30, function (x) x$park$mu.a3))))),
                                   rep(40, length(unlist((lapply(outCon_RS40, function (x) x$park$mu.a3))))),
                                   rep(50, length(unlist((lapply(outCon_RS50, function (x) x$park$mu.a3)))))
                        ))
drive2_RS$Design <- 'Stratified Random'
drive2_RS$Park <- rep(1:10, times = dim(drive2_RS)[1]/10)
drive2_RS$Park <- factor(drive2_RS$Park, levels=unique(drive2_RS$Park))
#Calculating RMSE
rmse_RS_mua3park <- drive2_RS %>% group_by(Park, Effort) %>% 
                        summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) %>% 
                        mutate(Design = 'Stratified Random', 
                               Parameter = 'Autologistic',
                               Level = "Park")
x <- rmse_RS_mua3park %>% group_by(Park) %>% summarize(Avg = mean(RMSE))
mean(x$Avg);min(x$Avg);max(x$Avg)


#IU
drive2_IU <- data.frame(Diff = c(unlist((lapply(outCon_IU10, function (x) x$park$mu.a3))),
                                 unlist((lapply(outCon_IU20, function (x) x$park$mu.a3))),
                                 unlist((lapply(outCon_IU30, function (x) x$park$mu.a3))),
                                 unlist((lapply(outCon_IU40, function (x) x$park$mu.a3))),
                                 unlist((lapply(outCon_IU50, function (x) x$park$mu.a3)))
                        ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_IU10, function (x) x$park$mu.a3))))),
                                   rep(20, length(unlist((lapply(outCon_IU20, function (x) x$park$mu.a3))))),
                                   rep(30, length(unlist((lapply(outCon_IU30, function (x) x$park$mu.a3))))),
                                   rep(40, length(unlist((lapply(outCon_IU40, function (x) x$park$mu.a3))))),
                                   rep(50, length(unlist((lapply(outCon_IU50, function (x) x$park$mu.a3)))))
                        ))
drive2_IU$Design <- 'Indicator Unit'
drive2_IU$Park <- rep(1:10, times = dim(drive2_IU)[1]/10)
drive2_IU$Park <- factor(drive2_IU$Park, levels=unique(drive2_IU$Park))
#Calculating RMSE
rmse_IU_mua3park <- drive2_IU %>% group_by(Park, Effort) %>% 
                      summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) %>% 
                      mutate(Design = 'Indicator Unit', 
                             Parameter = 'Autologistic',
                             Level = "Park")
x <- rmse_IU_mua3park %>% group_by(Park) %>% summarize(Avg = mean(RMSE))
mean(x$Avg);min(x$Avg);max(x$Avg)

#WE
drive2_WE <- data.frame(Diff = c(unlist((lapply(outCon_WE10, function (x) x$park$mu.a3))),
                                 unlist((lapply(outCon_WE20, function (x) x$park$mu.a3))),
                                 unlist((lapply(outCon_WE30, function (x) x$park$mu.a3))),
                                 unlist((lapply(outCon_WE40, function (x) x$park$mu.a3))),
                                 unlist((lapply(outCon_WE50, function (x) x$park$mu.a3)))
                        ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_WE10, function (x) x$park$mu.a3))))),
                                   rep(20, length(unlist((lapply(outCon_WE20, function (x) x$park$mu.a3))))),
                                   rep(30, length(unlist((lapply(outCon_WE30, function (x) x$park$mu.a3))))),
                                   rep(40, length(unlist((lapply(outCon_WE40, function (x) x$park$mu.a3))))),
                                   rep(50, length(unlist((lapply(outCon_WE50, function (x) x$park$mu.a3)))))
                        ))
drive2_WE$Design <- 'Weighted Effort'
drive2_WE$Park <- rep(1:10, times = dim(drive2_WE)[1]/10)
drive2_WE$Park <- factor(drive2_WE$Park, levels=unique(drive2_WE$Park))
#Calculating RMSE
rmse_WE_mua3park <- drive2_WE %>% group_by(Park, Effort) %>% 
                      summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) %>% 
                      mutate(Design = 'Weighted Effort', 
                             Parameter = 'Autologistic',
                             Level = "Park")
x <- rmse_WE_mua3park %>% group_by(Park) %>% summarize(Avg = mean(RMSE))
mean(x$Avg);min(x$Avg);max(x$Avg)


#RP
drive2_RP <- data.frame(Diff = c(unlist((lapply(outCon_RP10, function (x) x$park$mu.a3))),
                                 unlist((lapply(outCon_RP20, function (x) x$park$mu.a3))),
                                 unlist((lapply(outCon_RP30, function (x) x$park$mu.a3))),
                                 unlist((lapply(outCon_RP40, function (x) x$park$mu.a3))),
                                 unlist((lapply(outCon_RP50, function (x) x$park$mu.a3)))
                        ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_RP10, function (x) x$park$mu.a3))))),
                                   rep(20, length(unlist((lapply(outCon_RP20, function (x) x$park$mu.a3))))),
                                   rep(30, length(unlist((lapply(outCon_RP30, function (x) x$park$mu.a3))))),
                                   rep(40, length(unlist((lapply(outCon_RP40, function (x) x$park$mu.a3))))),
                                   rep(50, length(unlist((lapply(outCon_RP50, function (x) x$park$mu.a3)))))
                        ))
drive2_RP$Design <- 'Rotating Panel'
drive2_RP$Park <- rep(1:10, times = dim(drive2_RP)[1]/10)
drive2_RP$Park <- factor(drive2_RP$Park, levels=unique(drive2_RP$Park))
#Calculating RMSE
rmse_RP_mua3park <- drive2_RP %>% group_by(Park, Effort) %>% 
                        summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) %>% 
                        mutate(Design = 'Rotating Panel', 
                               Parameter = 'Autologistic',
                               Level = "Park")
x <- rmse_RP_mua3park %>% group_by(Park) %>% summarize(Avg = mean(RMSE))
mean(x$Avg);min(x$Avg);max(x$Avg)

#SP
drive2_SP <- data.frame(Diff = c(unlist((lapply(outCon_SP10, function (x) x$park$mu.a3))),
                                 unlist((lapply(outCon_SP20, function (x) x$park$mu.a3))),
                                 unlist((lapply(outCon_SP30, function (x) x$park$mu.a3))),
                                 unlist((lapply(outCon_SP40, function (x) x$park$mu.a3))),
                                 unlist((lapply(outCon_SP50, function (x) x$park$mu.a3)))
                        ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_SP10, function (x) x$park$mu.a3))))),
                                   rep(20, length(unlist((lapply(outCon_SP20, function (x) x$park$mu.a3))))),
                                   rep(30, length(unlist((lapply(outCon_SP30, function (x) x$park$mu.a3))))),
                                   rep(40, length(unlist((lapply(outCon_SP40, function (x) x$park$mu.a3))))),
                                   rep(50, length(unlist((lapply(outCon_SP50, function (x) x$park$mu.a3)))))
                        ))
drive2_SP$Design <- 'Split Panel'
drive2_SP$Park <- rep(1:10, times = dim(drive2_SP)[1]/10)
drive2_SP$Park <- factor(drive2_SP$Park, levels=unique(drive2_SP$Park))
#Calculating RMSE
rmse_SP_mua3park <- drive2_SP %>% group_by(Park, Effort) %>% 
                        summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) %>% 
                        mutate(Design = 'Split Panel', 
                               Parameter = 'Autologistic',
                               Level = "Park")
x <- rmse_SP_mua3park %>% group_by(Park) %>% summarize(Avg = mean(RMSE))
mean(x$Avg);min(x$Avg);max(x$Avg)


## Put it all together
drive2_RMSE_Park <- rbind(rmse_RS_mua3park,rmse_WE_mua3park,rmse_RP_mua3park,rmse_SP_mua3park) #rmse_IU_mua3park,
drive2_RMSE_Park$Effort <- factor(drive2_RMSE_Park$Effort, levels=unique(drive2_RMSE_Park$Effort))
drive2_RMSE_Park$Design <- factor(drive2_RMSE_Park$Design, levels=unique(drive2_RMSE_Park$Design))


##### Plots

## Plot RMSE
a3_RMSE_park <- ggplot(data = drive2_RMSE_Park , aes(y = RMSE, x = Effort, color = Design, fill = Design)) +
                  geom_boxplot(alpha=0.5) +
                  geom_point(position=position_dodge(width=0.75),aes(group=Design)) +
                  theme_bw() +
                  theme(
                    panel.border = element_rect(fill = NA, color = 'gray35'),
                    panel.grid.major = element_line(color='white'),
                    panel.grid.minor = element_line(color='white'),
                    legend.title = element_blank(),
                    legend.text = element_text(size = 10),
                    axis.text.y = element_text(size = 8),
                    axis.text.x = element_text(size = 8),
                    axis.title.y = element_blank(),
                    axis.title.x = element_blank()
                    ) +
                    theme(legend.position = 'none') 
a3_RMSE_park <- annotate_figure(a3_RMSE_park,
                                right = text_grob("Driver (a3)", rot = 270, size = 10)
                                )


#########
## Part - Driver/Site-specific   
#########


## Global
#RS
drive1_RS <- data.frame(Diff = c(unlist((lapply(outCon_RS10, function (x) x$global$mu.a1.global))),
                                 unlist((lapply(outCon_RS20, function (x) x$global$mu.a1.global))),
                                 unlist((lapply(outCon_RS30, function (x) x$global$mu.a1.global))),
                                 unlist((lapply(outCon_RS40, function (x) x$global$mu.a1.global))),
                                 unlist((lapply(outCon_RS50, function (x) x$global$mu.a1.global)))
                        ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_RS10, function (x) x$global$mu.a1.global))))),
                                   rep(20, length(unlist((lapply(outCon_RS20, function (x) x$global$mu.a1.global))))),
                                   rep(30, length(unlist((lapply(outCon_RS30, function (x) x$global$mu.a1.global))))),
                                   rep(40, length(unlist((lapply(outCon_RS40, function (x) x$global$mu.a1.global))))),
                                   rep(50, length(unlist((lapply(outCon_RS50, function (x) x$global$mu.a1.global)))))
                        ))
drive1_RS$Design <- 'Stratified Random'
#RMSE
rmse_RS_10 <- drive1_RS %>% filter(Effort == 10)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RS_20 <- drive1_RS %>% filter(Effort == 20)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RS_30 <- drive1_RS %>% filter(Effort == 30)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RS_40 <- drive1_RS %>% filter(Effort == 40)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RS_50 <- drive1_RS %>% filter(Effort == 50)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RS_mua1global <- data.frame(RMSE = unlist(c(rmse_RS_10,rmse_RS_20,rmse_RS_30,rmse_RS_40,rmse_RS_50)), 
                                 Effort = c(10,20,30,40,50),
                                 Design = rep('Stratified Random', 5),
                                 Parameter = 'Site-specific',
                                 Level = "Global"
                                )
rmse_RS_mua1global %>% summarise(mean(RMSE))


#IU
drive1_IU <- data.frame(Diff = c(unlist((lapply(outCon_IU10, function (x) x$global$mu.a1.global))),
                                 unlist((lapply(outCon_IU20, function (x) x$global$mu.a1.global))),
                                 unlist((lapply(outCon_IU30, function (x) x$global$mu.a1.global))),
                                 unlist((lapply(outCon_IU40, function (x) x$global$mu.a1.global))),
                                 unlist((lapply(outCon_IU50, function (x) x$global$mu.a1.global)))
                        ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_IU10, function (x) x$global$mu.a1.global))))),
                                   rep(20, length(unlist((lapply(outCon_IU20, function (x) x$global$mu.a1.global))))),
                                   rep(30, length(unlist((lapply(outCon_IU30, function (x) x$global$mu.a1.global))))),
                                   rep(40, length(unlist((lapply(outCon_IU40, function (x) x$global$mu.a1.global))))),
                                   rep(50, length(unlist((lapply(outCon_IU50, function (x) x$global$mu.a1.global)))))
                        ))
drive1_IU$Design <- 'Indicator Unit'
#Calculating RMSE
rmse_IU_10 <- drive1_IU %>% filter(Effort == 10)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_IU_20 <- drive1_IU %>% filter(Effort == 20)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_IU_30 <- drive1_IU %>% filter(Effort == 30)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_IU_40 <- drive1_IU %>% filter(Effort == 40)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_IU_50 <- drive1_IU %>% filter(Effort == 50)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_IU_mua1global <- data.frame(RMSE = unlist(c(rmse_IU_10,rmse_IU_20,rmse_IU_30,rmse_IU_40,rmse_IU_50)), 
                                 Effort = c(10,20,30,40,50),
                                 Design = rep('Indicator Unit', 5),
                                 Parameter = 'Site-specific',
                                 Level = "Global"
                                  )
rmse_IU_mua1global %>% summarise(mean(RMSE))


#WE
drive1_WE <- data.frame(Diff = c(unlist((lapply(outCon_WE10, function (x) x$global$mu.a1.global))),
                                 unlist((lapply(outCon_WE20, function (x) x$global$mu.a1.global))),
                                 unlist((lapply(outCon_WE30, function (x) x$global$mu.a1.global))),
                                 unlist((lapply(outCon_WE40, function (x) x$global$mu.a1.global))),
                                 unlist((lapply(outCon_WE50, function (x) x$global$mu.a1.global)))
                        ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_WE10, function (x) x$global$mu.a1.global))))),
                                   rep(20, length(unlist((lapply(outCon_WE20, function (x) x$global$mu.a1.global))))),
                                   rep(30, length(unlist((lapply(outCon_WE30, function (x) x$global$mu.a1.global))))),
                                   rep(40, length(unlist((lapply(outCon_WE40, function (x) x$global$mu.a1.global))))),
                                   rep(50, length(unlist((lapply(outCon_WE50, function (x) x$global$mu.a1.global)))))
                        ))
drive1_WE$Design <- 'Weighted Effort'
#Calculating RMSE
rmse_WE_10 <- drive1_WE %>% filter(Effort == 10)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_WE_20 <- drive1_WE %>% filter(Effort == 20)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_WE_30 <- drive1_WE %>% filter(Effort == 30)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_WE_40 <- drive1_WE %>% filter(Effort == 40)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_WE_50 <- drive1_WE %>% filter(Effort == 50)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_WE_mua1global <- data.frame(RMSE = unlist(c(rmse_WE_10,rmse_WE_20,rmse_WE_30,rmse_WE_40,rmse_WE_50)), 
                                 Effort = c(10,20,30,40,50),
                                 Design = rep('Weighted Effort', 5),
                                 Parameter = 'Site-specific',
                                 Level = "Global"
                                )
rmse_WE_mua1global %>% summarise(mean(RMSE))


#RP
drive1_RP <- data.frame(Diff = c(unlist((lapply(outCon_RP10, function (x) x$global$mu.a1.global))),
                                 unlist((lapply(outCon_RP20, function (x) x$global$mu.a1.global))),
                                 unlist((lapply(outCon_RP30, function (x) x$global$mu.a1.global))),
                                 unlist((lapply(outCon_RP40, function (x) x$global$mu.a1.global))),
                                 unlist((lapply(outCon_RP50, function (x) x$global$mu.a1.global)))
                        ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_RP10, function (x) x$global$mu.a1.global))))),
                                   rep(20, length(unlist((lapply(outCon_RP20, function (x) x$global$mu.a1.global))))),
                                   rep(30, length(unlist((lapply(outCon_RP30, function (x) x$global$mu.a1.global))))),
                                   rep(40, length(unlist((lapply(outCon_RP40, function (x) x$global$mu.a1.global))))),
                                   rep(50, length(unlist((lapply(outCon_RP50, function (x) x$global$mu.a1.global)))))
                        ))
drive1_RP$Design <- 'Rotating Panel'
#RMSE
rmse_RP_10 <- drive1_RP %>% filter(Effort == 10)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RP_20 <- drive1_RP %>% filter(Effort == 20)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RP_30 <- drive1_RP %>% filter(Effort == 30)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RP_40 <- drive1_RP %>% filter(Effort == 40)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RP_50 <- drive1_RP %>% filter(Effort == 50)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_RP_mua1global <- data.frame(RMSE = unlist(c(rmse_RP_10,rmse_RP_20,rmse_RP_30,rmse_RP_40,rmse_RP_50)), 
                                 Effort = c(10,20,30,40,50),
                                 Design = rep('Rotating Panel', 5),
                                 Parameter = 'Site-specific',
                                 Level = "Global"
                                )
rmse_RP_mua1global %>% summarise(mean(RMSE))


#SP
drive1_SP <- data.frame(Diff = c(unlist((lapply(outCon_SP10, function (x) x$global$mu.a1.global))),
                                 unlist((lapply(outCon_SP20, function (x) x$global$mu.a1.global))),
                                 unlist((lapply(outCon_SP30, function (x) x$global$mu.a1.global))),
                                 unlist((lapply(outCon_SP40, function (x) x$global$mu.a1.global))),
                                 unlist((lapply(outCon_SP50, function (x) x$global$mu.a1.global)))
                        ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_SP10, function (x) x$global$mu.a1.global))))),
                                   rep(20, length(unlist((lapply(outCon_SP20, function (x) x$global$mu.a1.global))))),
                                   rep(30, length(unlist((lapply(outCon_SP30, function (x) x$global$mu.a1.global))))),
                                   rep(40, length(unlist((lapply(outCon_SP40, function (x) x$global$mu.a1.global))))),
                                   rep(50, length(unlist((lapply(outCon_SP50, function (x) x$global$mu.a1.global)))))
                        ))
drive1_SP$Design <- 'Split Panel'
#RMSE
rmse_SP_10 <- drive1_SP %>% filter(Effort == 10)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_SP_20 <- drive1_SP %>% filter(Effort == 20)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_SP_30 <- drive1_SP %>% filter(Effort == 30)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_SP_40 <- drive1_SP %>% filter(Effort == 40)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_SP_50 <- drive1_SP %>% filter(Effort == 50)  %>% summarize(RMSE = (sqrt((1/500)*(sum(Diff^2)))))
rmse_SP_mua1global <- data.frame(RMSE = unlist(c(rmse_SP_10,rmse_SP_20,rmse_SP_30,rmse_SP_40,rmse_SP_50)), 
                                 Effort = c(10,20,30,40,50),
                                 Design = rep('Split Panel', 5),
                                 Parameter = 'Site-specific',
                                 Level = "Global"
                                )
rmse_SP_mua1global %>% summarise(mean(RMSE))



#Putting them all together
drive1_RMSE_Global <- rbind(rmse_RS_mua1global,rmse_WE_mua1global,rmse_RP_mua1global,rmse_SP_mua1global) #rmse_IU_mua1global,
drive1_RMSE_Global$Effort <- factor(drive1_RMSE_Global$Effort, levels=unique(drive1_RMSE_Global$Effort))


## Plot RMSE
a1_RMSE <- ggplot(data = drive1_RMSE_Global , aes(y = RMSE, x = Effort, color = Design)) +
            geom_point(size = 2.5, alpha = 0.75) +
            theme_bw() +
            theme(
              panel.border = element_rect(fill = NA, color = 'gray35'),
              panel.grid.major = element_line(color='white'),
              panel.grid.minor = element_line(color='white'),
              legend.title = element_blank(),
              legend.text = element_text(size = 10),
              axis.text.y = element_text(size = 8),
              axis.text.x = element_blank(),
              axis.title.y = element_blank(),
              axis.title.x = element_blank()
            ) +
            scale_y_continuous(breaks=c(0.04,0.06,0.08,0.1), limits = c(0.04,0.1)) 



##
#### Drive1/Park
##

##### DATA MANAGEMENT

#RS
drive1_RS <- data.frame(Diff = c(unlist((lapply(outCon_RS10, function (x) x$park$mu.a1))),
                                 unlist((lapply(outCon_RS20, function (x) x$park$mu.a1))),
                                 unlist((lapply(outCon_RS30, function (x) x$park$mu.a1))),
                                 unlist((lapply(outCon_RS40, function (x) x$park$mu.a1))),
                                 unlist((lapply(outCon_RS50, function (x) x$park$mu.a1)))
                        ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_RS10, function (x) x$park$mu.a1))))),
                                   rep(20, length(unlist((lapply(outCon_RS20, function (x) x$park$mu.a1))))),
                                   rep(30, length(unlist((lapply(outCon_RS30, function (x) x$park$mu.a1))))),
                                   rep(40, length(unlist((lapply(outCon_RS40, function (x) x$park$mu.a1))))),
                                   rep(50, length(unlist((lapply(outCon_RS50, function (x) x$park$mu.a1)))))
                        ))
drive1_RS$Design <- 'Stratified Random'
drive1_RS$Park <- rep(1:10, times = dim(drive1_RS)[1]/10)
drive1_RS$Park <- factor(drive1_RS$Park, levels=unique(drive1_RS$Park))
#Calculating RMSE
rmse_RS_mua1park <- drive1_RS %>% group_by(Park, Effort) %>% 
                        summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) %>% 
                        mutate(Design = 'Stratified Random', 
                               Parameter = 'Site Effect',
                               Level = "Park")
x <- rmse_RS_mua1park %>% group_by(Park) %>% summarize(Avg = mean(RMSE))
mean(x$Avg);min(x$Avg);max(x$Avg)

#IU
drive1_IU <- data.frame(Diff = c(unlist((lapply(outCon_IU10, function (x) x$park$mu.a1))),
                                 unlist((lapply(outCon_IU20, function (x) x$park$mu.a1))),
                                 unlist((lapply(outCon_IU30, function (x) x$park$mu.a1))),
                                 unlist((lapply(outCon_IU40, function (x) x$park$mu.a1))),
                                 unlist((lapply(outCon_IU50, function (x) x$park$mu.a1)))
                        ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_IU10, function (x) x$park$mu.a1))))),
                                   rep(20, length(unlist((lapply(outCon_IU20, function (x) x$park$mu.a1))))),
                                   rep(30, length(unlist((lapply(outCon_IU30, function (x) x$park$mu.a1))))),
                                   rep(40, length(unlist((lapply(outCon_IU40, function (x) x$park$mu.a1))))),
                                   rep(50, length(unlist((lapply(outCon_IU50, function (x) x$park$mu.a1)))))
                        ))
drive1_IU$Design <- 'Indicator Unit'
drive1_IU$Park <- rep(1:10, times = dim(drive1_IU)[1]/10)
drive1_IU$Park <- factor(drive1_IU$Park, levels=unique(drive1_IU$Park))
#Calculating RMSE
rmse_IU_mua1park <- drive1_IU %>% group_by(Park, Effort) %>% 
                      summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) %>% 
                      mutate(Design = 'Indicator Unit', 
                             Parameter = 'Site Effect',
                             Level = "Park")
x <- rmse_IU_mua1park %>% group_by(Park) %>% summarize(Avg = mean(RMSE))
mean(x$Avg);min(x$Avg);max(x$Avg)

#WE
drive1_WE <- data.frame(Diff = c(unlist((lapply(outCon_WE10, function (x) x$park$mu.a1))),
                                 unlist((lapply(outCon_WE20, function (x) x$park$mu.a1))),
                                 unlist((lapply(outCon_WE30, function (x) x$park$mu.a1))),
                                 unlist((lapply(outCon_WE40, function (x) x$park$mu.a1))),
                                 unlist((lapply(outCon_WE50, function (x) x$park$mu.a1)))
                        ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_WE10, function (x) x$park$mu.a1))))),
                                   rep(20, length(unlist((lapply(outCon_WE20, function (x) x$park$mu.a1))))),
                                   rep(30, length(unlist((lapply(outCon_WE30, function (x) x$park$mu.a1))))),
                                   rep(40, length(unlist((lapply(outCon_WE40, function (x) x$park$mu.a1))))),
                                   rep(50, length(unlist((lapply(outCon_WE50, function (x) x$park$mu.a1)))))
                        ))
drive1_WE$Design <- 'Weighted Effort'
drive1_WE$Park <- rep(1:10, times = dim(drive1_WE)[1]/10)
drive1_WE$Park <- factor(drive1_WE$Park, levels=unique(drive1_WE$Park))
#Calculating RMSE
rmse_WE_mua1park <- drive1_WE %>% group_by(Park, Effort) %>% 
                      summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) %>% 
                      mutate(Design = 'Weighted Effort', 
                             Parameter = 'Site Effect',
                             Level = "Park")
x <- rmse_WE_mua1park %>% group_by(Park) %>% summarize(Avg = mean(RMSE))
mean(x$Avg);min(x$Avg);max(x$Avg)


#RP
drive1_RP <- data.frame(Diff = c(unlist((lapply(outCon_RP10, function (x) x$park$mu.a1))),
                                 unlist((lapply(outCon_RP20, function (x) x$park$mu.a1))),
                                 unlist((lapply(outCon_RP30, function (x) x$park$mu.a1))),
                                 unlist((lapply(outCon_RP40, function (x) x$park$mu.a1))),
                                 unlist((lapply(outCon_RP50, function (x) x$park$mu.a1)))
                        ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_RP10, function (x) x$park$mu.a1))))),
                                   rep(20, length(unlist((lapply(outCon_RP20, function (x) x$park$mu.a1))))),
                                   rep(30, length(unlist((lapply(outCon_RP30, function (x) x$park$mu.a1))))),
                                   rep(40, length(unlist((lapply(outCon_RP40, function (x) x$park$mu.a1))))),
                                   rep(50, length(unlist((lapply(outCon_RP50, function (x) x$park$mu.a1)))))
                        ))
drive1_RP$Design <- 'Rotating Panel'
drive1_RP$Park <- rep(1:10, times = dim(drive1_RP)[1]/10)
drive1_RP$Park <- factor(drive1_RP$Park, levels=unique(drive1_RP$Park))
#Calculating RMSE
rmse_RP_mua1park <- drive1_RP %>% group_by(Park, Effort) %>% 
                        summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) %>% 
                        mutate(Design = 'Rotating Panel', 
                               Parameter = 'Site Effect',
                               Level = "Park")
x <- rmse_RP_mua1park %>% group_by(Park) %>% summarize(Avg = mean(RMSE))
mean(x$Avg);min(x$Avg);max(x$Avg)

#SP
drive1_SP <- data.frame(Diff = c(unlist((lapply(outCon_SP10, function (x) x$park$mu.a1))),
                                 unlist((lapply(outCon_SP20, function (x) x$park$mu.a1))),
                                 unlist((lapply(outCon_SP30, function (x) x$park$mu.a1))),
                                 unlist((lapply(outCon_SP40, function (x) x$park$mu.a1))),
                                 unlist((lapply(outCon_SP50, function (x) x$park$mu.a1)))
                        ),
                        Effort = c(rep(10, length(unlist((lapply(outCon_SP10, function (x) x$park$mu.a1))))),
                                   rep(20, length(unlist((lapply(outCon_SP20, function (x) x$park$mu.a1))))),
                                   rep(30, length(unlist((lapply(outCon_SP30, function (x) x$park$mu.a1))))),
                                   rep(40, length(unlist((lapply(outCon_SP40, function (x) x$park$mu.a1))))),
                                   rep(50, length(unlist((lapply(outCon_SP50, function (x) x$park$mu.a1)))))
                        ))
drive1_SP$Design <- 'Split Panel'
drive1_SP$Park <- rep(1:10, times = dim(drive1_SP)[1]/10)
drive1_SP$Park <- factor(drive1_SP$Park, levels=unique(drive1_SP$Park))
#Calculating RMSE
rmse_SP_mua1park <- drive1_SP %>% group_by(Park, Effort) %>% 
                        summarize(RMSE = (sqrt((1/500)*(sum(Diff^2))))) %>% 
                        mutate(Design = 'Split Panel', 
                               Parameter = 'Site Effect',
                               Level = "Park")
x <- rmse_SP_mua1park %>% group_by(Park) %>% summarize(Avg = mean(RMSE))
mean(x$Avg);min(x$Avg);max(x$Avg)


## Put it all together
drive1_RMSE_Park <- rbind(rmse_RS_mua1park,rmse_WE_mua1park,rmse_RP_mua1park,rmse_SP_mua1park) #rmse_IU_mua1park,
drive1_RMSE_Park$Effort <- factor(drive1_RMSE_Park$Effort, levels=unique(drive1_RMSE_Park$Effort))
drive1_RMSE_Park$Design <- factor(drive1_RMSE_Park$Design, levels=unique(drive1_RMSE_Park$Design))


##### Plots

## Plot RMSE
a1_RMSE_park <- ggplot(data = drive1_RMSE_Park , aes(y = RMSE, x = Effort, color = Design, fill = Design)) +
                  geom_boxplot(alpha=0.5) +
                  geom_point(position=position_dodge(width=0.75),aes(group=Design)) +
                  theme_bw() +
                  theme(
                    panel.border = element_rect(fill = NA, color = 'gray35'),
                    panel.grid.major = element_line(color='white'),
                    panel.grid.minor = element_line(color='white'),
                    legend.title = element_blank(),
                    legend.text = element_text(size = 10),
                    axis.text.y = element_text(size = 8),
                    axis.text.x = element_blank(),
                    axis.title.y = element_blank(),
                    axis.title.x = element_blank()
                    ) +
                    theme(legend.position = 'none') 
a1_RMSE_park <- annotate_figure(a1_RMSE_park,
                                right = text_grob("Driver (a2)", rot = 270, size = 10)
                                )


#########
## Part - Combined Plots 
#########

#http://www.sthda.com/english/articles/24-ggpubr-publication-ready-plots/81-ggplot2-easy-way-to-mix-multiple-graphs-on-the-same-page/#annotate-the-arranged-figure

figX <- ggarrange(a0_RMSE, a0_RMSE_park, a2_RMSE, a2_RMSE_park, a1_RMSE,a1_RMSE_park,a3_RMSE,a3_RMSE_park, 
                  nrow = 4, ncol = 2, widths = c(1, 1.75), heights = c(1.15,1,1,1.1),
                  labels = c('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'), font.label = list(size = 10), 
                  vjust = c(4.5,4.5,2.5,2.5,2.5,2.5,2.5,2.5), hjust = c(-5.5,-4.5,-5.5,-4.5,-5.5,-8,-5,-4.5),
                  common.legend = T, legend = "top")
figX <- annotate_figure(figX,
                        bottom = text_grob("Effort (%)", size = 10),
                        left = text_grob("RMSE", rot = 90, size = 10)
                        )
ggsave(figX, filename = "Figure1.jpeg", height=7.5, width=6.5, units = 'in', dpi = 600)



