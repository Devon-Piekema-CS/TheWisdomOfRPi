void userPlay() {

  // Find which cell the cursor is over and if the cell is empty
  if (mouseX > 0 && mouseX < L && mouseY > 0 && mouseY < T) {
    if (board[0][0] == 0) {
      overEmptyCell = true;   
      x = 0;
      y = 0;
    } else {
      overEmptyCell = false;
    }
  } else if (mouseX > 0 && mouseX < R && mouseY > 0 && mouseY < T) {
    if (board[1][0] == 0) {
      overEmptyCell = true;   
      x = 1;
      y = 0;
    } else {
      overEmptyCell = false;
    }
  } else if (mouseX > R && mouseX < w && mouseY > 0 && mouseY < T) {
    if (board[2][0] == 0) {
      overEmptyCell = true;   
      x = 2;
      y = 0;
    } else {
      overEmptyCell = false;
    }
  } else if (mouseX > 0 && mouseX < L && mouseY > T && mouseY < B) {
    if (board[0][1] == 0) {
      overEmptyCell = true;   
      x = 0;
      y = 1;
    } else {
      overEmptyCell = false;
    }
  } else if (mouseX > L  && mouseX < R && mouseY > T && mouseY < B) {
    if (board[1][1] == 0) {
      overEmptyCell = true;   
      x = 1;
      y = 1;
    } else {
      overEmptyCell = false;
    }
  } else if (mouseX > R  && mouseX < w && mouseY > T && mouseY < B) {
    if (board[2][1] == 0) {
      overEmptyCell = true;   
      x = 2;
      y = 1;
    } else {
      overEmptyCell = false;
    }
  } else if (mouseX > 0 && mouseX < L && mouseY > B && mouseY < h) {
    if (board[0][2] == 0) {
      overEmptyCell = true;   
      x = 0;
      y = 2;
    } else {
      overEmptyCell = false;
    }
  } else if (mouseX > L && mouseX < R && mouseY > B && mouseY < h) {
    if (board[1][2] == 0) {
      overEmptyCell = true;   
      x = 1;
      y = 2;
    } else {
      overEmptyCell = false;
    }
  } else if (mouseX > R && mouseX < w && mouseY > B && mouseY < h) {
    if (board[2][2] == 0) {
      overEmptyCell = true;   
      x = 2;
      y = 2;
    } else {
      overEmptyCell = false;
    } // if
  }
  
  // After the user's turn the game is over if:
    // 1) The user has three in a row (the human wins)
    // 2) The board is full (a total of nine markers) and user does not have three in a row (draw)

    // For option 1...
    // ... there are 8 possible ways the user can have three in a row: 
    // 1. Left column
    // 2. Middle column
    // 3. Right column
    // 4. Top row
    // 5. Middle row
    // 6. Bottom row
    // 7. Left diagonal (going from top left corner to bottom right corner)
    // 8. Right diagonal (going from top right corner to bottom left corner)

    // Check if user has anyone of these outcomes
    if ((board[0][0] == 1 && board[0][1] == 1 && board[0][2] == 1) || 
      (board[1][0] == 1 && board[1][1] == 1 && board[1][2] == 1) ||
      (board[2][0] == 1 && board[2][1] == 1 && board[2][2] == 1) ||
      (board[0][0] == 1 && board[1][0] == 1 && board[2][0] == 1) ||
      (board[0][1] == 1 && board[1][1] == 1 && board[2][1] == 1) ||
      (board[0][2] == 1 && board[1][2] == 1 && board[2][2] == 1) ||
      (board[0][0] == 1 && board[1][1] == 1 && board[2][2] == 1) ||
      (board[2][0] == 1 && board[1][1] == 1 && board[0][2] == 1)) {
      gameOver = true;
      winner = user;
      println("User has three in a row!\n");
    } else if (nMarker == 9) {
      gameOver = true;
      winner = draw;
      println("nMarker=",nMarker,"\n");
      println("Board is full\n");
    } 
}

void mousePressed() {
  if (overEmptyCell && whoseTurn == user && !gameOver) { 
    //println("************************************************Mouse pressed\n");
    board[x][y] = 1;
    nMarker++;
    if (nMarker == 9) gameOver = true;
    whoseTurn = computer; // The computer is next up
    println("User's turn done! Current number of markers = ",nMarker," (gameOver=",gameOver,")\n");
    printBoard();
    println("====================");
  }
}