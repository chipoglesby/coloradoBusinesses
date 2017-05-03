# Download data and fix types

if(!file.exists("data/cleaned/entities.csv")){
  if(!file.exists("token.txt")){
   print("You need an API token first")
  } else {
    token <- read_file("token.txt")
    entities <- read.socrata("https://data.colorado.gov/resource/4eit-nuxn.json", app_token = token)
  
    # Save data to CSV
    write_csv(entities, "data/entities.csv")
  }
} else {
  entities <- read_csv("data/cleaned/entities.csv")
  entities %<>%
    na.omit()
}