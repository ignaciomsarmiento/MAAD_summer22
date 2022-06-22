#######################################################################
#  Author: Ignacio Sarmiento-Barbieri (i.sarmiento at uniandes.edu.co)
# please do not cite or circulate without permission
#######################################################################



require("tidyverse")
require("here")
require("sf")
require("leaflet")


upla<-read_sf(here("upla/UPla.shp"))


m <- leaflet() %>% 
  setView(lng = -74.066391, lat = 4.601590, zoom = 12)


m %>% addProviderTiles(providers$OpenTopoMap)
m %>% addProviderTiles(providers$Stamen.Toner)

browseURL("http://leaflet-extras.github.io/leaflet-providers/preview/index.html")
#Add Polygons
leaflet(upla) %>% 
  addTiles() %>% 
  addPolygons()

  
  
#Add labels
leaflet(upla) %>% 
  addTiles() %>% 
  addPolygons(label = upla$UPlNombre)
