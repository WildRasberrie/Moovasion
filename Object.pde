Animation walking, beingBeamed; //<>//
Animation cloud;

class Object {
  PVector pos;
  String tag;
  PVector vel;
  boolean inBeam;
  String anim = "walking";
  int opacity;

  Object (float x, float y) {
    pos= new PVector (x, y);
    vel = new PVector (-5, 0);
    walking = new Animation ("cow", 8);
    beingBeamed = new Animation ("cowbeingbeamed", 8);
  }

  void display () {
    switch (anim) {
    case "walking":
      walking.display (pos.x,pos.y);
      break;
    case "being beamed":
      beingBeamed.display(pos.x, pos.y);
      break;
    default:
      walking.display(pos.x, pos.y);
    }
  }

    void update () {
      if (lvlmngr.level == "game") {
        pos.add(vel);
      }
      if (pos.y < height - 500 && !space) { // if cow is above grass when spawning
        pos.y =random (height - 650, height-100);
      }
      if (pos.x < 0) { // if cow off screen;
        teleport();
      }

      if (inBeam) {
        fill (0,opacity);
          if (player.health ==100){
            opacity = 255;
            
            text ("You don't need that! Greedy!" , player.x-100,player.y-100);
          }
        this.vel.x= 0;
      } else {
        this.vel.x = -5;
      }
      if (!inBeam){
        opacity = 0;
      }

      if (this.pos.x>height-600 && this.pos.x<height) {//have cows not remain in place if not completely beamed
        anim = "walking";
        this.vel.x = -5;
      }
    }

    void teleport() { // teleport sprites across screen
      pos.x =width *2;
      pos.y = random (height - 650, height-100);
    }
  }

  class Clouds extends Object {
    PVector vel;
    String tag;

    Clouds (float x, float y, String tag_) {
      super(x, y);
      tag = tag_;
      vel = new PVector(1, 0.5);
      cloud = new Animation ("cloud", 8);
    }

    void display () {
      cloud.cldisplay(pos.x, pos.y);
    }

    void update () {
      if (lvlmngr.level == "game") {
        pos.add(vel);
      }
      if (pos.y>height - 700) {// bottom collision box
        pos.y = height -700;
      }
      teleport();
    }

    void teleport() {
      if (pos.x > width) {
        pos.x =random(0, 300);
        pos.y = random(0, height- 800);
      }
    }
  }
