module unit

import eq
import bool
import Serialize

data unit = mkUnit

unit_id: unit -> unit
unit_id mkUnit = mkUnit

--equality
eql_unit: unit -> unit -> bool
eql_unit u1 u2 = true

--overloaded operators
instance eq unit where
  eql u1 u2 = true

instance Serialize unit where
  toString u = "()"
