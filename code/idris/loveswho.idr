module loveswho

import pair

data person = mary | maurice

loveswho: person -> person
loveswho _ = maurice

p1: pair person person
p1 = mkPair mary maurice

p2: pair person person
p2 = mkPair maurice maurice
