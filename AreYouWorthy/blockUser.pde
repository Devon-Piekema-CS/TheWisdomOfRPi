// Search board for an instant win for the user, i.e. two user markers already exists in a given dimension and 
// the third cell is empty (user can get an instant win in the next turn and computer needs to block the empty slot). 

// Three possibilities...
// Option 1     Option 2     Option 3
// x            x            -
// x        or  -        or  x
// -            x            x

void blockUser () {
  // Loop across board from left to right and check the three possible options 
  for (int i = 0; i < 3; i = i+1) {    
    // Option 1
    if (board[i][0] == 1 && board[i][1] == 1 && board[i][2] == 0) {
      board[i][2] = 2;
      whoseTurn = user; // The user is next up
    } 
    // Option 2
    else if (board[i][0] == 1 && board[i][1] == 0 && board[i][2] == 1) {
      board[i][1] = 2;
      whoseTurn = user; // The user is next up
    }
    // Option 3
    else if (board[i][0] == 0 && board[i][1] == 1 && board[i][2] == 1) {
      board[i][0] = 2;
      whoseTurn = user; // The user is next up    }
    }  

    // Loop across board from top to bottom and check the three possible options 
    for (i = 0; i < 3; i = i+1) {    
      // Option 1
      if (board[0][i] == 1 && board[1][i] == 1 && board[2][i] == 0) {
        board[i][2] = 2;
        whoseTurn = user; // The user is next up
      } 
      // Option 2
      else if (board[i][0] == 1 && board[i][1] == 0 && board[i][2] == 1) {
        board[i][1] = 2;
        whoseTurn = user; // The user is next up
      }
      // Option 3
      else if (board[i][0] == 0 && board[i][1] == 1 && board[i][2] == 1) {
        board[i][0] = 2;
        whoseTurn = user; // The user is next up
      }
    }  

    // Left diagonal
    //
    // Option 1
    if (board[0][0] == 1 && board[1][1] == 1 && board[2][2] == 0) {
      board[2][2] = 2;
      whoseTurn = user; // The user is next up
    } 
    // Option 2
    else if (board[0][0] == 1 && board[1][1] == 0 && board[2][2] == 1) {
      board[1][1] = 2;
      whoseTurn = user; // The user is next up
    }
    // Option 3
    else if (board[0][0] == 0 && board[1][1] == 1 && board[2][2] == 1) {
      board[0][0] = 2;
      whoseTurn = user; // The user is next up
    }

    // Right diagonal
    //
    // Option 1
    if (board[2][0] == 1 && board[1][1] == 1 && board[0][2] == 0) {
      board[0][2] = 2;
      whoseTurn = user; // The user is next up
    } 
    // Option 2
    else if (board[2][0] == 1 && board[1][1] == 0 && board[0][2] == 1) {
      board[1][1] = 2;
      whoseTurn = user; // The user is next up
    }
    // Option 3
    else if (board[2][0] == 0 && board[1][1] == 1 && board[0][2] == 1) {
      board[2][0] = 2;
      whoseTurn = user; // The user is next up
    }
  }
}