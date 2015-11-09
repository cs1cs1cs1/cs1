module listTest

import list
import bool
import nat
import eq
import Serialize

el: list bool
el = nil

li: list bool
li = true :: false :: true :: true :: nil

app1: list Nat
app1 = 1::2::3::nil ++ 4::5::nil

app2: list bool
app2 = true::nil ++ nil

app3: list Nat
app3 = nil ++ nil

lbtst1: list bool
lbtst1 = map evenb (O::(S O)::(S (S O))::(S(S(S(S O))))::nil)

lbtst2: list nat
lbtst2 = filter evenb (O::(S O)::(S (S O))::(S(S(S(S O))))::nil)

sum: nat
sum = list.foldr add O ((S O)::(S (S O))::(S (S (S O)))::S (S (S (S (S (S O)))))::nil)

product: nat
product = list.foldr mult (S O) ((S O)::(S (S O))::(S (S (S O)))::S (S (S (S (S (S O)))))::nil)

tsli: String
tsli = toString li
