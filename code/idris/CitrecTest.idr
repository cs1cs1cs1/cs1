module CitrecTest

import Cities
import list
import Citrec
import bool
import relation
import pair

--map test cases
mapcold: list bool
mapcold = map cold Citrec

mappop: list Nat
mappop = map pop Citrec

mapnil: list bool
mapnil = map cold nil

--name test cases:
--names of all cold cities
namecc: String
namecc = query Citrec cold name (++) ""

--sum of populations of all cold cities
ccpop: Nat
ccpop = query Citrec cold pop plus 0

ccpop': Nat
ccpop' = sum_rel Citrec cold pop 

--average population of cold cities
avgpop: pair Nat Nat
avgpop = mkPair (query Citrec cold pop plus 0) (query Citrec cold countOne plus 0)

avgpop': pair Nat Nat
avgpop' = ave_rel Citrec cold pop

--average population of no cities
avgpopnil: pair Nat Nat
avgpopnil = ave_rel Citnil cold pop

--count # of cold cities
countCit: Nat
countCit = count_rel Citrec cold
