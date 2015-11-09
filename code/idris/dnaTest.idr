module dnaTest

import list
import pair
import dna

compA: base
compA = complement_base A
--expecting T

compT: base
compT = complement_base T
--expecting A

compC: base
compC = complement_base C
--expecting G

compG: base
compG = complement_base G
--expecting C

compst1: list base
compst1 = complement_strand (A::T::C::G::nil)
--expecting T :: A :: G :: C :: nil

compst2: list base
compst2 = complement_strand (A::G::T::T::C::C::nil)
-- expecting T :: C :: A :: A :: G :: G :: nil

st1: list base
st1 = strand1 (mkPair A T::mkPair G C::mkPair G C::mkPair T A::nil)
--expecting A :: G :: G :: T :: nil

st2: list base
st2 = strand2 (mkPair A T::mkPair G C::mkPair G C::mkPair T A::nil)
--expecting T :: C :: C :: A :: nil

comp1: list (pair base base)
comp1 = complete (A::T::G::nil)
--expecting mkPair A T :: mkPair T A :: mkPair G C :: nil

ctb1: Nat
ctb1 = countBase (A::T::G::C::T::nil) G
--expecting 1

ctb2: Nat
ctb2 = countBase nil T
--expecting 0
