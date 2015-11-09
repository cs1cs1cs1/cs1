module set_adt_test

import set_spec
import bool
import nat
import list
import option
import pair
import eq
import Serialize
import ite

es0: set bool
es0 = emptySet
--expecting mkSet nil

e1: bool
e1 = isEmpty (mkSet nil {a=nat})
--expecting true

e2: bool
e2 = isEmpty (mkSet (true::false::nil))
--expecting false

e3: set bool
e3 = set_insert true (mkSet (false::nil))
--expecting mkSet (true::false::nil)

e4: set bool
e4 = set_insert true (mkSet (true::false::nil))
--expecting mkSet (true::false::nil)

e5: set nat
e5 = set_remove (S O) (mkSet (O::(S O)::(S (S O))::nil))
--expecting mkSet (O::S(S O)::nil)

e6: set nat
e6 = set_remove (S O) (mkSet (O::(S (S O))::nil))
--expecting mkSet (O::S(S O)::nil)

e7: nat
e7 = set_cardinality (mkSet (nil {a = nat}))
--expecting O

e8: nat
e8 = set_cardinality (mkSet (true::false::nil))
--expecting S (S O)

e9: bool
e9 = set_member true (mkSet (true::false::nil))
--expecting true

e10: bool
e10 = set_member true (mkSet (nil))
--expecting false

e11: set bool
e11 = set_union (mkSet (true::false::nil)) (mkSet (false::nil))
--expecting mkSet (true::false::nil)

e12: set nat
e12 = set_union (mkSet (O::(S O)::(S (S O))::nil)) (mkSet ((S(S(S O)))::(S(S(S(S O))))::nil))
--expecting mkSet (O::S O::S(S O)::S(S(S O))::S(S(S(S O)))::nil)

e13: set bool
e13 = set_intersection (mkSet (true::false::nil)) (mkSet (false::nil))
--expecting (mkSet (false::nil))

e14: set nat
e14 = set_intersection (mkSet (O::S O::S(S O)::nil)) (mkSet (nil {a = nat}))
--expecting mkSet (nil)

e15: set bool
e15 = set_intersection (mkSet (true::false::nil)) (mkSet (true::false::nil))
--expecting (mkSet (true::false::nil))

e16: set nat
e16 = set_intersection (mkSet (O::S O::S(S O)::nil)) (mkSet (S(S(S O))::nil))
--expecting mkSet (nil)

e17: set bool
e17 = set_difference (mkSet (true::false::nil)) (mkSet (true::nil))
--expecting (mkSet (false::nil))

e18: set nat
e18 = set_difference (mkSet (O::S O::S(S O)::nil)) (mkSet (S(S(S O))::nil))
--expecting mkSet (O::S O::S(S O)::nil)

e19: set nat
e19 = set_difference (mkSet (nil {a = nat})) (mkSet (S(S(S O))::nil))
--expecting mkSet nil

e20: bool
e20 = set_forall evenb (mkSet (O::S O::S(S O)::nil))
--expecting false

e21: bool
e21 = set_forall evenb (mkSet (O::S(S O)::nil))
--expecting true

e22: bool
e22 = set_exists evenb (mkSet (O::S(S O)::nil))
--expecting true

e23: bool
e23 = set_exists evenb (mkSet (O::S O::S(S O)::nil))
--expecting true

e24:bool
e24 = set_exists evenb (mkSet (nil {a = nat}))
--expecting false

e25: option nat
e25 = set_witness evenb (mkSet (O::S O::S(S O)::nil))
--expecting some O

e26: option nat
e26 = set_witness evenb (mkSet (nil {a = nat}))
--expecting none

e27: set (pair nat bool)
e27 = set_product (mkSet (O::nil)) (mkSet (true::false::nil))
--expecting mkSet (mkPair O true :: mkPair O false :: nil)

e28: set (pair bool bool)
e28 = set_product (mkSet (nil {a = bool})) (mkSet (true::false::nil))
--expecting mkSet nil

e29: set (pair bool bool)
e29 = set_product (mkSet (true::nil)) (mkSet (true::nil))
--expecting mkSet (mkPair true true::nil)

e30: bool
e30 = set_eql (mkSet (true::nil)) (mkSet (true::nil))
--expecting true

e31: bool
e31 = set_eql (mkSet (nil {a = nat})) (mkSet (nil {a = nat}))
--expecting true

e32: bool
e32 = set_eql (mkSet (true::nil)) (mkSet (false::nil))
--expecting false

e33: String
e33 = toString (mkSet (true::false::nil))
--expecting "{true,false}"

e34: String
e34 = toString (mkSet (O::S O::S(S O)::nil))
--expecting "{Z,|Z,||Z}"
