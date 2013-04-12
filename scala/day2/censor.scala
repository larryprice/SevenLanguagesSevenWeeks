class Person

trait Censor {
  val curses = Map("Shoot" -> "Pucky", "Darn" -> "Beans")
  def censor(words: String) = {
    words.split(" ").map(word => if (curses.contains(word)) curses(word) else word).mkString(""," ", "")
  }
}

class PottyMouth extends Person with Censor {
  var words = "Ah Shoot I forgot to eat my beans! Darn and Damn!" 
}

val parker = new PottyMouth
println("Uncensored: " + parker.words)
println("Censored: " + parker.censor(parker.words))
