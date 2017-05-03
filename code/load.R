# Download data and fix types

if(!file.exists("data/coloradoBusinesses.csv")){
  if(!file.exists("token.txt")){
   print("You need an API token first")
  } else {
    token <- read_file("token.txt")
    coloradoBusinesses <- read.socrata("https://data.colorado.gov/resource/4eit-nuxn.json", app_token = token)
    coloradoBusinesses$averagerent <- as.numeric(coloradoBusinesses$averagerent)
    coloradoBusinesses$year <- as.integer(coloradoBusinesses$year)
    coloradoBusinesses$quarter <- as.integer(coloradoBusinesses$quarter)

    # Save data to CSV
    write_csv(coloradoBusinesses, "data/coloradoBusinesses.csv")
  }
} else {
  coloradoBusinesses <- read_csv("data/coloradoBusinesses.csv")
  coloradoBusinesses %<>%
    na.omit()
  coloradoBusinesses$averagerent <- as.numeric(coloradoBusinesses$averagerent)
  coloradoBusinesses$year <- as.integer(coloradoBusinesses$year)
  coloradoBusinesses$quarter <- as.integer(coloradoBusinesses$quarter)
}

coloradoBusinessesAll <- coloradoBusinesses %>%
  filter(tolower(apartmenttype) == 'all')
