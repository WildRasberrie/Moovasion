class Animation {
  PImage[] cow, cloud,spaceship,beam, cog;
  int numberofFrames;
  int frame;

  Animation (String startImg, int number) {
    numberofFrames= number;
    cow = new PImage [numberofFrames];
    cloud = new PImage [numberofFrames];
    spaceship = new PImage [numberofFrames];
    beam = new PImage [numberofFrames];
    cog = new PImage [numberofFrames];
    //Adding for loop for cow walking anim
    for (int i = 0; i < numberofFrames; i++) {
      String anims = startImg + (i) + ".png"; //adding start name of frames to .png
      cow [i] = loadImage (anims); // loading cow frame img's
      cloud [i] = loadImage (anims);
      spaceship [i] = loadImage (anims);
      beam [i] = loadImage (anims);
      cog [i] = loadImage(anims);
    }
  }

  void display(float x, float y) {
    frame = (frame+1) % numberofFrames; // loop through frames  number
    image (cow [frame], x, y);
    image (spaceship[frame],x,y);
    image (cog [frame], x, y);
  }

  void cldisplay(float x, float y) {
    frame = (frame+5) % numberofFrames; // loop through frames  number
    image (cloud [frame], x, y);
    image (beam[frame],x,y);
  }
  int getWidth() {
    return cow[0].width;
  }
}
