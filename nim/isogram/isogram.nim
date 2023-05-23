import sequtils
import strutils

proc isIsogram*(s: string): bool =
  var letters: set[char]
  var s = s.filterIt(isAlphaAscii it) 
  s.apply(proc(c: char) = letters.incl(c.toLowerAscii))
  return s.len == letters.len