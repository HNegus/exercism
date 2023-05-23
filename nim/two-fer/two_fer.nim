proc twoFer*(name = ""): string =
  if name.len > 0:
    "One for " & name & ", one for me."
  else:
    "One for you, one for me."
