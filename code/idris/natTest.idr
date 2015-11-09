module natTest

import bool
import nat
import pair
import eq
import Serialize

{- ||| text copied from nat.idr:

||| A data type to represent the natural numbers.  We use a lower case
||| "n" in the name to distinguish our nat type from Idris's Nat type We now introduce a type to represent the natural numbers using
Peano arithmetic.

In this arithmetic, there are two especially important rules
- zero is a natural number
- the successor of any natural number is a natural number

From this pair of rules arises an infinity of natural numbers. Zero is
a natural number, and the successor of any natural number is a natural
number, so the successor of zero is a natural number; and now, because
the successor of zero is a natural number, its successor, i.e., the
successor of (the successor of zero) is one too; ad infinitum! 

HOMEWORK #1: Learn this way of thinking by rehearsing it mentally
until you've really got it. Work with friends. Explain it to each
other. Test each other. -}

{- We capture this idea with the following deceptively simple data
type definition. What it says is that nat is a type, and there are two
ways to construct a nat. One is to use the constructor, O. The other
is to apply the constructor S to a value that is already known to be
of type nat.  Because O is already known to be of type nat, you can
thus apply S to O (yielding the term (S O)) and the result is also of
type nat. And now because it is a value of type nat, you can apply S
to it to get another value of type nat. Ad infinitum. 

HOMEWORK #2: Study and think about this example as many times as
necessary to get it. Work with friends. Teach each other. Test each
other.  -}

-- Here's our data type definition.

-- HOMEWORK #3: In the REPL ask what are the types of nat, O and S.
-- Be sure you understand the answers! Teach, learning from and test
-- friends.

{-
Here are some examples of some objects (named values) of type nat.
-}

-- HOMEWORK #6: In the REPL, evaluate the types and values of z, o, t
-- and r, as well as your own values. (E.g., ":t o" will report the
-- type of o, and "o" will report its value (along with its type). Be
-- sure you understand the answers. In particular be sure you
-- understand how the variable expression, "r" is evaluated! Yup: r is
-- unfolded to S t; t is unfolded to S (S O); so the whole expression 
-- unfolds to S (S (S O)). Be able to explain this evaluation process
-- verbally and in writing. Teach and test each other.

{-
The rest of this file contains functions operating on nats.
-}

-- HOMEWORK #7 Bind x to the result of applying isZero to r. Add your
-- code below this comment.

-- HOMEWORK #8 Bind y to the result of applying succ to O. Add code here.

{- Next we define a function that when given a natural number returns
true if it's even and false otherwise. It is very, very important to
understand this example, your first example of a recursive function -}

-- HOMEWORK #9 Bind a, b, c, d, e respectively to the results of
-- applying evenb to O, (S O), (S (S O)) r, and (S r),
-- respectively. Add your code here.

--HOMEWORK #10 In English, describe all of the steps involved in
--evaluating the function application expression, evenb (S r). You
--must be able to explain this process to yourself and your friends!
--The idea is that you keep on applying reduction (simplification)
--rules until you get to a value that cannot be reduced further. Write
--your answer by filling in the following block comment.

{-evenb (S r) is evaluated as evenb (S (S n)) where (S n) is equal to
r. r is evaluated as (S t), which unfolds to (S (S o)), which then
unfolds to (S (S (S O))). evenb (S (S n)) returns evenb n, which in
this case would have evenb (S (S t)) return evenb t. evenb t is
evaluated as evenb (S (S O)) which returns evenb O. evenb O is bound
to the bool value true.

-}

-- HOMEWORK #11 Here's a function that takes a pair of natural numbers
-- (values of type nat) and that returns their sum (as another value
-- of type nat). We give you the function name and type along with the
-- left hand sides of the two rules that you'll need. We've filled in 
-- the right hand sides with placeholders. Your task is to replace the
-- right hand sides of the two rules. 

-- Here are a few examples of how this function should work, to get
-- you going. We use ==> to mean "reduces to" or "returns"

-- addp (mkPair O O) ==> O
-- addp (mkPair O (S (S O))) ==> S (S O)
-- addp (mkPair (S O) O) ==> S O
-- addp (mkPair (S (S O)) (S (S (S O)))) ==> S (S (S (S (S O))))

-- Completing the first rule should be pretty easy. Just think about
-- the most basic properties of arithmetic. The second rule is more
-- challenging. Go back and study the evenb example. Notice how we
-- used evenb within its own definition! The idea is that we can
-- compute evenb for a big number by returning the result that we get
-- when we apply it to a number that is two less than the number that
-- we started with. You're going to use a similar idea here.

-- This is the hardest but also the most important problem in this
  -- problem set. There is *no grading penalty* for not getting an
  -- answer to this problem. There is no grading reward for getting
  -- it. Really: do *not* collaborate on this problem. It will help
  -- us instructors to see how you do.

-- HOMEWORK 12 -- Use the REPL to verify that these tests return the
-- expected results

{-- ||| a test, expecting (S O)
nt1: nat
nt1 = exp (mkPair O r)

||| a test, expecting (S O)
nt1.5: nat
nt1.5 = exp (mkPair r O)

||| a test, expecting S (S (S (S O)))
nt2: nat
nt2 = exp (mkPair t t)

||| a test, expecting true
nt3: bool
nt3 = lep (mkPair r five)

||| a test, expecting false
nt4: bool
nt4 = lep (mkPair r t)

||| a test, expecting false
nt5: bool
nt5 = lep (mkPair r O)

||| a test, expecting true
nt5.5: bool
nt5.5 = lep (mkPair four four)

||| a test, expecting true
nt6: bool
nt6 = eqp (mkPair t t)

||| a test, expecting false
nt7: bool
nt7 = eqp (mkPair r five)

||| a test, expecting false
nt8: bool
nt8 = gtp (mkPair r five)

||| a test, expecting true
nt9: bool
nt9 = gtp (mkPair t o)

||| a test, expecting true
nt10: bool
nt10 = gep (mkPair four four)

||| a test, expecting true
nt11: bool
nt11 = gep (mkPair five four)

||| a test, expecting false
nt12: bool
nt12 = gep (mkPair r four)

||| a test, expecting false
nt13: bool
nt13 = ltp (mkPair four four)

||| a test, expecting false
nt14: bool
nt14 = ltp (mkPair four o)

||| a test, expecting true
nt15: bool
nt15 = ltp (mkPair O o)

||| a test, expecting O
ftO: nat
ftO = fibbterm O 

||| a test, expecting (S O)
ft1: nat
ft1 = fibbterm (S O)

||| a test, expecting (S (S (S O)))
ft4: nat
ft4 = fibbterm four -}

-- zero
z: nat
z = O

-- one
o: nat
o = S O

-- two 
t: nat
t = S (S O)

-- three
r: nat
r = S t

-- four
four: nat
four = S r

r1: nat
r1 = add O (S O) 
--expecting (S O)

r2: nat
r2 = add (S O) (S (S O))
--expecting (S (S (S O)))

pf: nat -> nat
pf = add (S (S O))

r3: nat
r3 = mult O t
--expecting O

r4: nat
r4 = mult t O
--expecting O

r5: nat
r5 = mult o t
--expecting (S (S O))

r6: nat
r6 = fact O
--expecting (S O)

r7: nat
r7 = fact r
--expecting (S (S (S (S (S (S O))))))

r8: nat 
r8 = sub r t
--expecting (S O)

r9: nat
r9 = sub t r
--expecting O

r1O: nat
r1O = exp t t
--expecting (S (S (S (S O))))

r11: bool
r11 = le t r
--expecting true

r12: bool
r12 = le r r
--expecting true

{- r13: bool
r13 = eq t r
--expecting false -}

{- r14: bool
r14 = eq o o
--expecting true-}

r15: bool
r15 = gt O O
--expecting false

r16: bool
r16 = ge t r
--expecting false

r17: bool
r17 = ge t t
--expecting true

r18: bool
r18 = ge r t
--expecting true

r19: bool
r19 = lt t r
--expecting true

r2O: bool
r2O = lt t t
--expecting false

r21: bool
r21 = lt r t
--expecting false

r22: nat
r22 = fib (S (S (S (S O))))
--expecting (S (S (S O)))

snat: String
snat = toString (S(S(S O)))
