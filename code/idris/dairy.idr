module dairy

-- this module gives the US per capita availability of types of dairy products in the last few decades

import list
import pair

data dairyType = milkCream | butter | cheese | frozen | dryProducts

||| a record of this type represents a category of dairy and its per capita availability in pounds times 10 in the given year: 1970, 1980, 1990, 2000, 2012
data dairyrow = mkDairyrow dairyType Nat Nat Nat Nat Nat

mcr: dairyrow
mcr = mkDairyrow milkCream 2738 2450 2328 2099 1988

bttr: dairyrow
bttr = mkDairyrow butter 54 45 44 45 56

chs: dairyrow
chs = mkDairyrow cheese 164 219	279 325	360

frz: dairyrow
frz = mkDairyrow frozen 258 239 261 281 239

drPdt: dairyrow
drPdt = mkDairyrow dryProducts 177 105 116 90 116

dairyData : list dairyrow
dairyData = cons mcr (cons bttr (cons chs (cons frz (cons drPdt nil))))

givedairyType: dairyrow -> dairyType
givedairyType (mkDairyrow a b c d e f) = a

lbsx1Oin197O: dairyrow -> Nat
lbsx1Oin197O (mkDairyrow a b c d e f) = b 

lbsx1Oin198O: dairyrow -> Nat
lbsx1Oin198O (mkDairyrow a b c d e f) = c

lbsx1Oin199O: dairyrow -> Nat
lbsx1Oin199O (mkDairyrow a b c d e f) = d

lbsx1Oin2OOO: dairyrow -> Nat
lbsx1Oin2OOO (mkDairyrow a b c d e f) = e

lbsx1Oin2O12: dairyrow -> Nat
lbsx1Oin2O12 (mkDairyrow a b c d e f) = f  

--update197O: pair dairyrow Nat -> dairyrow
--update197O (mkPair (mkDairyrow a b c d e f) g) = mkDairyrow a b c d e f g


