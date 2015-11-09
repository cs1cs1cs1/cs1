module seasons

data seasons = fall | winter | spring | summer

nextSeason: seasons -> seasons
nextSeason fall = winter
nextSeason winter = spring
nextSeason spring = summer
nextSeason summer = fall
