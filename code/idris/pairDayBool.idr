module pairDayBool

import days
import bool

data pair days bool = mkPair days bool

p1: pair days bool 
p1 = mkPair monday true
