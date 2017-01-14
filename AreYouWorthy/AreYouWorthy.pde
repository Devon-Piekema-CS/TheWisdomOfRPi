 //<>//
// Define the tic-tac-toe board as a 2D array where 0=empty cell, 1=cell with user marker (x) and 2=cell with computer marker (o)
int[][] board = { {0, 0, 0}, 
  {0, 0, 0}, 
  {0, 0, 0} };
int computer = 0;
int user = 1;
int whoseTurn = user;
boolean overEmptyCell = false;
boolean gameOver = false;
int winner;

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

    // Check if game is over or if we should continue playing. 
    // Game is over if:
    // - Either the user or the computer has three in a row
    // - All the cells have markers in them but nobody has three in a row (=draw)
    if (win) {
      GameOver
    }
    
  } else if (whoseTurn == user && !gameOver) {
    userPlay();
  }
  // Check if game is over or if we should continue playing. 
  // Game is over if:
  // - Either the user or the computer has three in a row
  // - All the cells have markers in them but nobody has three in a row (=draw)
}