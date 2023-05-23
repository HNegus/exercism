import sequtils

proc isTriangle(sides: array[3, int]): bool =
  if sides.anyIt(it <= 0): return false
  ((sides[0] + sides[1]) >= sides[2]) and
  ((sides[1] + sides[2]) >= sides[0]) and
  ((sides[2] + sides[0]) >= sides[1])

proc isEquilateral*(sides: array[3, int]): bool =
  isTriangle(sides) and sides[0] == sides[1] and sides[1] == sides[2]

proc isIsosceles*(sides: array[3, int]): bool =
  isTriangle(sides) and 
  (sides[0] == sides[1] or sides[1] == sides[2] or sides[0] == sides[2])

proc isScalene*(sides: array[3, int]): bool =
  isTriangle(sides) and not isIsosceles(sides)
