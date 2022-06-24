

require("sf")
require("tidyverse")
require("here")

dta<-read_csv("/Users/iggy/Dropbox/Teaching/2022/SpatialDataEng/Lectures/ProblemSet1/data/Chicago_delitos_verano_2019.csv")

map<-st_read("/Users/iggy/Dropbox/Teaching/2022/SpatialDataEng/Lectures/ProblemSet1/data/Areas_comunitarias_Chicago/geo_export_504ee058-3b12-4c1e-8fa8-a920109f7ad2.shp")

dta_sf<-st_as_sf(dta,coords=c("lon","lat"),remove=FALSE,crs=4326)

require("leaflet")
leaflet(dta_sf[1:10,]) %>% 
  addTiles() %>% 
  addMarkers()

dta_sf<-st_transform(dta_sf,st_crs(map))
db<-st_join(dta_sf,map,join=st_intersects)


db_group<- db %>% st_drop_geometry() %>% group_by(community) %>% summarize(n=n())

map<- left_join(map,db_group)
map<- map %>% mutate(logn=log())
ggplot() +
  geom_sf(data=map,aes(fill=n)) +
  theme_bw()








#