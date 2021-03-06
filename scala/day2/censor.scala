class Person

trait Censor {
  val curses = Map("Shoot" -> "Pucky", "Darn" -> "Beans")
  def censor(words: String) = {
    words.split(" ").map(word => if (curses.contains(word)) curses(word) else word).mkString(""," ", "")
  }
}

class PottyMouth extends Person with Censor {
  var words = "Ah Shoot I forgot to eat my beans! Darn and Damn!"
  def get_censored():String = {
    censor(words)
  }
}

val parker = new PottyMouth
println("Uncensored: " + parker.words)
println("Censored: " + parker.get_censored)
