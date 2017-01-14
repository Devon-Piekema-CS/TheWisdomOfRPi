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
  // println("whose turn:",whoseTurn,"board[0][0]:",board[0][0]," x:",mouseX," y:", mouseY,"\n");
}

void mousePressed() {
  if (overEmptyCell && whoseTurn == user && !gameOver) { 
    //println("************************************************Mouse pressed\n");
    board[x][y] = 1;
    whoseTurn = computer; // The computer is next up
    println("User's turn!\n");
  }
}