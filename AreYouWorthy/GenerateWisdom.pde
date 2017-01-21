// Generate wisdom and save to file to have Python take over... //<>//
void generateWisdom() {
  String wisdom[] = loadStrings("wisdom.txt");
  println("Loaded ", wisdom.length, " lines of wisdom");
  if (debugMode) {
    for (int i==0; i<wisdom.length; i++) {
      printl(wisdom[i]);
    }
  }

  int index = int(random(wisdom.length));  
  println(wisdom[index]);
  updateWisdom = false;
}