
class Timer {
  int totalTime; 
  int startTime;
  int timePassed;
   Timer (int tempTotalTime){
     totalTime=tempTotalTime;
   }
   
   void start(){
     startTime = millis()/1000;
     timePassed= millis()/1000 - startTime;
   }
   
   boolean finished(){
     
     if (timePassed > totalTime){
     return true;
     }else return false;
   }
   
  void restart(){
    if (finished){
      startTime = millis()/1000;
      totalTime=time;//restart to 60 secs
    }
  }
}
