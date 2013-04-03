
List squareBrackets := method(index,
  at(index)
)

squareBrackets := method(
  call message arguments map(arg, doMessage(arg))
)

myList := ["a", "b", "c", "d", "e"]
myList[3] println

nestedList := [1, 2, [3, 4], 5]
nestedList println
nestedList[2][0] println
