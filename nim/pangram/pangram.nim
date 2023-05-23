import strutils
import sequtils

proc isPangram*(s: string): bool =
  var letters: set[char]
  s.toUpper.filter(isAlphaAscii).apply(proc(c: char) = letters.incl c)
  letters.len >= 26