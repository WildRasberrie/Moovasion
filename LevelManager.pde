
//Setting Up Level Manager
class LevelManager {
  int score = 0;
  color skyBlue = #AFF5F7, green = #5AF064;
  PFont titleFont= loadFont ("BingBamBoum-72.vlw");
  PFont retro= loadFont ("C&CRedAlert[LAN]-36.vlw");
  String level = "start";
  LevelManager() {
  }

  void update() {
    switch (level) {
      //loading start
    case "start":
      startUp();
      player.display();
      break;
      // loading game screen
    case "game":
     
      lvl1();
      break;

    case "end":
      endGame();
      break;
    }
  }
  void startUp() {
    textAlign (CENTER);
    textFont (titleFont);
    fill(255);
    text ("Moovasion \n\n REVAMPED", width/2, height/4);
    textFont(retro);
    fill (255);
    text ("Press any key to start", width/2, height/2);
    if (keyPressed) { // if key pressed, go to game screen
      keyPressed = false;
      level = "game";
    }
  }

  void lvl1() {
    // setting level background
    fill (skyBlue);
    rect (0, 0, width, height);

    //Ground
    fill(green);
    rect(0, height-500, width, height);

    for (int i = 0; i < cow.length; i ++) {

      cow[i].display();// add in cows
      cow[i].update();
    }

    for (int i = 0; i < cloudMove.length; i ++) {
      cloudMove[i].display();//add in clouds
      cloudMove[i].update();
    }

    player.display();// add in player
    player.update();

    if (keyPressed && key== CODED && key == ENTER || key == RETURN) {
      level = "end";
    }
    keepScore();
  }

  void endGame() {
    textFont(retro);
    fill(255);
    textSize(72);
    text ("Thank You for Playing  \n\n :) ", width/2, height/2);
    if (keyPressed && key== CODED && key == ENTER || key == RETURN) {
      level = "start";
    }
  }

  void keepScore() {
    fill (0);
    text ("COWS EATEN: \t"+ score, width - 200, 100);
    text ("FUEL: \t"+ player.health, 200, 100);
    text ("TIMER: \t OUT OF ORDER", 200, 125);
  }
}
