
// Define the tic-tac-toe board as a 2D array where 0=empty cell, 1=cell with user marker (x) and 2=cell with computer marker (o)
int[][] board = { {0, 0, 0},
                  {0, 0, 0},
                  {0, 0, 0} };
int computer = 0;
int user = 1;
int whoseTurn = user;
boolean overEmptyCell = false;

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
  size(400,400);
  background(255);
}

void draw () {
  background(255);
  
  // Draw grid
  stroke(0);
  line(L,0,L,h); // Left vetical line
  line(R,0,R,h); // Right vertical line
  line(0,T,w,T); // Top horizontal line
  line(0,B,w,B); // Bottom horizintal line
  
  // Draw markers
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      int x = i*width/3 + width/6 ;
      int y = j*height/3 + height/6;
      textSize(75);
      textAlign(CENTER, CENTER);
      fill(0);
      if (board[i][j] == 1) text("x",x,y);
      else if (board[i][j] == 2) text("o",x,y);
    }
  }
  
  if (whoseTurn == computer) {
    println("Computer's turn!\n");
    // 1. Check if winning move is possible (have two markers along one of the eight dimensions
    
    // 2. Check if winning move is possible for opponent (if it is -> block)
    
    // 3. Check if one dimension has an x marker and two empty spots
    
    // 4. Check if centre is avaliable
    
    // 5. Place marker randomly
    
    whoseTurn = user; // The user is next up
  } else if (whoseTurn == user) {
    
    // "Listen" for mouse press, check that slot is avaliable before placing marker
    
    // Find which cell the cursor is over and if the cell is empty
    if (mouseX > 0 && mouseX < L && mouseY > 0 && mouseY < T) { //<>//
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
    whoseTurn = computer; // The computer is next up
  // println("whose turn:",whoseTurn,"board[0][0]:",board[0][0]," x:",mouseX," y:", mouseY,"\n");    
  }
  // Check if game is over or if we should continue playing. 
  // Game is over if:
  // - Either the user or the computer has three in a row
  // - All the cells have markers in them but nobody has three in a row (=draw)
  
}

void mousePressed() {
  if(overEmptyCell) { 
    //println("************************************************Mouse pressed\n");
    board[x][y] = 1;
    println("User's turn!\n");
  } 
}