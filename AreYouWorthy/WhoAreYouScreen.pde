void whoAreYouScreen () { //<>//
  background(57, 33, 134); // QE Purple
  textSize(50);
  text("Who are you?", width/2, 20);

  // Load WhoAreYou file & display 10 random possible user names
  String lines[] = loadStrings("WhoAreYou.txt");
  int x1 = 0; // x coord of text/buttons
  int y1 = 70; // y coord of text/button
  int dx = width/2; // width of buttons 
  int dy = height/6; // height of button
  for (int i=0; i<10; i++) {
    if (updateWhoAreYou) {
      int index = int(random(lines.length));  
      choices[i] = lines[index];
      println(choices[i]);
    }
    
    textAlign(CENTER, CENTER);
    text(choices[i], x1, y1, dx, dy);
    

    // Update coords for next button
    y1 = y1+dy;
    if (i==4) {
      x1 = width/2;
      y1 = 70;
    }
  }
  updateWhoAreYou = false;
}