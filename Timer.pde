
class Timer {
  int totalTime; // end of timer
  int startTime; // when timer is started
  int timePassed;
  Timer (int tempTotalTime) {
    totalTime=tempTotalTime;
  }

  void start() {
    startTime = millis();
  }

  boolean finished() {
    timePassed= millis()- startTime; //cuecking the time passed
    if (timePassed > totalTime) {
      return true;
    } else return false;
  }
}
