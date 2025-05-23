import processing.sound.*;

SoundFile beammeup;
SoundFile bg;
SoundFile moo;

void SFXSetup() {
  beammeup = new SoundFile (this, "forcefield.mp3");
  bg = new SoundFile (this, "retro-wave.mp3");
  moo = new SoundFile (this, "mooing.mp3");
  bg.loop();
}
