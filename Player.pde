Animation flying, beam;

class Player {
  float x, y, opacity= 0;
  PVector vel;
  boolean fuel, playSound;
  int health;

  Player (float x, float y) {
    this.x=x;
    this.y=y;
    vel= new PVector (20, 20); // flight speed
    flying = new Animation ("SpaceShip", 16);
    beam = new Animation ("Beam", 18);
    health = 100;
    
  }

  void display() {
    flying.display(x, y);
  }

  void update () {
    playerControls ();
    fuelbar();
    teleport();
  }

  void playerControls() {
    if (up) {
      this.y -= vel.y;
    }
    if (down) {
      this.y += vel.y;
    }
    if (left) {
      this.x -= vel.x;
    }
    if (right) {
      this.x += vel.x;
    }

    if (space) {
      beam.cldisplay(this.x, this.y+175);
      beamUp();
      if (!playSound) {
        beammeup.loop();
        moo.loop();
        playSound=true;
      }
    } else {
      playSound = false;
      moo.stop();
      beammeup.stop();
    }
  }


  void beamUp() {
    for (int i =0; i < cow.length; i ++) {
      boolean inBeam =cow[i].pos.x > this.x-20 && cow[i].pos.x < this.x + 150;//if cow is in beam raise cow pos
      fuel = cow[i].pos.y < this.y+200;// if cow is beamed to spaceship == spaceship fuel

      if (inBeam) {
        //cow behavior in beam
        cow[i].pos.y-=vel.y;
        cow[i].inBeam= true;
        cow[i].anim = "being beamed";
        // if cow is absorbed by spaceship
        if (fuel) {
          if (health < 100) {
            health+=10;
            if (health<50) {
              this.y+=vel.y/2;
            }
          }
          cow[i].teleport();
          println("score!");
          lvlmngr.score++; //increase score count
        }
      }
    }
  }

  void teleport() {
    if (this.x > width) {
      this.x = -10;
    }
    if (this.x< -10) {
      this.x= width + 20;
    }
    if (this.y >height - 700) {
      this.y = height - 700;
    }
    if (this.y < 50) {
      this.y = 50;
    }
  }

  void fuelbar() {
    fill (180);
    rect (this.x+100, this.y - 30, 100, 10);
    fill (#F01F46); // fuel bar to increase as cows are eaten
    rect (this.x+100, this.y - 30, health, 10);

    if (timer[0].finished()) {
      health-=1;
      timer[0].start();
    }
  }
}
