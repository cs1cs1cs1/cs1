module setTest

import list
import set
import eq
import nat

s0: set nat
s0 = new_set

s1: set nat
s1 = set_insert (S O) s0

s2: set nat
s2 = set_insert (S O) s1

b0: set bool
b0 = new_set

b1: set bool
b1 = set_insert true b0

b2: set bool
b2 = set_insert false b1

b3: set bool
b3 = set_insert true b2

es1: bool
es1 = eql_set b2 b2

es2: bool
es2 = eql_set (mkSet (true::false::nil)) (mkSet (true::nil))

es3: bool
es3 = eql_set (mkSet ((S O)::nil)) (mkSet ((S O)::nil))
