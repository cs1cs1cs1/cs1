module MT1Prep

import bool
import nat
import pair

data pair lst lst = mkPair lst lst
data lst = nil | cons g lst

appendl: MT1Prep.pair lst lst -> lst
appendl (mkPair nil sl) = sl
appendl (mkPair fl nil) = fl
appendl (mkPair (cons f fl') (cons s sl')) = cons f (appendl (mkPair fl' (cons s sl')))
