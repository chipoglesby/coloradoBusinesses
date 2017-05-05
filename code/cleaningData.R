entitiesCleaned <- entities

rm(entities)

entitiesCleaned$entityformdate <- 
  as.Date(entitiesCleaned$entityformdate, '%m/%d/%Y')

entitiesCleaned[sapply(entitiesCleaned, is.character)] <- 
  lapply(entitiesCleaned[sapply(entitiesCleaned, is.character)], tolower)

write_csv(entitiesCleaned, "data/entitiesCleaned.csv")

entities <- entitiesCleaned

rm(entitiesCleaned)


entitiesCleaned$latitude <- str_extract(entitiesCleaned$location, "\\d{2}\\.\\d{1,}")
entitiesCleaned$longitude <- str_extract(entitiesCleaned$location, "\\-\\d{2}\\.\\d{1,}")
entitiesCleaned$standing <- str_extract(entitiesCleaned$entityname, '\\,\\s.*')