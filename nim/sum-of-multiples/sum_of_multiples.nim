import std/sets

proc sum*(limit: int, factors: openArray[int]): int =
  var numbers: HashSet[int]
  for factor in factors:
    var fac = factor
    if fac == 0:
      continue
    while fac < limit:
      if not numbers.contains(fac):
        result += fac
        numbers.incl(fac)
      fac += factor

