## Data cleaning for analyses
## Kaitlin Kimmel June 11, 2020

# Libraries
library(here)
# BioCON data from https://www.cedarcreek.umn.edu/research/data in E141
# Load in data

biomass_dat <- read.delim(here("Data", "BioCON_biomass.txt"))
cover_dat <- read.delim(here("Data", "BioCON_percov.txt"))


## Clean biomass data
names(biomass_dat) <- c("Sample", "Date", "Plot", "Ring", "CO2", "N", "SR_Planted", "FGR_Planted", "Experiment", "Planted_MonoSp", "Planted_MonoGroup", "H2O", "Temp", "Species", "Biomass")
biomass_dat$Date <- as.Date(biomass_dat$Date,"%m/%d/%Y")
biomass_dat$Month <- as.numeric(format(biomass_dat$Date, format = "%m"))
biomass_dat$Year <- as.numeric(format(biomass_dat$Date, format = "%Y"))

# Correct species names
# Several species have a blank space after the genus
biomass_dat$Species<- gsub(pattern = "16 Species Weeds ", replacement = "16 Species Weeds",biomass_dat$Species)
biomass_dat$Species<- gsub(pattern = "Achillea millefolium ", replacement = "Achillea millefolium",biomass_dat$Species)
biomass_dat$Species<- gsub(pattern = "Koeleria cristata ", replacement = "Koeleria cristata",biomass_dat$Species)
biomass_dat$Species<- gsub(pattern = "Poa pratensis ", replacement = "Poa pratensis",biomass_dat$Species)
biomass_dat$Species<- gsub(pattern = "Bouteloua gracilis ", replacement = "Bouteloua gracilis",biomass_dat$Species)
biomass_dat$Species<- gsub(pattern = "Amorpha canescens ", replacement = "Amorpha canescens",biomass_dat$Species)
biomass_dat$Species<- gsub(pattern = "Lespedeza capitata ", replacement = "Lespedeza capitata",biomass_dat$Species)
biomass_dat$Species<- gsub(pattern = "Lupinus perennis ", replacement = "Lupinus perennis",biomass_dat$Species)
biomass_dat$Species<- gsub(pattern = "Petalostemum villosum ", replacement = "Petalostemum villosum",biomass_dat$Species)
biomass_dat$Species<- gsub(pattern = "Anemone cylindrica ", replacement = "Anemone cylindrica",biomass_dat$Species)
biomass_dat$Species<- gsub(pattern = "Asclepias tuberosa ", replacement = "Asclepias tuberosa",biomass_dat$Species)
biomass_dat$Species<- gsub(pattern = "Real Weeds ", replacement = "Real Weeds",biomass_dat$Species)
biomass_dat$Species<- gsub(pattern = "Sorghastrum nutans ", replacement = "Sorghastrum nutans",biomass_dat$Species)
biomass_dat$Species<- gsub(pattern = "Andropogon gerardi ", replacement = "Andropogon gerardi",biomass_dat$Species)
biomass_dat$Species<- gsub(pattern = "Schizachyrium scoparium ", replacement = "Schizachyrium scoparium",biomass_dat$Species)
biomass_dat$Species<- gsub(pattern = "Solidago rigida ", replacement = "Solidago rigida",biomass_dat$Species)
biomass_dat$Species<- gsub(pattern = "Bromus inermis ", replacement = "Bromus inermis",biomass_dat$Species)
biomass_dat$Species<- gsub(pattern = "Bromus inermis ", replacement = "Bromus inermis",biomass_dat$Species)
biomass_dat$Species<- gsub(pattern = "Agropyron repens ", replacement = "Agropyron repens",biomass_dat$Species)
# Capatilization inconsistencies
biomass_dat$Species<- gsub(pattern = "poa pratensis", replacement = "Poa pratensis",biomass_dat$Species)
biomass_dat$Species<- gsub(pattern = "16 species Weeds", replacement = "16 Species Weeds",biomass_dat$Species)
biomass_dat$Species<- gsub(pattern = "Miscellaneous Litter", replacement = "Miscellaneous litter",biomass_dat$Species)
biomass_dat$Species<- gsub(pattern = "bromus inermis", replacement = "Bromus inermis",biomass_dat$Species)
biomass_dat$Species<- gsub(pattern = "poa compressa", replacement = "Poa compressa",biomass_dat$Species)

# Fixing MonoSp Column.. don't know if we will use it, but it's correct now!
biomass_dat$Planted_MonoSp<- gsub(pattern = "BoutelouaGracilis", replacement = "Bouteloua gracilis",biomass_dat$Planted_MonoSp)
biomass_dat$Planted_MonoSp<- gsub(pattern = "AsclepiasTuberosa", replacement = "Asclepias tuberosa",biomass_dat$Planted_MonoSp)
biomass_dat$Planted_MonoSp<- gsub(pattern = "SchizachyriumScoparium", replacement = "Schizachyrium scoparium",biomass_dat$Planted_MonoSp)
biomass_dat$Planted_MonoSp<- gsub(pattern = "AmorphaCanescens", replacement = "Amorpha canescens",biomass_dat$Planted_MonoSp)
biomass_dat$Planted_MonoSp<- gsub(pattern = "BromusInermis", replacement = "Bromus inermis",biomass_dat$Planted_MonoSp)
biomass_dat$Planted_MonoSp<- gsub(pattern = "AgropyronRepens", replacement = "Agropyron repens",biomass_dat$Planted_MonoSp)
biomass_dat$Planted_MonoSp<- gsub(pattern = "LespedezaCapitata", replacement = "Lespedeza capitata",biomass_dat$Planted_MonoSp)
biomass_dat$Planted_MonoSp<- gsub(pattern = "PetalostemumVillosum", replacement = "Petalostemum villosum",biomass_dat$Planted_MonoSp)
biomass_dat$Planted_MonoSp<- gsub(pattern = "PoaPratensis", replacement = "Poa pratensis",biomass_dat$Planted_MonoSp)
biomass_dat$Planted_MonoSp<- gsub(pattern = "SolidagoRigida", replacement = "Solidago rigida",biomass_dat$Planted_MonoSp)
biomass_dat$Planted_MonoSp<- gsub(pattern = "AnemoneCylindrica", replacement = "Anemone cylindrica",biomass_dat$Planted_MonoSp)
biomass_dat$Planted_MonoSp<- gsub(pattern = "KoeleriaCristata", replacement = "Koeleria cristata",biomass_dat$Planted_MonoSp)
biomass_dat$Planted_MonoSp<- gsub(pattern = "AchilleaMillefolium", replacement = "Achillea millefolium",biomass_dat$Planted_MonoSp)
biomass_dat$Planted_MonoSp<- gsub(pattern = "LupinusPerennis", replacement = "Lupinus perennis",biomass_dat$Planted_MonoSp)
biomass_dat$Planted_MonoSp<- gsub(pattern = "AndropogonGerardi", replacement = "Andropogon gerardi",biomass_dat$Planted_MonoSp)
biomass_dat$Planted_MonoSp<- gsub(pattern = "SorghastrumNutans", replacement = "Sorghastrum nutans",biomass_dat$Planted_MonoSp)
biomass_dat$Planted_MonoSp<- gsub(pattern = "Amorpha  canescens", replacement = "Amorpha canescens",biomass_dat$Planted_MonoSp)
biomass_dat$Planted_MonoSp<- gsub(pattern = "Solidago sigida", replacement = "Solidago rigida",biomass_dat$Planted_MonoSp)
