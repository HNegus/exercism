import std/strutils
import std/sequtils
import std/math

proc isArmstrongNumber*(n: int): bool =

  echo foldl(cast[seq[string]](n.intToStr), parseInt($a), 0)

  var number = n.intToStr
  var total = 0
  for c in n.intToStr:
    total += parseInt($c) ^ number.len
  total == n

discard isArmstrongNumber(153) 