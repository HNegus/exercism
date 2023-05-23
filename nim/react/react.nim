import std/sequtils

type
  ComputeFunc = proc(vals: seq[int]): int {.noSideEffect.}

  Callback = proc(val: int)

  Cell = ref object
    val: int
    callback: Callback

proc newInputCell*(val: int): Cell =
  Cell(val: val)

proc value*(cell: Cell): int =
  cell.val

proc `value=`*(cell: var Cell, val: int) =
  if cell.callback != nil: cell.callback(val)
  cell.val = val

proc newComputeCell*(dependencies: seq[Cell], compute: ComputeFunc): Cell =
  var vals: seq[int] = @[]
  for cell in dependencies:
    vals.add cell.value

  result = newInputCell(compute(vals))
  result.callback = nil


proc addCallback*(cell: Cell, callback: Callback) =
  cell.callback = callback
  discard

proc removeCallback*(cell: Cell, callback: Callback) =
  cell.callback = nil
  discard

# * ----
func firstPlusOne(vals: seq[int]): int =
  vals[0] + 1

func firstPlusSecondBy10(vals: seq[int]): int =
  vals[0] + vals[1] * 10

var
    i1 = newInputCell(1)
    c1 = newComputeCell(@[i1], firstPlusOne)
  i1.value = 3