module nat

import bool
import eq
import Serialize

data nat = O | S nat

isZero: nat -> bool
isZero O = true
isZero _ = false

succ: nat -> nat
succ n = S n

pred: nat -> nat
pred O = O
pred (S n) = n

evenb: nat -> bool
evenb O = true
evenb (S O) = false
evenb (S (S n)) = evenb n

add: nat -> nat -> nat
add O m = m
add (S n) m = S (add n m)

mult: nat -> nat -> nat
mult O m = O
mult (S n) m = add m (mult n m)

fact: nat -> nat
fact O = (S O)
fact (S n) = mult (S n) (fact n)

sub: nat -> nat -> nat
sub O m = O
sub n O = n
sub (S n) (S m) = sub n m

--#5: exp - given natural numbers, (x, n), return the value of x raised to the nth power
exp: nat -> nat -> nat
exp O n = (S O)
exp x O = (S O)
exp x (S n) = mult x (exp x n)

--#6: le -- given natural numbers, (a, b), return true if a is less than or equal to b, otherwise return false
le: nat -> nat -> bool
le  O b = true
le a O = false
le (S a) (S b) = le a b

--#7: eq -- given natural numbers, (a, b), return true if a is equal to be, otherwise return false
eql_nat: nat -> nat -> bool
eql_nat O O = true
eql_nat O b = false
eql_nat a O = false
eql_nat (S a) (S b) = eql_nat a b
  
--#8: gt -- given natural numbers, (a, b), return true if a is greater than b, otherwise return false
gt: nat -> nat -> bool
gt a b = not (le a b)

--#9: ge -- given natural numbers, (a, b), return true of a is greater than or eql_natual to b
ge: nat -> nat -> bool
ge a b = or (gt a b) (eql_nat a b)

--#10: lt -- given natural numbers, (a, b), return true if a is less than b

lt: nat -> nat -> bool
lt a b = and (le a b) (not (eql_nat a b))

-- Give the nth fibonacci term:
fib: nat -> nat
fib O = O
fib (S O) = (S O)
fib (S (S n)) = add (fib (S n)) (fib n)

instance eq nat where
  eql n1 n2 = eql_nat n1 n2

instance Serialize nat where
  toString O = "Z"
  toString (S n) = "|" ++ (toString n)
