import strutils
import sequtils

proc abbreviate*(s: string): string =
  for word in s.replace('-', ' ').split(' ', -1):
    if word.len > 0:
      result.add word.filter(isAlphaAscii)[0].toUpperAscii
  
