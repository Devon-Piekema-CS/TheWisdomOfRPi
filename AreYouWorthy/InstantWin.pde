// Search board for an instant win for the computer, i.e. two markers already exists in a given dimension and the third cell is empty. 
// Function returns the coordinates of avaliable cell. (-1,-1) if no cell is availiable

// Three possibilities...
// Option 1     Option 2     Option 3
// o            o            -
// o        or  -        or  o
// -            o            o

boolean instantWin() {

  boolean win = false;
  
  // Loop across board from left to right and check the three possible options 
  for (int i = 0; i < 3; i = i+1) {    
    // Option 1
    if (board[i][0] == 2 && board[i][1] == 2 && board[i][2] == 0) {
      board[i][2] = 2;
      win = true;
    } 
    // Option 2
    else if (board[i][0] == 2 && board[i][1] == 0 && board[i][2] == 2) {
      board[i][1] = 2;
      win = true;
    }
    // Option 3
    else if (board[i][0] == 0 && board[i][1] == 2 && board[i][2] == 2) {
      board[i][0] = 2;
      win = true;
    }
  }  
  
  // Loop across board from top to bottom and check the three possible options 
  for (int i = 0; i < 3; i = i+1) {    
    // Option 1
    if (board[0][i] == 2 && board[1][i] == 2 && board[2][i] == 0) {
      board[i][2] = 2;
      win = true;
    } 
    // Option 2
    else if (board[i][0] == 2 && board[i][1] == 0 && board[i][2] == 2) {
      board[i][1] = 2;
      win = true;
    }
    // Option 3
    else if (board[i][0] == 0 && board[i][1] == 2 && board[i][2] == 2) {
      board[i][0] = 2;
      win = true;
    }
  }  
  
  // Left diagonal
  //
  // Option 1
  if (board[0][0] == 2 && board[1][1] == 2 && board[2][2] == 0) {
    board[2][2] = 2;
    win = true;
  } 
  // Option 2
  else if (board[0][0] == 2 && board[1][1] == 0 && board[2][2] == 2) {
    board[1][1] = 2;
    win = true;
  }
  // Option 3
  else if (board[0][0] == 0 && board[1][1] == 2 && board[2][2] == 2) {
    board[0][0] = 2;
    win = true;
  }
  
  // Right diagonal
  //
  // Option 1
  if (board[2][0] == 2 && board[1][1] == 2 && board[0][2] == 0) {
    board[0][2] = 2;
    win = true;
  } 
  // Option 2
  else if (board[2][0] == 2 && board[1][1] == 0 && board[0][2] == 2) {
    board[1][1] = 2;
    win = true;
  }
  // Option 3
  else if (board[2][0] == 0 && board[1][1] == 2 && board[0][2] == 2) {
    board[2][0] = 2;
    win = true;
  }

  return(win);
}