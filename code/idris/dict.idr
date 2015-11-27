module dict

import list
import set
import set_spec
import pair
import eq
import ite
import option
import Serialize
import bool

{- A dictionary is a finite collection of key-value pairs w/ at most  
one pair having a given key. Mathematically, a dict reprs a finite  
partial f(n) from values of a key type to values of a value  
type. Sunch a f(n) is finite by definition. It's a f(n) b/c a key can  
be assoc w/ at most one value (it's single-valued). And it's partial  
b/c not ev value of the key typte needs to have an assoc value in a  
dict. ie sqrt is not a f(n) b/c +/- -}

-- Specification
{- this dict ADT provides: a dict type, an empty dict, f(n)s to map a  
key to a value (if any) [look-up], derive a new dict from an existing one by tuple override, and derive a new dict from an existing one by removing  
a pair matching a given key (if any), and overloaded operators eql and  
toString. -}

data dict: (k:Type) -> (v:Type) -> Type

||| a 'constant' - starting pt for building dicts
emptyDict: dict k v

||| derive a new dict by removing any pair matching a key
dict_remove: (eq k, eq (pair k v)) => k -> dict k v -> dict k v 

||| computes the partial f(n) that the dict reprs. it takes a key and returns an option value, otherwise none. ie 'some Joe'
dict_lookup: (eq k) => k -> dict k v -> option v

-- implementation
{- we repr a dict as a set of key-value pairs s/ the invariant that at  
most one pair can have a given key -}
data dict k v = mkDict (set (pair k v))

emptyDict = mkDict emptySet

--helper for eql
matchKey: (eq k) => k -> pair k v -> bool
matchKey k (mkPair k1 p1) = ite (eql k k1) true false

--helper for ineql
notMatchKey: (eq k) => k -> pair k v -> bool
notMatchKey k p = not (matchKey k p)

set_filter: (a -> bool) -> set a -> set a
set_filter f (mkSet v) = mkSet (filter f v)

--filter to keep entries w/ non-matching keys
dict_remove k (mkDict s) = mkDict (set_filter (notMatchKey k) s)

dict_eql: (eq k, eq v) => (dict k v) -> (dict k v) -> bool
dict_eql (mkDict (s1)) (mkDict (s2)) = set_eql s1 s2

instance (eq k, eq v) => eq (dict k v) where
  eql d1 d2 = dict_eql d1 d2

dict_toString: (Serialize k, Serialize v, Serialize (pair k v)) => (dict k v) -> String
dict_toString (mkDict (emptySet)) = ""
dict_toString (mkDict (mkSet p)) = "{" ++ (set_toString (mkSet p)) ++ "}"

instance (Serialize k, Serialize v, Serialize (pair k v)) => Serialize (dict k v) where
  toString d = dict_toString d

--for dict lookup
key2value: (eq k) => k -> (pair k v) -> option v
key2value k1 (mkPair k2 v) = ite (eql k1 k2) (some v) none

{- ||| give a k, v, and dict. give back a dict just like the one we started w/ but the given key is now assoc w/ a new value. it inserts a new pair into a dict, first femoving any pair in the dict w/ a matching key.
dict_override: (eq k, eq (pair k v)) => k -> v -> dict k v -> dict k v
dict_override k1 v1 (mkDict s) = mkDict (set.set_insert (mkPair k1 v1))
--we have to remove (mkPair k0 v0) before adding in the new one -}
