//============================================================================== //<>//
// AreYouWorthy - Taking gaming to the next level
//
// Whosoever plays this game, if he or she be worthy, shall be awarded the 
// wisdom of RPi
// 
// by Dr. Pineda
//==============================================================================

// Define the tic-tac-toe board as a 2D array where 0=empty cell, 1=cell with 
// user marker (x) and 2=cell with computer marker (o)
int[][] board = { {0, 0, 0}, 
  {0, 0, 0}, 
  {0, 0, 0} };
int computer = 0;
int user = 1;
int draw = 3; // Nobody wins
int whoseTurn = user;
boolean overEmptyCell = false;
boolean gameOver = false;
int winner;
int n = 0; // Keeps track of the numer of markers on the board

// Dimensions of canvas
int w = 400;
int h = 400;

float L = w/3; // x-coord of left grid line
float R = L*2; // x-coord of right grid line
float T = h/3; // y-coord of top grid line
float B = T*2; // y-coord of bottom grid line
float dx = L/2; // x-offset to grid cell centre
float dy = T/2; // y-offset to grid cell centre

// Variables for indexing the board array
int x;
int y;

void setup () {
  size(400, 400);
  background(255);
}

void draw () {
  background(255);

  // Draw grid
  stroke(0);
  line(L, 0, L, h); // Left vetical line
  line(R, 0, R, h); // Right vertical line
  line(0, T, w, T); // Top horizontal line
  line(0, B, w, B); // Bottom horizintal line

  // Draw markers
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      int x = i*width/3 + width/6 ;
      int y = j*height/3 + height/6;
      textSize(75);
      textAlign(CENTER, CENTER);
      fill(0);
      if (board[i][j] == 1) text("x", x, y);
      else if (board[i][j] == 2) text("o", x, y);
    }
  }

  if (whoseTurn == computer && !gameOver) {
    computerPlay();
    n++;

    // After the computer has played its turn check if game is over. Assuming 
    // that the user always starts the game, the only option for a game over 
    // after a computer move is that the computer has three in a row (i.e. 
    // computer wins).
    if (gameOver) {
      winner = computer;
      finishGame();
    }
    
  } else if (whoseTurn == user && !gameOver) {
    userPlay();
    n++;
    
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
    {
  } else if (n == 9) {
    gameOver = true;
    winner = draw;
  }
}