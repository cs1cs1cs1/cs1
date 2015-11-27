
import set
import set_spec
import list 
import bool
import nat
import eq
import pair

data dict2: (k:Type) -> (v:Type) -> Type
data dict2 k v = mkDict2 (set (pair k v))

d1: dict2 nat bool
d1 = mkDict2 (mkSet ((mkPair O true)::(mkPair (S O) false)::nil))
