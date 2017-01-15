// Search board for an instant win for the user, i.e. two user markers already exists in a given dimension and 
// the third cell is empty (user can get an instant win in the next turn and computer needs to block the empty slot). 

// Three possibilities...
// Option 1     Option 2     Option 3
// x            x            -
// x        or  -        or  x
// -            x            x

void blockUser () {
  // Loop across board from left to right and check the three possible options 
  for (int x=0; x<3; x++) {    
    // Option 1 - checking col for 110 (vertically)
    if (board[x][0] == 1 && board[x][1] == 1 && board[x][2] == 0) {
      board[x][2] = 2;
      nMarker++;
      whoseTurn = user; // The user is next up
      println("Blocking at x:", x, ", y:2 (110 vertically)");
    } // if
    // Option 2 - checking col for 101 (vertically)
    else if (board[x][0] == 1 && board[x][1] == 0 && board[x][2] == 1) {
      board[x][1] = 2;
      nMarker++;
      whoseTurn = user; // The user is next up
      println("Blocking at x:", x, ", y:1 (101 vertically)");
    } // if
    // Option 3 - checking col for 011 (vertically)
    else if (board[x][0] == 0 && board[x][1] == 1 && board[x][2] == 1) {
      board[x][0] = 2;
      nMarker++;
      whoseTurn = user; // The user is next up 
      println("Blocking at x:", x, ", y:0 (011 vertically)");
    } // if
  } // for

  // Loop across board from top to bottom and check the three possible options 
  for (int y=0; y<3; y++) {  
    // Option 1 - checking row for 110  
    if (board[0][y] == 1 && board[1][y] == 1 && board[2][y] == 0) {
      board[2][y] = 2;
      nMarker++;
      whoseTurn = user; // The user is next up
      println("Blocking at x:2, y:", y, "(110 row)");
    } 
    // Option 2 - checking row for 101
    else if (board[0][y] == 1 && board[1][y] == 0 && board[2][y] == 1) {
      board[1][y] = 2;
      nMarker++;
      whoseTurn = user; // The user is next up
      println("Blocking at x:1, y:", y,"(101 row)");
    }
    // Option 3 - checking row for 011
    else if (board[0][y] == 0 && board[1][y] == 1 && board[2][y] == 1) {
      board[0][y] = 2;
      nMarker++;
      whoseTurn = user; // The user is next up
      println("Blocking at x:0, y:", y,"011 row");
    }
  } // for  

  // Left diagonal
  //
  // Option 1
  if (board[0][0] == 1 && board[1][1] == 1 && board[2][2] == 0) {
    board[2][2] = 2;
    nMarker++;
    whoseTurn = user; // The user is next up
    println("Blocking at x:2, y:2 (left diagonal 110)");
  } 
  // Option 2
  else if (board[0][0] == 1 && board[1][1] == 0 && board[2][2] == 1) {
    board[1][1] = 2;
    nMarker++;
    whoseTurn = user; // The user is next up
    println("Blocking at x:1, y:1 (left diagonal 111)");
  }
  // Option 3
  else if (board[0][0] == 0 && board[1][1] == 1 && board[2][2] == 1) {
    board[0][0] = 2;
    nMarker++;
    whoseTurn = user; // The user is next up
    println("Blocking at x:0, y:0 (left diagonal 011)");
  }

  // Right diagonal
  //
  // Option 1
  if (board[2][0] == 1 && board[1][1] == 1 && board[0][2] == 0) {
    board[0][2] = 2;
    nMarker++;
    whoseTurn = user; // The user is next up
    println("Blocking at x:0, y:2 (right diagonal 110)");
  } 
  // Option 2
  else if (board[2][0] == 1 && board[1][1] == 0 && board[0][2] == 1) {
    board[1][1] = 2;
    nMarker++;
    whoseTurn = user; // The user is next up
    println("Blocking at x:1, y:1 (right diagonal 101)");
  }
  // Option 3
  else if (board[2][0] == 0 && board[1][1] == 1 && board[0][2] == 1) {
    board[2][0] = 2;
    nMarker++;
    whoseTurn = user; // The user is next up
    println("Blocking at x:2, y:0 (right diagonal 011)");
  }
}