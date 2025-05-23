

LevelManager lvlmngr;
Object[] cow;
Clouds[] cloudMove;
Player player;
boolean up, down, left, right,space;
String cows ="cows", clouds = "clouds";

void setup() {
  size (1200, 1200);
  background (0);
  frameRate (10);
  lvlmngr = new LevelManager ();
  //player
  player = new Player (width-300, 200);
  //cows
  cow = new Object [20];
  for (int i = 0; i < cow.length; i ++) {
    float rd = random (250, 400);
    float rdy = random (-100, 0);
    cow[i] = new Object (width + (i * rd), height- 400 + (i * rdy));
  }
  //clouds
  cloudMove = new Clouds [5];
  for (int i = 0; i < cloudMove.length; i ++) {
    cloudMove[i] = new Clouds (0 + (i* random(100, 250)), 100 + (i* random(-300, 200)), "clouds");
  }
  SFXSetup();
}

void draw() {
  lvlmngr.update();
}

void keyPressed () {
  if (keyPressed && key == 'w' || key == 'W' || key == CODED && keyCode == UP) {
    up = true;
  }
  if (keyPressed && key == 's' || key == 'S' || key == CODED && keyCode == DOWN) {
    down = true;
  }
  if (keyPressed && key == 'a' || key == 'A' || key == CODED && keyCode == LEFT) {
    left = true;
  }
  if (keyPressed && key == 'd' || key == 'D' || key == CODED && keyCode == RIGHT) {
    right = true;
  }
  if (keyPressed && key == ' ' && lvlmngr.level == "game") {
    //println ("spacePressed");
    space = true;
  }
}
 void keyReleased (){
   
   up = false; 
   down = false; 
   left = false; 
   right = false; 
   space = false;
   player.opacity = 0;
 }
