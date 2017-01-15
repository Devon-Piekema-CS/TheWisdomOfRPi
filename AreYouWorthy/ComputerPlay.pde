void computerPlay() {
  // 1. Check if winning move is possible (have two markers along one of the eight dimensions
  instantWin();

  if (!gameOver) {
    // 2. Check if winning move is possible for opponent (if it is -> block)
    blockUser();

    // 3. Check if one dimension has an x marker and two empty spots

    // 4. Check if centre is avaliable
    if (whoseTurn == computer) {
      if (board[1][1] == 0) {
        board[1][1] = 2;
        nMarker++;
        whoseTurn = user;
        println("Placing marker in centre");
      }
    }

    // 5. Place marker randomly
    if (whoseTurn == computer) {
      println("Placing marker randomly");
      // Count the number of avaliable cells
      int nEmptyCells = 0;
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (board[i][j] == 0) {
            nEmptyCells++;
          } // if
        } // for
      } //for

      // Pick which empty cell will get a marker
      int nCell = int(random(nEmptyCells));
      nCell++;

      // Place marker in the selected cell
      int counter = 0;
      for (int i = 0; i < 3 && whoseTurn == computer; i++) {
        for (int j = 0; j < 3 && whoseTurn == computer; j++) {
          if (board[i][j] == 0) {
            counter++;
          }
          if (nCell == counter) {
            board[i][j] = 2;
            nMarker++;
            whoseTurn = user;
            println("Placing random marker (nCell=", nCell,") in col: ", i, ", row: ", j, "\n");
          } // if
        } // for
      } // for
    } // if
  }
  println("Computer's turn done! Current number of markers = ", nMarker, " (gameOver=",gameOver,")\n");
  printBoard();
  println("====================");
}