void computerPlay() {
  println("Computer's turn!\n");
  // 1. Check if winning move is possible (have two markers along one of the eight dimensions
  instantWin();

  if (!win) {
    // 2. Check if winning move is possible for opponent (if it is -> block)
    blockUser();

    // 3. Check if one dimension has an x marker and two empty spots

    // 4. Check if centre is avaliable
    if (whoseTurn == computer) {
      if (board[1][1] == 0) {
        board[1][1] == 2;
        whoseTurn = user;
      }
    }

    // 5. Place marker randomly
    if (whoseTurn == computer) {
      // Count the number of avaliable cells
      int nEmptyCells = 0;
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (board[i][j] == 0) {
            nEmptyCells++;
          }
        }

        // Pick which empty cell will get a marker
        int n = int(random(nEmptyCells));
        n++;

        // Place marker in the selected cell
        int m = 0;
        for (int i = 0; i < 3; i++) {
          for (int j = 0; j < 3; j++) {
            if (board[i][j] == 0) m++;
            if (n == m) {
              (board[i][j] == 2);
              whoseTurn = user;
            }
          }
        }
      }
    }
  }