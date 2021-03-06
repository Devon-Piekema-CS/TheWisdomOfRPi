//==============================================================================  //<>// //<>//
// AreYouWorthy - Taking gaming to the next level
//
// Whosoever plays this game, if he or she be worthy, shall be awarded the 
// wisdom of RPi
// 
// by Dr. Pineda
//==============================================================================

boolean debugMode = true; 

// Define constants
int computer = 0;
int user = 1;
int draw = 3; // Nobody wins
boolean overEmptyCell = false;
boolean gameOver = false;

// Define the tic-tac-toe board as a 2D array where 0=empty cell, 1=cell with 
// user marker (x) and 2=cell with computer marker (o)
int[][] board = { {0, 0, 0}, 
  {0, 0, 0}, 
  {0, 0, 0} };
int whoseTurn = user;
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
boolean showWhoAreYouScreen = false;
boolean showHowDoYouFeelScreen = false;

// Variables for whoAreYouScreen
boolean updateWhoAreYou = true;
String[] choices = new String[10]; 

boolean updateWisdom = true;

PFont font;
int startTime;

void setup () {
  size(800, 480); // Enable on laptop
  // fullScreen(); // Enable on RPi
  background(255);
  frameRate(30);

  font = createFont("Comfortaa", 32);
  textFont(font);
}

void draw () {

  if (showSplashScreen) {
    background(57, 33, 134); // QE Purple
    stroke(239, 170, 4); // QE Gold
    noFill();
    strokeWeight(6);
    rect(10, 10, width-20, height-20, 10, 10, 10, 10);

    fill(239, 170, 4);
    textSize(80);
    textAlign(CENTER, CENTER);
    text("The Wisdom of RPi", width/2, height*.25);

    textSize(17);
    text("Whosoever plays this game, if he or she be worthy, shall be awarded the wisdom of RPi", width/2, height*.4);

    textSize(30);
    text("Touch screen to start...", width/2, height*.75);
  } else if (showWhoAreYouScreen) { // Disabled for now
    // whoAreYouScreen();
    showWhoAreYouScreen = false;
  } else {
    background(57, 33, 134, alpha);

    // Draw grid
    stroke(239, 170, 4, alpha);
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
        textSize(100);
        textAlign(CENTER, CENTER);
        fill(239, 170, 4, alpha);
        if (board[i][j] == 1) text("x", x, y);
        else if (board[i][j] == 2) text("o", x, y);
      }
    }

    checkUserWin();

    if (gameOver) {
      finishGame();

      // Check if it is time to restart the game. The game will restart when the 
      // the contents of the file checkpoint.txt is "play" (without the quotation 
      // marks) or when 5 seconds have elapsed (in the case of the user being 
      // defeated or if a tie occurs)
      if (winner == user) {
        String checkpoint[] = loadStrings("checkpoint.txt");
        println("Waiting for checkpoint change (checkpoint=", checkpoint[0], ")"); //<>//
        if (checkpoint[0] == "play") {
          println("Detected checkpoint change..., initializing new game");

          // Initialize a new game
          showSplashScreen = true;
          gameOver = false;
          whoseTurn = user;
          nMarker = 0; // Keeps track of the numer of markers on the board
          updateWisdom = true;

          // Reset board
          for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
              board[i][j] = 0;
            }
          }
        }
      }
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
        startTime = millis();
      }
    } else if (whoseTurn == user && !gameOver) {
      userPlay();   

      startTime = millis();

      // At this point the user could have won..., but why are we not checking if he/she has won? 
      // Because: "An event is a polite interruption of the normal flow of a program. Key presses 
      // and mouse movements are stored until the end of draw(), where they can take action that 
      // won’t disturb drawing that’s currently in progress.". Hence we are checking it at the 
      // beginning of the draw() function.
    }
  }
}