//============================================================================== //<>// //<>//
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
int nMarker = 0; // Keeps track of the numer of markers on the board

// Dimensions of canvas
int w = 800;
int h = 480;

int alpha = 255; // Transparency
int alpha1 = 0;

float L = w/3; // x-coord of left grid line
float R = L*2; // x-coord of right grid line
float T = h/3; // y-coord of top grid line
float B = T*2; // y-coord of bottom grid line
float dx = L/2; // x-offset to grid cell centre
float dy = T/2; // y-offset to grid cell centre

// Variables for indexing the board array
int x;
int y;

boolean showSplashScreen = true; 

PFont font;

void setup () {
  size(800, 480);
  background(255);
  frameRate(10);

font = createFont("Comfortaa", 32);
textFont(font);
}

void draw () {

  if (showSplashScreen) {
    background(57,33,134);
    stroke(239,170,4);
    noFill();
    strokeWeight(6);
    rect(10, 10, width-20, height-20, 10, 10, 10, 10);

    fill(239,170,4);
    textSize(80);
    textAlign(CENTER, CENTER);
    text("The Wisdom of RPi", width/2, height*.25);

    textSize(17);
    text("Whosoever plays this game, if he or she be worthy, shall be awarded the wisdom of RPi", width/2, height*.4);

    textSize(30);
    text("Touch screen to start...", width/2, height*.75);
  } else {
     background(255);
    
    // Draw grid
    stroke(0, alpha);
    strokeWeight(4);
    line(L, 0, L, h); // Left vetical line
    line(R, 0, R, h); // Right vertical line
    line(0, T, w, T); // Top horizontal line
    line(0, B, w, B); // Bottom horizintal line

    // Draw markers
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        int x = i*width/3 + width/6;
        int y = j*height/3 + height/6;
        textSize(75);
        textAlign(CENTER, CENTER);
        fill(0, alpha);
        if (board[i][j] == 1) text("x", x, y);
        else if (board[i][j] == 2) text("o", x, y);
      }
    }

    checkUserWin();

    if (gameOver) {
      finishGame();
    }

    if (whoseTurn == computer && !gameOver) {
      computerPlay();

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

      // At this point the user could have won..., but why are we not checking if he/she has won? 
      // Because: "An event is a polite interruption of the normal flow of a program. Key presses 
      // and mouse movements are stored until the end of draw(), where they can take action that 
      // won’t disturb drawing that’s currently in progress.". Hence we are checking it at the 
      // beginning of the draw() function.
    }
  }
}