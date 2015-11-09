module relationTest

import relation
import bool
import list
import People
import Person
import pair

sumFyears: Nat
sumFyears = query people gender age plus 0

pdtFInches: Nat
pdtFInches = query people gender height mult 1

sumFInches: Nat
sumFInches = query people gender height plus 0

Fnames: String
Fnames = query people gender name (++) ""

aveFAge: pair Nat Nat
aveFAge = mkPair
           (query people gender age plus 0)
           (query people gender countOne plus 0)

aveFAge': pair Nat Nat
aveFAge' = ave_rel people gender age

aveFHeight: pair Nat Nat
aveFHeight = ave_rel people gender height

