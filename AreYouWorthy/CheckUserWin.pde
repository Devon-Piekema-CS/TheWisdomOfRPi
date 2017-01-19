
void checkUserWin() {
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
  } else if (nMarker == 9) {
    gameOver = true;
    winner = draw;
  }
}