import scala.collection.mutable.HashMap
import scala.io.Source

class Person

trait Censor {
  val curses = new HashMap[String, String]
  load_curses
  def censor(words: String) = {
    words.split(" ").map(word => if (curses.contains(word)) curses(word) else word).mkString(""," ", "")
  }

  def load_curses() {
    Source.fromFile("curses.txt").getLines.foreach { line =>
      val pair = line.split(",")
      if (pair.size == 2) {
        curses(pair.head) = pair.last
      }
    }
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
