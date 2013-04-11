object TicTacToe{
  def get_winner(board: Array[String]):String = {
    if (board.size != 9) {
      "Invalid board"
    } else {
      var result = three_match(board(0), board(1), board(2))
      if (result.isEmpty) {
        result = three_match(board(3), board(4), board(5))
        if (result.isEmpty) {
          result = three_match(board(6), board(7), board(8))
          if (result.isEmpty) {
            result = three_match(board(0), board(3), board(6))
            if (result.isEmpty) {
              result = three_match(board(1), board(4), board(7))
              if (result.isEmpty) {
                result = three_match(board(2), board(5), board(8))
                if (result.isEmpty) {
                  result = three_match(board(0), board(4), board(8))
                  if (result.isEmpty) {
                    result = three_match(board(2), board(4), board(6))
                  }
                }
              }
            }
          }
        }
      }

      if (result.isEmpty) {
        "No winner"
      } else {
        result + " wins!"
      }
    }
  }

  def three_match(firstVal: String, secondVal: String, thirdVal: String):String = {
    if ((firstVal == "X" || firstVal == "O") && firstVal == secondVal && firstVal == thirdVal) {
      firstVal
    } else {
      ""
    }
  }

  def valid_board(board: Array[String]) = {
    true
  }
}

val emptyBoard = Array[String]()
println(TicTacToe.get_winner(emptyBoard))

val boardWithTooFewIndices = Array("", "", "")
println(TicTacToe.get_winner(boardWithTooFewIndices))

val boardWithNoMovesPlayed = Array("", "", "", "", "", "", "", "", "")
println(TicTacToe.get_winner(boardWithNoMovesPlayed))

val boardWithNoWinner = Array("X", "O", "X",
                              "X", "O", "O",
                              "O", "X", "O")
println(TicTacToe.get_winner(boardWithNoWinner))

val horizontalWinner = Array("X", "X", "X",
                             "X", "O", "O",
                             "O", "X", "O")
println(TicTacToe.get_winner(horizontalWinner))
