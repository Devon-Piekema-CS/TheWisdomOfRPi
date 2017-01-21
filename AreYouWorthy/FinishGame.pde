//==============================================================================
// FinishGame - Show winning sequence and declare the winner
//
// by Dr. Pineda
//==============================================================================

// There are eight possible ways one can win the game:
// - Three horizonal possibilities (top, middle, bottom)
// - Three vertical possibilities (left, centre, right)
// - Two diagonal possibilities (left and right diagonal)
// Check which of these comibations has occured and draw a line through them to 
// indicate the winning markers

// Declare variables for the starting and ending coordinates of then line that will 
// indicate the winning markers
int x1;
int y1;
int x2;
int y2;

void finishGame() {

  // Check for horizonal winning streak
  for (int y = 0; y<3; y++) { 
    if (board[0][y] == board[1][y] && board[1][y] == board[2][y]) {
      x1 = 0*width/3 + width/6;
      y1 = y*height/3 + height/6;
      x2 = 2*width/3 + width/6;
      y2 = y*height/3 + height/6;
      if (board[0][y] == 1) winner = user;
      else winner = computer;
    } // if
  } // for

  // Check for vertical winning streak
  for (int x = 0; x<3; x++) { 
    if (board[x][0] == board[x][1] && board[x][1] == board[x][2]) {
      x1 = x*width/3 + width/6;
      y1 = 0*height/3 + height/6;
      x2 = x*width/3 + width/6;
      y2 = 2*height/3 + height/6;
      if (board[x][0] == 1) winner = user;
      else winner = computer;
    } // if
  } // for

  // Check for left diagonal winning streak
  if (board[0][0] == board[1][1] && board[0][0] == board[2][2]) {
    x1 = 0*width/3 + width/6;
    y1 = 0*height/3 + height/6;
    x2 = 2*width/3 + width/6;
    y2 = 2*height/3 + height/6;
    if (board[0][0] == 1) winner = user;
    else winner = computer;
  }

  // Check for right diagonal winning streak
  if (board[2][0] == board[1][1] && board[2][0] == board[0][2]) {
    x1 = 2*width/3 + width/6;
    y1 = 0*height/3 + height/6;
    x2 = 0*width/3 + width/6;
    y2 = 2*height/3 + height/6;
    if (board[2][0] == 1) winner = user;
    else winner = computer;
  }

  // Draw red line to indicate winning streak
  if (winner == user || winner == computer) {
    stroke(255, 0, 0, alpha);
    strokeWeight(6); 
    line(x1, y1, x2, y2);
  }

  // Delay before displaying Game Over splash screen
  if (millis() > startTime+1000) {

    // Game over splash message
    //background(57, 33, 134, 150); // QE Purple
    stroke(239, 170, 4); // QE Gold
    fill(57, 33, 134, 255); // QE Purple
    strokeWeight(6);
    rect(100, 100, width-200, height-200, 10, 10, 10, 10);

    // Display final verdict - is the player worthy or unworthy
    textSize(25);
    fill(239, 170, 4); // QE Gold
    if (winner == user) {
      text("You are victorious and are worthy of RPi wisdom", 100, 100, width-250, height-250);
      text("Stand by - wisdom is being dispensed...", 100, 175, width-250, height-250);
    } else if (winner == computer) {
      text("You have been defeated.", 100, 100, width-250, height-250);
      text("Carry on with your practice you must.", 100, 175, width-250, height-250);
    } else {
      text("You are not victorious.", 100, 100, width-250, height-250);
      text("Carry on with your practice you must.", 100, 175, width-250, height-250);
    }
  }
}