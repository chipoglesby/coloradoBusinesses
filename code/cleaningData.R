entitiesCleaned <- entities

rm(entities)

entitiesCleaned$entityformdate <- 
  as.Date(entitiesCleaned$entityformdate, '%m/%d/%Y')
entitiesCleaned[sapply(entitiesCleaned, is.character)] <- 
  lapply(entitiesCleaned[sapply(entitiesCleaned, is.character)], tolower)

write_csv(entitiesCleaned, "data/entitiesCleaned.csv")

entities <- entitiesCleaned

rm(entitiesCleaned)