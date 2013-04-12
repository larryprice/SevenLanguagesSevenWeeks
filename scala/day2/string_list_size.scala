val list = List("this", "has", "14", "chars")


println(list.foldLeft(0)((sum, word) => sum + word.size))
