module boolTest

import bool

uf: bool -> bool
uf = (and true)

q1: bool
q1 = bool.and true true
--expecting true

q2: bool
q2 = bool.and true false
--expecting false

q3: bool
q3 = bool.and false true
--expecting false

q4: bool
q4 = bool.and false false
--expecting false

q5: bool
q5 = or false false
--expecting false

q6: bool
q6 = or true true
--expecting true

q7: bool 
q7 = xor false true
--expecting true

q8: bool
q8 = xor true true
--expecting false

q9: bool
q9 = nand true true
--expecting false

q1O: bool
q1O = nand false true
--expecting true
