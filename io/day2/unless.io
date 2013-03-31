unless := method(
  (call sender doMessage(call message argAt(0))) ifFalse(
   call sender doMessage(call message argAt(1))) ifTrue(
   call sender doMessage(call message argAt(2)))
)

unless(1 == 2, write("One is not two\n"), write("one is two\n"))

westley := Object clone
westley trueLove := true

princessButtercup := Object clone

westley findLove := method(princessButtercup unless(trueLove, ("It is false" println), ("It is true" println)))
westley findLove
