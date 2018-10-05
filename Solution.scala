// you can write to stdout for debugging purposes, e.g.
// println("this is a debug message")

object Solution extends App {

  def solution(a: Array[Int]): Int = {
    val (leftL, rightL) = a.splitAt(1)
    val (leftR, rightR) = a.splitAt(a.length-1)
    Math.abs(leftL.max - rightL.max).max(Math.abs(leftR.max - rightR.max))
  }

  println(solution(Array(1,3,-3,-4,6,7,-1,2)))
  println(solution(Array(3,7,-3,-4,1,6,-1,2)))
  println(solution((1 to 1000).toArray))
  println(solution((1 to 1000).reverse.toArray))
  private val array: Array[Int] = util.Random.shuffle((1 to 100000).toList).toArray
  println(solution(array))

}