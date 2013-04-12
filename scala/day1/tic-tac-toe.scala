class Board {
  private var board = Array("", "", "", "", "", "", "", "", "")
  def this(currentBoard: Array[String]) {
    this()
    if (is_valid()) {
      board = currentBoard
    }
  }

  def at(index: Int):String = {
    board(index)
  }

  def set(index: Int, value: String) {
    if (board(index).isEmpty) {
      board(index) = value
    }
  }

  def spots_filled():Int = {
    board.count(x => x == "X" || x == "O")
  }

  private def is_valid():Boolean = {
    if (board.size != 9) {
      false
    } else {
      val num_x = board.count(x => x == "X")
      val num_o = board.count(x => x == "O")
      (num_x == num_o) || (num_x == (num_o + 1))
    }
  }
}

class TicTacToe {
  private var board = new Board
  var winner = "No winner"
  def this(currentBoard: Board) {
    this()
    board = currentBoard
    find_winner
  }

  def player_turn():String = {
    if (board.spots_filled % 2 == 0) {
      "X"
    } else {
      "O"
    }
  }

  def make_move(move: String) {
    try {
      val intMove = move.toInt
      board.set(intMove, player_turn)
      find_winner
    } catch {
      case e:Exception => 0
    }
  }

  def print_board() {
    for(i <- 0 until 9) {
      var spot = board.at(i)
      if (spot.isEmpty) {
        spot = "" + i
      }
      print(spot)
      if (((i + 1) % 3) != 0) {
        print("|")
      }
      if (((i+1) % 3) == 0) {
        println()
        if ((i+1) != 9) {
          println("- - -")
        }
      }
    }
  }

  private def find_winner() {
    var calc = new WinCalculator(board)
    val result = calc.get_result

    if (result.isEmpty) {
      if (board.spots_filled == 9) {
        winner = "Tie game!"
      } else {
        winner = "No winner"
      }
    } else {
      winner = result + " wins!"
    }
  }
}

class WinCalculator(currentBoard: Board) {
  private val board = currentBoard
  private var result = check_horizontal_winner
  if (result.isEmpty) {
    result = check_vertical_winner
    if (result.isEmpty) {
      result = check_diagonal_winner
    }
  }

  def get_result():String = {
    result
  }

  private def check_horizontal_winner():String = {
    var result = three_match(board.at(0), board.at(1), board.at(2))
    if (result.isEmpty) {
      result = three_match(board.at(3), board.at(4), board.at(5))
      if (result.isEmpty) {
        result = three_match(board.at(6), board.at(7), board.at(8))
      }
    }
    result
  }

  private def check_vertical_winner():String = {
    var result = three_match(board.at(0), board.at(3), board.at(6))
    if (result.isEmpty) {
      result = three_match(board.at(1), board.at(4), board.at(7))
      if (result.isEmpty) {
        result = three_match(board.at(2), board.at(5), board.at(8))
      }
    }
    result
  }

  private def check_diagonal_winner():String = {
    var result = three_match(board.at(0), board.at(4), board.at(8))
    if (result.isEmpty) {
      result = three_match(board.at(2), board.at(4), board.at(6))
    }
    result
  }

  private def three_match(firstVal: String, secondVal: String, thirdVal: String):String = {
    if ((firstVal == "X" || firstVal == "O") && firstVal == secondVal && firstVal == thirdVal) {
      firstVal
    } else {
      ""
    }
  }
}

object Tester {
  def test(expected: String, actual: String) {
    if (expected != actual) {
      println("ERROR: expected != actual")
      println("ERROR: " + expected + " != " + actual)
    }
  }

  def test_no_winner(actual: String) {
    test("No winner", actual)
  }

  def test_x_wins(actual: String) {
    test("X wins!", actual)
  }

  def test_o_wins(actual: String) {
    test("O wins!", actual)
  }

  def test_tie_game(actual: String) {
    test("Tie game!", actual)
  }
}

val emptyGame = new TicTacToe
Tester.test_no_winner(emptyGame.winner)

val noWinner1 = new TicTacToe(new Board(Array("X", "", "", "", "", "", "", "", "")))
Tester.test_no_winner(noWinner1.winner)

val fullGameNoWinner = new TicTacToe(new Board(Array("X", "O", "X",
                                                     "O", "X", "X",
                                                     "O", "X", "O")))
Tester.test_tie_game(fullGameNoWinner.winner)

val xWinsHorizontalRow1 = new TicTacToe(new Board(Array("X", "X", "X",
                                                        "X", "O", "O",
                                                        "O", "", "")))
Tester.test_x_wins(xWinsHorizontalRow1.winner)

val oWinsHorizontalRow2 = new TicTacToe(new Board(Array("X", "X", "",
                                                        "O", "O", "O",
                                                        "O", "X", "X")))
Tester.test_o_wins(oWinsHorizontalRow2.winner)

val xWinsHorizontalRow3 = new TicTacToe(new Board(Array("X", "O", "O",
                                                        "X", "X", "X",
                                                        "O", "", "")))
Tester.test_x_wins(xWinsHorizontalRow3.winner)

val oWinsVerticalColumn1 = new TicTacToe(new Board(Array("O", "X", "",
                                                         "O", "X", "X",
                                                         "O", "", "")))
Tester.test_o_wins(oWinsVerticalColumn1.winner)

val xWinsVerticalColumn2 = new TicTacToe(new Board(Array("X", "X", "O",
                                                         "O", "X", "X",
                                                         "O", "X", "O")))
Tester.test_x_wins(xWinsVerticalColumn2.winner)

val oWinsVerticalColumn3 = new TicTacToe(new Board(Array("X", "X", "O",
                                                        "", "", "O",
                                                        "", "X", "O")))
Tester.test_o_wins(oWinsVerticalColumn3.winner)

val xWinsLeftRightDiag = new TicTacToe(new Board(Array("X", "O", "O",
                                                        "", "X", "O",
                                                        "", "X", "X")))
Tester.test_x_wins(xWinsLeftRightDiag.winner)

val oWinsRightLeftDiag = new TicTacToe(new Board(Array("X", "O", "O",
                                                        "", "O", "X",
                                                        "O", "X", "X")))
Tester.test_o_wins(oWinsRightLeftDiag.winner)


var game = new TicTacToe
while (game.winner == "No winner") {
  game.print_board
  println("Make a move, " + game.player_turn + "!")
  game.make_move(readLine())
}

game.print_board
println(game.winner)
