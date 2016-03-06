library(leaflet)
library(magrittr)

########### Proof of concept to see if we can use pictures as "pins" and assignn an html caption (which pops up the big picture)####
# greenLeafIcon <- makeIcon(
#   iconUrl = "https://avatars2.githubusercontent.com/u/8094091?v=3&s=460",
#   iconWidth = 95, iconHeight = 95,
#   iconAnchorX = 22, iconAnchorY = 94
# )
# 
# leaflet(data = quakes[1:4,]) %>% addTiles() %>%
#   addMarkers(~long, ~lat, icon = greenLeafIcon, popup = '<img src="https://avatars2.githubusercontent.com/u/8094091?v=3&s=460">')

########### Example to use multiple icons on leaflet #####
# # Make a list of icons. We'll index into it based on name.
# Suns <- iconList(
#   ship =   makeIcon("ferry-18.png",  18, 18),
#   pirate = makeIcon("danger-24.png", 24, 24)
# )
# 
# # Some fake data
# df <- sp::SpatialPointsDataFrame(
#   cbind(
#     (runif(20) - .5) * 10 - 90.620130,  # lng
#     (runif(20) - .5) * 3.8 + 25.638077  # lat
#   ),
#   data.frame(type = factor(
#     ifelse(runif(20) > 0.75, "pirate", "ship"),
#     c("ship", "pirate")
#   ))
# )
# 
# leaflet(df) %>% addTiles() %>%
#   # Select from oceanIcons based on df$type
#   addMarkers(icon = ~Suns[type])

########### Now do it for real! #####
## Make a list of icons. In theory, it should be possible to pass these in as a column in a df, but I couldn't get iconList()
## to see them correctly, so it was just as fast to just copypaste in. Use Make.Icons.with.this.xls to do this part.
Suns <- iconList(
  P1 = makeIcon("Accra, Ghana - Laure.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P2 = makeIcon("Annecy, France - Charlotte.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P3 = makeIcon("Appia Antica near Rome, Italy - Leo.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P4 = makeIcon("Auguascalientes, Mexico - Charlotte.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P5 = makeIcon("Bali, Indonesia - Charlotte.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P6 = makeIcon("Bangladesh Cinzia (1).s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P7 = makeIcon("Bangladesh Cinzia (2).s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P8 = makeIcon("Bangladesh Cinzia (3).s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P9 = makeIcon("Bangladesh Cinzia (4).s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P10 = makeIcon("Bangladesh, Cinzia (5).s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P11 = makeIcon("Battir in Palestine - Wietse.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P12 = makeIcon("Beirut - Mazen.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P13 = makeIcon("Belize - Charlotte (2).s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P14 = makeIcon("Belize - Charlotte.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P15 = makeIcon("Boston, US - Arti.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P16 = makeIcon("Brighton beach, UK - Katka.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P17 = makeIcon("Cannes - Heidi.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P18 = makeIcon("Canterbury, UK - Sian.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P19 = makeIcon("Cape Town, South Africa (3) - Charlotte.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P20 = makeIcon("Cape Town, South Africa - Charlotte (2).s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P21 = makeIcon("Cape Town, South Africa - Charlotte.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P22 = makeIcon("Cape Town, South Africa - Melissa.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P23 = makeIcon("Carnoustie, Scotland - Ashley.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P24 = makeIcon("Cinqueterre, Italy - AK.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P25 = makeIcon("Circo Massimo, Rome, Italy - Sian.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P26 = makeIcon("Costa Rica - Charlotte.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P27 = makeIcon("Costanera Centre, Santiago, Chile - Melissa.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P28 = makeIcon("Cuba - Melissa.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P29 = makeIcon("Engelberg, Switzerland - Heidi.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P30 = makeIcon("Finland - Heidi.s.jpeg",iconAnchorX = 50, iconAnchorY = 50),
  P31 = makeIcon("Glacier blanc, Alps, France - Romain.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P32 = makeIcon("Guatemala City - Charlotte.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P33 = makeIcon("Gotebord, Sweden, Lisa.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P34 = makeIcon("Halong Bay, Vietnam - Charlotte.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P35 = makeIcon("Isla Mujeres - Mexico - Ashley.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P36 = makeIcon("Kerela, India - VC.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P37 = makeIcon("Kinabatangan, Borneo - Charlotte.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P38 = makeIcon("Lake Placid, NY, USA - AK.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P39 = makeIcon("Leiden, The Netherlands - Ben.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P40 = makeIcon("Los Angeles - Heidi.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P41 = makeIcon("Los Angeles, USA - Heidi.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P42 = makeIcon("Maldives - Yoonjee.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P43 = makeIcon("Mallorca, Spain - Ashley.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P44 = makeIcon("Melbourne, Australia - Charlotte.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P45 = makeIcon("Mexico City, Mexico - AK.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P46 = makeIcon("Montepulciano - Laure.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P47 = makeIcon("Montpellier, France - Maylis.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P48 = makeIcon("Neuchatel, Switzerland - Sian (2).s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P49 = makeIcon("Neuchatel, Switzerland - Sian.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P50 = makeIcon("New York, US - Heidi(2).s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P51 = makeIcon("New York, US - Heidi(3).s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P52 = makeIcon("New York, US - Heidi(4).s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P53 = makeIcon("New York, US - Heidi.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P54 = makeIcon("NJ, USA - AK.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P55 = makeIcon("NJ, USA2 - AK.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P56 = makeIcon("Northern India, Uncle Navin.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P57 = makeIcon("Ottawa, Canada (1) - Liz.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P58 = makeIcon("Ottawa, Canada (2) - Liz.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P59 = makeIcon("Palau, Yoonjee.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P60 = makeIcon("Piramide, Rome, Italy - Laure.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P61 = makeIcon("Providencetown, MA, USA - AK(2).s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P62 = makeIcon("Providencetown, MA, USA - AK.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P63 = makeIcon("Rio de Janeiro, Brazil - Melissa.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P64 = makeIcon("Roatan beach, Honduras - Melissa.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P65 = makeIcon("San Juan Del Sur, Nicaragua - Ashley.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P66 = makeIcon("San Saba, Rome, Italy - Laure.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P67 = makeIcon("Santa Marinella, Italy - Heidi.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P68 = makeIcon("Santa Monica, California, US - Heidi.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P69 = makeIcon("Santiago, Chile - Melissa.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P70 = makeIcon("Sao Paolo, Brazil - Charlotte (2).s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P71 = makeIcon("Sao Paolo, Brazil - Charlotte.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P72 = makeIcon("Sarajevo, Bosnia Herzegovina - Ashley.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P73 = makeIcon("Sauble Beach, Lake Huron, Canada - Florence (2).s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P74 = makeIcon("Sauble Beach, Lake Huron, Canada - Florence.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P75 = makeIcon("Singapore - Sophie.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P76 = makeIcon("Solan, India - MK.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P77 = makeIcon("Solan, India2 - MK.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P78 = makeIcon("Solan, India3 - MK.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P79 = makeIcon("Solan, India4.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P80 = makeIcon("Solan, India5.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P81 = makeIcon("Stockhold, Sweden - Charlotte.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P82 = makeIcon("The Hague, Belgium - Ben.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P83 = makeIcon("Toronto, Canada - Ashley.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P84 = makeIcon("Troy, NY, USA - AK.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P85 = makeIcon("Venice, Italy - Heidi.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P86 = makeIcon("Venice, Italy(2) - Heidi.s.jpg",iconAnchorX = 50, iconAnchorY = 50),
  P87 = makeIcon("Whitstable, UK - Sian.s.jpg",iconAnchorX = 50, iconAnchorY = 50)
)



## Read data in
  coords <- read.csv("coords.csv")
df <- sp::SpatialPointsDataFrame(
  cbind(
    coords$longitude,  # lng
    coords$latitude  # lat
  ),
  data.frame(type = coords$Name
  )
)

leaflet(df) %>% addTiles() %>%
  # Select Icons and asign popup text
  addMarkers(icon = ~Suns[type],popup = coords$tt)
