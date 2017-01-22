// Generate wisdom and save to file to have Python take over... //<>//
void generateWisdom() {
  String[] wisdom = loadStrings("wisdom.txt");
  println("Loaded ", wisdom.length, " lines of wisdom");
  //if (debugMode) {
  //  for (int i=0; i<wisdom.length; i++) {
  //    println(wisdom[i]);
  //  }
  //}

  int i = int(random(wisdom.length));  
  updateWisdom = false;

  // Display debugging info
  if (debugMode) {
    for (int j=0; j<wisdom.length; j++){
    println(j,": ",wisdom[j]);
    }
    println("You wisdom is #",i,": ", wisdom[i]);
  }

  // Create string object that will be saved (and later printed using Python)
  String[] txt = {"********************",  
    " ", 
    " ", 
    wisdom[i], 
    " ", 
    " ", 
    " ", 
    "Visit TheWisdomOfRPi online at github.com/mariopineda/TheWisdomOfRPi ", 
    "TheWisdomOfRPi brought to you by the Computer Science & Robotics Department at Queen Elizabeth High School", 
    "********************"};
    saveStrings("toBePrinted.txt", txt);
    String[] checkpoint = {"print"};
    
    saveStrings("checkpoint.txt", checkpoint);
}