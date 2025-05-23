LevelManager lvlmngr;
UI ui;
Object[] cow;
Clouds[] cloudMove;
EvilCloud evilClouds;
Player player;
boolean up, down, left, right,space;
String cows ="cows", clouds = "clouds";
Timer[] timer;
int sec = 1000;//start timer for 1 sec(s)
int sec30 = 30000; // 30 sec timer

void setup() {
  size (1200, 1200);
  background (0);
  frameRate (10);
  lvlmngr = new LevelManager (); //lvl manager 
  ui = new UI(); //importing UI
  //timer 
  timer = new Timer [3];
    timer[0] = new Timer(sec);// lose health every sec timer
    timer[1] = new Timer(sec30);
    timer[2] = new Timer (5000); // 5 secs
  //player
  player = new Player (width-300, 200);
  //cows
  cow = new Object [50];
  for (int i = 0; i < cow.length; i ++) {
    float rd = random (150, 300);
    float rdy = random (-300,-150);
    cow[i] = new Object (width + (i * rd), height + (i * rdy));
  }
  //clouds
  cloudMove = new Clouds [5];
  for (int i = 0; i < cloudMove.length; i ++) {
    cloudMove[i] = new Clouds (0 + (i* random(100, 250)), 100 + (i* random(-300, 200)), "clouds");
  }
  evilClouds = new EvilCloud (-500,0);
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
