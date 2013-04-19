import scala.io._
import scala.actors._
import Actor._

object PageLoader {
  def getPageStats(url: String):(Int, Int) = {
    val page = Source.fromURL(url).mkString
    val size = page.length
    // val num_links = (scala.xml.parsing.XhtmlParser(page) \ "a").size
    val num_links = "<a [^>]*href[^>]*>".r.findAllIn(page).size
    (size, num_links)
  }
}

var urls = List("https://github.com/", "http://reddit.com/", "http://google.com", "http://cnn.com")

def timeMethod(method: () => Unit) = {
  val start = System.nanoTime
  method()
  val end = System.nanoTime
  println("Method took " + (end - start)/1000000000.0 + " seconds")
}

// def getPageSizeSequentially() = {
//   for(url <- urls) {
//     println("Size for " + url + ": " + PageLoader.getPageStats(url))
//   }
// }

def getPageSizeConcurrently() = {
  val caller = self

  for (url <- urls) {
    actor { caller ! (url, PageLoader.getPageStats(url)) }
  }

  for (i <- 1 to urls.size) {
    receive {
      case (url, (size, links)) => {
        println("Size for " + url + ": " + size)
        println("Number of links for " + url + ": " + links)
      }
    }
  }
}

// println("Sequential run")
// timeMethod { getPageSizeSequentially }

println("Concurrent run")
timeMethod { getPageSizeConcurrently }
