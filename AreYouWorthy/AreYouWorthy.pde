int[][] board = { {1, 0, 0},
                  {0, 1, 0},
                  {0, 2, 2} };
int computer = 0;
int user = 1;
int whoseTurn = user;

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

    // If game over declare winner}
  
}