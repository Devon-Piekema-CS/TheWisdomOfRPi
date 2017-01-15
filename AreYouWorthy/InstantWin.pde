// Search board for an instant win for the computer, i.e. two markers already exists in a given dimension and the third cell is empty. 

// Three combinations with a total of 8 possibilities...
// Option 1     Option 2     Option 3
// o            o            -
// o        or  -        or  o
// -            o            o

void instantWin() {

  // Loop across board from left to right and check the three possible options (checking rows)
  for (int y = 0; y<3; y++) {    
    // Option 1 - checking row for 220
    if (board[0][y] == 2 && board[1][y] == 2 && board[2][y] == 0) {
      board[2][y] = 2;
      nMarker++;
      gameOver = true;
      println("Instant win move - Option 1\n");
    } 
    // Option 2 - checking row for 202
    else if (board[0][y] == 2 && board[1][y] == 0 && board[2][y] == 2) {
      board[1][y] = 2;
      nMarker++;
      gameOver = true;
      println("Instant win move - Option 2\n");
    }
    // Option 3 - Checking row for 022
    else if (board[0][y] == 0 && board[1][y] == 2 && board[2][y] == 2) {
      board[0][y] = 2;
      nMarker++;
      gameOver = true;
      println("Instant win move - Option 3\n");
    }
  }  

  // Loop across board from top to bottom and check the three possible options (checking columns)
  for (int x = 0; x<3; x++) {    
    // Option 1 - checking column for 220 (vertically)
    if (board[x][0] == 2 && board[x][1] == 2 && board[x][2] == 0) {
      board[x][2] = 2;
      nMarker++;
      gameOver = true;
      println("Instant win move - Option 4");
    } 
    // Option 2 - checking column for 202 (vertically)
    else if (board[x][0] == 2 && board[x][1] == 0 && board[x][2] == 2) {
      board[x][1] = 2;
      nMarker++;
      gameOver = true;
      println("Instant win move - Option 5\n");
    }
    // Option 3 - checking for 022 (vertically)
    else if (board[x][0] == 0 && board[x][1] == 2 && board[x][2] == 2) {
      board[x][0] = 2;
      nMarker++;
      gameOver = true;
      println("Instant win move - Option 6\n");
    }
  }  

  // Left diagonal
  //
  // Option 1
  if (board[0][0] == 2 && board[1][1] == 2 && board[2][2] == 0) {
    board[2][2] = 2;
    nMarker++;
    gameOver = true;
    println("Instant win move - Option 7\n");
  } 
  // Option 2
  else if (board[0][0] == 2 && board[1][1] == 0 && board[2][2] == 2) {
    board[1][1] = 2;
    nMarker++;
    gameOver = true;
    println("Instant win move - Option 8\n");
  }
  // Option 3
  else if (board[0][0] == 0 && board[1][1] == 2 && board[2][2] == 2) {
    board[0][0] = 2;
    nMarker++;
    gameOver = true;
    println("Instant win move - Option 9\n");
  }

  // Right diagonal
  //
  // Option 1
  if (board[2][0] == 2 && board[1][1] == 2 && board[0][2] == 0) {
    board[0][2] = 2;
    nMarker++;
    nMarker++;
    gameOver = true;
    println("Instant win move - Option 10\n");
  } 
  // Option 2
  else if (board[2][0] == 2 && board[1][1] == 0 && board[0][2] == 2) {
    board[1][1] = 2;
    nMarker++;
    gameOver = true;
    println("Instant win move - Option 11\n");
  }
  // Option 3
  else if (board[2][0] == 0 && board[1][1] == 2 && board[0][2] == 2) {
    board[2][0] = 2;
    nMarker++;
    gameOver = true;
    println("Instant win move - Option 12\n");
  }
}