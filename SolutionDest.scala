import scala.io.StdIn
// you can write to stdout for debugging purposes, e.g.
// println("this is a debug message")

object SolutionDest extends App {

  def OutputMostPopularDestination(count: Int) = {
    println((1 to count)
      .map(_ -> Console.readLine)
      .map(_._2)
      .groupBy(identity)
      .mapValues(_.length)
      .maxBy(_._2)
      ._1)
  }

  override def main(args: Array[String]) {
    var _count:Int = Console.readInt
    OutputMostPopularDestination(_count)
  }

}