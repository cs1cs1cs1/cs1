module list_nat

import nat
import pair

data list_nat = nil | cons nat list_nat

lO: list_nat
lO = nil

l1: list_nat
l1 = cons O nil

l2: list_nat
l2 = (cons (S O) (cons (S (S O)) nil))

l3: list_nat
l3 = (cons (S O) (cons (S (S O)) (cons (S (S (S O))) nil)))

lengthn: list_nat -> nat
lengthn nil = O
lengthn (cons n l') = S (lengthn l')

len_l3: nat
len_l3 = lengthn l3

appendn: list_nat -> list_nat -> list_nat
appendn nil nil = nil
appendn nil (cons h t) = cons h t
appendn (cons h t) nil = cons h t
appendn (cons h1 t1) (cons h2 t2) = cons h1 (appendn t1 (cons h2 t2))

app_1: list_nat
app_1 = appendn l1 l2 
--expecting "cons O (cons (S O) (cons (S (S O)) nil))"
