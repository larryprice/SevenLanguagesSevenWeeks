
object := Object clone

object name := "Larry"
object age := 22
object facial_hair := true

list("name", "age", "facial_hair") foreach(i, func, object perform(func) println)
