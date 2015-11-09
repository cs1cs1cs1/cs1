module dna

import list
import pair

data base = A | T | C | G

complement_base: base -> base
complement_base A = T
complement_base T = A
complement_base C = G
complement_base G = C

complement_strand: list base -> list base
complement_strand l = map complement_base l

strand1: list (pair base base) -> list base
strand1 nil = nil
strand1 (h::t) = map fst (h::t)

strand2: list (pair base base) -> list base
strand2 nil = nil
strand2 ((mkPair b1 b2)::lb2) = (b2::(strand2 lb2)) 

X: base -> pair base base
X b = (mkPair b (complement_base b))

complete: list base -> list (pair base base)
complete l = map X l 

isEqual: base -> base -> Nat
isEqual A A = 1
isEqual T T = 1
isEqual C C = 1
isEqual G G = 1
isEqual _ _ = 0

countBase: list base -> base -> Nat
countBase l b = list.foldr plus 0 (map (isEqual b) l)
