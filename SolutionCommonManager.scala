
// you can write to stdout for debugging purposes, e.g.
// println("this is a debug message")

object SolutionCommonManager extends App {

  sealed abstract class Tree {
    def add(empManager: String, empDep: String): Tree = {
      this match {
        case Empty => {
          if (empManager > empDep) Node(empManager, Node(empDep, Empty, Empty), Empty)
          else Node(empManager, Empty, Node(empDep, Empty, Empty))
        }
        case node: Node if node.elem > empManager => node.copy(left = node.left.add(empManager, empDep))
        case node: Node if node.elem < empManager => node.copy(right = node.right.add(empManager, empDep))
        case node: Node if node.right == Empty => node.copy(right = Node(empDep, Empty, Empty))
        case node: Node if node.left == Empty => node.copy(left = Node(empDep, Empty, Empty))
      }
    }
  }
  case object Empty extends Tree
  case class Node(elem: String, left: Tree, right: Tree) extends Tree

  object Tree {
    def empty: Tree = Empty
  }


  def lowestCommonAncestor(root: Tree, emp1: String, emp2: String): Option[String] =
    root match {
      case Empty => None
      case node: Node if node.elem == emp1 || node.elem == emp2 => Some(node.elem)
      case node: Node => {
        val left = lowestCommonAncestor(node.left, emp1, emp2)
        val right = lowestCommonAncestor(node.right, emp1, emp2)
        left.fold(right)(l => right.map(_ => root.asInstanceOf[Node].elem).orElse(Some(l)))
      }
    }

  def createTreeManagement(relations: List[Array[String]]): Tree =
    relations.foldLeft(Tree.empty){ (tree: Tree, relation: Array[String]) => tree.add(relation(0), relation(1)) }


  def OutputCommonManager(count: Int) = {
    val employee1: String = Console.readLine
    val employee2: String = Console.readLine
    val relations: List[Array[String]] = (1 to count+1)
      .map(_ -> Console.readLine.split(" "))
      .map(_._2)
      .toList
    val tree: Tree = createTreeManagement(relations)
    println(tree)
    val lowest = lowestCommonAncestor(tree, employee1, employee2)
    println(lowest.getOrElse("NO COMMON ANCESTOR"))
  }

  override def main(args: Array[String]) {
    var _count:Int = Console.readInt
    OutputCommonManager(_count)
  }

}