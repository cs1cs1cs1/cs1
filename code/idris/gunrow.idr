module gunrow

-- Coauthors: Alicia Zheng and Claire Ellison

import list

data country = Argentina | Australia | Austria | Honduras | USA

||| A record of this type represents a country and the death rate per 1O,OOO,OOO by gun for homocides, suicides, unintentional, other

data gunrow = mkGunrow country Nat Nat Nat Nat

argen: gunrow
argen = mkGunrow Argentina 190 279 64 362

austrl: gunrow
austrl = mkGunrow Australia 11 62 5 8

aus: gunrow
aus = mkGunrow Austria 18 268 1 8

hondr: gunrow
hondr = mkGunrow Honduras 648 0 0 0

usa: gunrow
usa = mkGunrow USA 355 670 16 9

records: list gunrow
records = cons argen (cons austrl (cons aus (cons hondr (cons usa nil))))

homocidePer1OM: gunrow -> Nat
homocidePer1OM (mkGunrow c h s u o) = h

suicidePer1OM: gunrow -> Nat
suicidePer1OM (mkGunrow c h s u o) = s

unintentionalPer1OM: gunrow -> Nat
unintentionalPer1OM (mkGunrow c h s u o) = u

otherPer1OM: gunrow -> Nat
otherPer1OM (mkGunrow c h s u o) = o

