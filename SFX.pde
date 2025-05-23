import processing.sound.*;

SoundFile beammeup;
SoundFile bg;
SoundFile moo;

boolean bgMusicOn=true;

void SFXSetup() {
  beammeup = new SoundFile (this, "forcefield.mp3");
  bg = new SoundFile (this, "retro-wave.mp3");
  moo = new SoundFile (this, "mooing.mp3");
  if (bgMusicOn) {
    bg.loop();
  } else {
    bg.stop();
  }
}

void setVolume (float volume) {
  PVector range = new PVector (volume, volume);
  range.normalize();
}
