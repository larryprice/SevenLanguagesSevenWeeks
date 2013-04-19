val m = Map("Shoot" -> "Picky", "Darn" -> "Beans")
println(m.foldLeft("Shoots and Darn")((result, atom) => result.replace(atom._1, atom._2)))