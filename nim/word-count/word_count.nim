import std/tables
import std/strutils

proc countWords*(s: string): Table[string, int] =
  var s = s.toLower
  for i in 0..<s.len:
    if not isAlphaNumeric(s[i]): 
      if i == 0 or i == s.len - 1:
        s[i] = ' '
        continue
      if s[i] != '\'':
        s[i] = ' '
        continue
      if not isAlphaNumeric(s[i - 1]) or not isAlphaNumeric(s[i + 1]):
        s[i] = ' '
  for word in s.splitWhitespace:
    if result.contains word: result[word] += 1 else: result[word] = 1
