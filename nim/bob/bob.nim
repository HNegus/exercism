import std/strutils

proc capitalised(s: string): bool =
  if s.len == 0:
    return false

  var flag = false
  for c in s:
    if c.isUpperAscii and c.isAlphaAscii:
      flag = true
    if not c.isUpperAscii and c.isAlphaAscii:
      return false
  return flag

proc hey*(s: string): string =
  var s = s.strip
  if s.len == 0:
    return "Fine. Be that way!"
  elif s[s.len - 1] == '?':
    if capitalised(s[0..s.len - 1]):
      return "Calm down, I know what I'm doing!"   
    else:
      return "Sure."
  elif s.capitalised():
    return "Whoa, chill out!"
  "Whatever."