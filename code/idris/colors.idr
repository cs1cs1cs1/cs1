module colors
import bool
import pair

data colors = red | yellow | green | cyan | blue | magenta

complement: colors -> colors
complement red = cyan
complement yellow = blue
complement green = magenta
complement cyan = red
complement blue = yellow
complement magenta = green

additive: colors -> bool
additive red = true
additive green = true
additive blue = true
additive _ = false

subtractive: colors -> bool
subtractive t = not (additive t)

complements: (pair colors colors) -> bool
complements (mkPair red cyan) = true
complements (mkPair cyan red) = true
complements (mkPair yellow blue) = true
complements (mkPair blue yellow) = true
complements (mkPair green magenta) = true
complements (mkPair magenta green) = true
complements (mkPair _ _) = false

mixink: (pair colors colors) -> colors
mixink (mkPair yellow cyan) = green
mixink (mkPair cyan yellow) = green
mixink (mkPair yellow magenta) = red
mixink (mkPair magenta yellow) = red
mixink (mkPair magenta cyan) = blue
mixink (mkPair cyan magenta) = blue
