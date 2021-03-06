
harvest_tolerance <- function(name, site, area,units, threshold, iterations, growth,density, biomass, offtake, seed) {

  ########### Algorithm ###########
  # error check

  try(if(threshold < 0) return(warning("Error: interpretation not meaningful when threshold set below 0")))

  # set seed to allow reproducibility
  set.seed(seed)

  # fix density to resemble abundance
  density <- density * area

  # resampling algorithm
  growth <- sample(growth,iterations, replace=T)
  density <- sample(density,iterations, replace=T)
  biomass<- sample(biomass,iterations, replace=T)
  offtake <- sample(offtake, iterations, replace=T)
  net.productivity <- ((growth-1)*density*biomass)-(offtake)
  gross.productivity <-(growth-1)*density*biomass

  # summary statistics
  harvestable.biomass <- median((growth-1)*density*biomass)-threshold
  net.offtake <- median(offtake)
  sustainable <- ifelse(net.productivity<threshold,F,T)
  intervention <- median(net.offtake-harvestable.biomass)

  # new dataframe
  Monte.Carlo <<- data.frame(net.productivity, sustainable,gross.productivity)

  # sustainability table
  failure <- as.numeric(table(sustainable)[1]/(table(sustainable)[1]+table(sustainable)[2]))*100

  # Monte.Carlo graph production using gross productivity as "grey ghost"
  main <- ggplot()+
    ggtitle(paste(name,": ",site," (", area, " ",units,")", sep=""))+
    geom_histogram(data=Monte.Carlo, aes(x=gross.productivity),fill="grey90",alpha=1, breaks = seq(from=min(net.productivity), to=max(gross.productivity), by =(max(gross.productivity)-min(net.productivity))/200))+
    geom_histogram(data=Monte.Carlo, aes(x=net.productivity, fill=sustainable), breaks = seq(from=min(net.productivity), to=max(gross.productivity), by =(max(gross.productivity)-min(net.productivity))/200), position="dodge")+
    theme_bw()+
    scale_fill_manual(values=c("red","black"))+
    theme(axis.title = element_text(size = 12, face = "bold"))+
    theme(plot.title = element_text(size = 16, face = "bold"))+
    theme(legend.title = element_text(size = 10, face = "bold"))+
    theme(plot.caption =element_text(size = 8))+
    ylab("Count\n")+
    xlab("\n Net productivity \n (kg per year)")+
    labs(subtitle =paste(
           "\nLikelihood of unsustainable harvest = ", round(failure,1),"%"," \nUsing threshold of",threshold,"kg",
                         "\n",
                         "\nNet offtake (median) = ", round(net.offtake,0), "kg",
                         "\nAnnual median harvestable biomass (- threshold) = ", round(harvestable.biomass,0), "kg",
                         "\nMinimum median intervention (+ threshold) = ", ifelse(intervention>0, paste(round(intervention ,0),"kg"),
                                                                                  paste("no intervention required ",
                                                                                        "[",
                                                                                        round(intervention*-1 ,0),
                                                                                        "kg available"
                                                                                        ,"]\n", sep=""))
         ))

  # data variability
  v.growth <- growth/median(growth)-1
  v.density <- density/median(density)-1
  v.biomass <- biomass/median(biomass)-1
  v.offtake <- offtake/median(offtake)-1

  # new data frame for variability
  values <- c(v.growth,v.density,v.biomass,v.offtake)
  parameters <-c(rep("growth", iterations), rep("density", iterations), rep("biomass", iterations), rep("offtake", iterations))
  df <- data.frame(parameters,values)

  # Monte.Carlo variability
  sup <- ggplot()+
    geom_histogram(data=df, aes(x=values,fill=parameters), position="dodge", breaks = seq(from=quantile(values, 0.01), to=quantile(values, 0.99), by =0.01))+
    theme_bw()+
    theme(axis.title = element_text(size = 12, face = "bold"))+
    theme(plot.title = element_text(size = 18, face = "bold"))+
    theme(legend.title = element_text(size = 10, face = "bold"))+
    theme(plot.caption =element_text(size = 8))+
    ggtitle("")+
    ylab("")+
    xlab("\nProportional variation from median\n")+
    labs(
      subtitle =paste("\n","\n","\n","\n","\n","Comparative variability of each parameter","\n", sep=""))

  # view two windows
  ggarrange(main, sup, ncol = 2, nrow = 1)
}


