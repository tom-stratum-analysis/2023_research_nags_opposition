# import the library
library(caret)

autocracies_data <- read.csv(here("data","autocracies_data.csv"))


autocracies_data$TarNum_COW <- as.character(autocracies_data$TarNum_COW)
autocracies_data$SupNum_COW <- as.character(autocracies_data$SupNum_COW)
autocracies_data$year <- as.character(autocracies_data$year)
autocracies_data$COWcode <- as.character(autocracies_data$COWcode)
autocracies_data$supporter_cyear <- as.character(autocracies_data$supporter_cyear)
autocracies_data$target_cyear <- as.character(autocracies_data$target_cyear)

autocracies_data$NumNAG_S <- as.character(autocracies_data$NumNAG_S)
autocracies_data$Num_S_TrainCamp <- as.character(autocracies_data$Num_S_TrainCamp)




preproc <- preProcess(autocracies_data, method=c("range"))
norm <- predict(preproc, autocracies_data)

norm$NumNAG_S <- as.numeric(norm$NumNAG_S)
norm$Num_S_TrainCamp <- as.numeric(norm$Num_S_TrainCamp)

library(here)
write.csv(norm, file = here("data","norm_data.csv"))
