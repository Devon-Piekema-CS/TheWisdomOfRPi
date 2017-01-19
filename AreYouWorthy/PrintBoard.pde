void printBoard () {
  for (int col = 0; col < 3; col++) {
    for (int row = 0; row < 3; row++) {
      print(board[row][col]);
    } // for
    println();
  } //for
}