import std/sequtils

type
  Allergen* = enum
    Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats

proc isAllergicTo*(score: int, allergen: Allergen): bool =
  (score and 1 shl allergen.int) != 0

proc allergies*(score: int): set[Allergen] =
  for allergen in Eggs..Cats:
    if isAllergicTo(score, allergen): 
      result.incl(allergen)
  return result
