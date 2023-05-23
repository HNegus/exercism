import sequtils
import strutils
import algorithm

proc isAnagram(a, b: string): bool =
  toSeq(a).sorted == toSeq(b).sorted

proc detectAnagrams*(word: string, candidates: openArray[string]): seq[string] =
  var word = word.toLower
  candidates.filterIt(it.toLower != word and it.toLower.isAnagram word)

