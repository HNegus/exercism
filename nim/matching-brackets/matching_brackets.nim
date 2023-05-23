import std/deques

proc isPaired*(s: string): bool =
  var stack = initDeque[char](s.len)
  for c in s:
    case c
      of '[', '{', '(':
        stack.addLast c
      of ']':
        if stack.len == 0 or stack.popLast != '[': return false
      of '}':
        if stack.len == 0 or stack.popLast != '{': return false
      of ')':
        if stack.len == 0 or stack.popLast != '(': return false
      else: discard
  return stack.len == 0
