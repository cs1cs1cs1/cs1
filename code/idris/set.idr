module set

import list
import ite
import bool
import eq
import Serialize

||| mkSet is meant to be private (known and usable within module, not for clients)
data set a = mkSet (list a)

||| a starting point for building any set- empty set
new_set: set a
new_set = mkSet nil

||| return { given value } union given set
set_insert: (eq a) => a -> set a -> set a
set_insert v (mkSet l) = ite (member v l)
                             (mkSet l)
                             (mkSet (v::l))

{- eql_set: (eq a) => set a -> set a -> bool
eql_set (mkSet l1) (mkSet l2) = same_elements l1 l2

instance (eq a) => eq (set a) where
  eql s1 s2 = eql_set s1 s2 -}

{- toStringListVal: (Serialize a) => (set a) -> String
toStringListVal (mkSet nil) = ""
toStringListVal (mkSet (h::nil)) = (toString h)
toStringListVal (mkSet (h::t)) = (toString h) ++ ", " ++ (toStringListVal (mkSet t))

instance (Serialize a) => Serialize (set a) where
  toString s = "{" ++ (toStringListVal s) ++ "}" -}
