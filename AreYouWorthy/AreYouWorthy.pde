
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

// Coordinates of markers for all cells
int topleft_x = 0*w/3 + w/6;
int topleft_y = 0*h/3 + h/6;
int topcentre_x = 1*w/3 + w/6;
int topcentre_y = 0*h/3 + h/6;
int topright_x = 2*w/3 + w/6;
int topright_y = 0*h/3 + h/6;

int centreleft_x = 0*w/3 + w/6;
int centreleft_y = 1*h/3 + h/6;
int middle_x = 1*w/3 + w/6;
int middle_y = 1*h/3 + h/6;
int centreright_x = 2*w/3 + w/6;
int centreright_y = 1*h/3 + h/6;

int bottomleft_x = 0*w/3 + w/6;
int bottomleft_y = 2*h/3 + h/6;
int bottomcentre_x = 1*w/3 + w/6;
int bottomcentre_y = 2*h/3 + h/6;
int bottomright_x = 2*w/3 + w/6;
int bottomright_y = 2*h/3 + h/6;

int dx = h/6;
int dy = h/6;

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
  line(width/3,0,width/3,height);
  line(2*width/3,0,2*width/3,height);  
  line(3*width/3,0,3*width/3,height);
  line(0, height/3, width, height/3);  
  line(0, 2*height/3, width, 2*height/3); 
  line(0, 3*height/3, width, 3*height/3);  
  
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
    // 1. Check if winning move is possible (have two markers along one of the eight dimensions
    
    // 2. Check if winning move is possible for opponent (if it is -> block)
    
    // 3. Check if one dimension has an x marker and two empty spots
    
    // 4. Check if centre is avaliable
    
    // 5. Place marker randomly
    
    // If game over declare winner
  } else if (whoseTurn == user) {
    // "Listen" for mouse press, check that slot is avaliable before placing marker
    
    println("whose turn:",whoseTurn,"board[0][0]:",board[0][0]," x:",mouseX," y:", mouseY,topleft_x-dx,"-",topleft_x+dx,";", topleft_y-dy,"-",topleft_y+dy,"\n");
    
    // Test if the cursor is over top left empty cell
    if (board[0][0] == 0 && mouseX > topleft_x-dx && mouseX < topleft_x+dx && mouseY > topleft_y-dy && mouseY < topleft_y+dy) { //<>//
      println("Top Left\n");
      overEmptyCell = true;   
      x = 0;
      y = 0;
    } else {
      overEmptyCell = false;
    }

    // Test if the cursor is over top centre empty cell
    if (board[1][0] == 0 && mouseX > topcentre_x-dx && mouseX < topcentre_x+dx && mouseY > topcentre_y-dy && mouseY < topcentre_y+dy) {
      overEmptyCell = true;   
      x = 1;
      y = 0;
    } else {
      overEmptyCell = false;
    }

    // If game over declare winner
  }
  
}

void mousePressed() {
  if(overEmptyCell) { 
    println("************************************************Mouse pressed\n");
    board[x][y] = 1;
  } 
}