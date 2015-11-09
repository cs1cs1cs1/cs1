module Cities

import bool

||| A record type that gives characteristics of U.S. cities: city name, state name, 2012 population, is it cold
record Cities where
  constructor MkCities
  name : String
  state : String
  pop : Nat
  cold : bool
  
nyc: Cities
nyc = MkCities "NewYorkCity" "NewYork" 8336697 true

la: Cities
la = MkCities "LosAngelos" "California" 3857799 false

chc: Cities
chc = MkCities "Chicago" "Illinois" 2714856 true

anch: Cities
anch = MkCities "Anchorage" "Alaska" 298610 true


