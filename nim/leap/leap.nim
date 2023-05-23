proc isLeapYear*(year: int): bool =
  if year mod 400 == 0:
    true
  elif year mod 4 == 0 and year mod 100 != 0:
    true
  else:
    false