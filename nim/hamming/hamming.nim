import sequtils
import math

proc distance*(a, b: string): int =
  if a.len != b.len: raise newException(ValueError, "Strands must have same length")
  result = sum(map(zip(a, b), proc(c: (char, char)): int = (if c[0] != c[1]: 1 else: 0)))