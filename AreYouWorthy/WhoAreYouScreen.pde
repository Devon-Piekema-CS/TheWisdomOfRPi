void whoAreYouScreen () {
  background(57, 33, 134); // QE Purple
  textSize(25);
  text("Who are you?", width/2, 20);

  // Load WhoAreYou file
  String lines[] = loadStrings("WhoAreYou.txt");
  println("there are " + lines.length + " lines");
  for (int i = 0; i < lines.length; i++) {
    println(lines[i]);
  }
}