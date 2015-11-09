module Bit

--Data type
data Bit = one | zero

--Functions
change: Bit -> Bit
change one = zero
change zero = one

id: Bit -> Bit
id one = one
id zero = zero
