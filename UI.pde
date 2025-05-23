Animation cog;

class UI {
  float ratio, x;
  float opacity;
  UI () {
    cog = new Animation ("cog", 3);
    //ratio = float (mouseX/width); //volume ranges between 0.0 & 1.0
    //setVolume (ratio);
  }

  void display() {

    cog.display(width-150, 20);

    switch (lvlmngr.level) {
    case "settings":
      fill (0);
      rect (150, 100, 1000, 1000);

      stroke(0);
      strokeWeight (3);
      fill (180);
      stroke(180);
      text ("MUTE:", 200, 350);
      rect (300, 300, 50, 50); //mute button

      // exit button
      fill (#FF0000);
      ellipse (width - 100, 150, 20, 20);
      break;
    }
  }


  void update() {
    boolean onX = mousePressed &&
      mouseX > width - 120 && mouseX < width-80
      && mouseY > 125 && mouseY < 175;

    if (lvlmngr.level == "settings") {
      if (onX) {
        mousePressed = false;
        lvlmngr.level = "game";
      }
    }

    boolean onSettings =
      mouseX > width - 150 && mouseX < width-100
      && mouseY > 20 && mouseY < 80;
      
    boolean mutePressed = mousePressed &&
      mouseX > width - 360 && mouseX < width-300
      && mouseY > 300 && mouseY < 350;

    if (onSettings) {
      if (mousePressed) {
        mousePressed = false;
        lvlmngr.level = "settings";
      }
    }
    if (lvlmngr.level == "settings") {
      opacity=0;
      rect(305, 305, 40, 40);
      fill (#00ff00, opacity);
      
      if (mutePressed) {
        mousePressed = false;    
        opacity = 255;        
        bgMusicOn = false;
        player.playSound = true;
      } else {
        opacity = 0;
        bgMusicOn = true;
        player.playSound = false;
      }
    }
  }
}
