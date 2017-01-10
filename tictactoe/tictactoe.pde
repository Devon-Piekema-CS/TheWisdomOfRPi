int[][] board = { {0, 0, 0},
                  {0, 0, 0},
                  {0, 0, 0} };
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
      text("X",x,y);
      fill(0);
      println(x,y,'\n');
    }
  }
}