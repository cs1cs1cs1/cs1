module notUnBox

import bool
import Box

data Box = mkBox bool

notUnBox: Box -> bool
notUnBox (mkBox true) = false
notUnBox (mkBox false) = true


