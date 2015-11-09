module Person

import bool

record Person where
  constructor mkPerson
  name: String
  age: Nat
  height: Nat
  gender: bool

setName: Person -> String -> Person
setName p n = record { name = n } p
