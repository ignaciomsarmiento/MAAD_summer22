#######################################################################
#  Author: Ignacio Sarmiento-Barbieri (i.sarmiento at uniandes.edu.co)
# please do not cite or circulate without permission
#######################################################################

require("tidyverse")
require("here")
require("sf")
require("osmdata")
require("leaflet")

# view keys
browseURL("https://wiki.openstreetmap.org/wiki/Map_features")

# get avaliables values for amenity
available_tags("amenity")
available_tags("building")
available_tags("landuse")



# get sf object
amenities = osm$osm_points %>% select(osm_id,amenity)

# plot data
leaflet() %>% 
  addTiles() %>% 
  addCircleMarkers(data=amenities , weight=1 , col="green")


# get osm data
street = opq(bbox = getbb("Bogotá Colombia")) %>%
  add_osm_feature(key = "highway") %>%
  osmdata_sf()

# get sf object
street = street$osm_lines %>% select(osm_id,name)
street = street %>%
  subset(str_detect(name,"Avenida")==T | str_detect(name,"TransMilenio")==T)


leaflet() %>% 
  addTiles() %>% 
  addPolylines(data=street , weight=1 , col="red")

leaflet() %>% 
  addProviderTiles(providers$Stamen.Toner) %>% 
  addPolylines(data=street , weight=1 , col="red")
