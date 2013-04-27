
import android.view.WindowManager;
import ketai.camera.*;
import ketai.ui.*;
import android.os.Bundle;
import android.view.MotionEvent;

KetaiGesture gesture;
KetaiCamera cam;
KetaiList selectionlist;
ArrayList<String> optionslist = new ArrayList<String>();

void setup() {
  orientation(LANDSCAPE);
  cam = new KetaiCamera(this, displayWidth, displayHeight, 30);
  gesture = new KetaiGesture(this);

  optionslist.add("Flash");
  optionslist.add("Toggle");
  optionslist.add("About");

  thread("alt1");
  thread("alt2");
  thread("saveFrame");
  //cam.start();
}
int alt=1;
int alt1inst=2;
int alt2inst=2;
void draw() {
  switch(alt) {
  case 1:
    alt1(alt1inst);
    break;
  case 2:
    alt2(alt2inst);
    break;
  }
}
void onLongPress(float x, float y)
{
  alt=(int)random(1, 3);
  alt1inst=(int)random(13);
  alt2inst=(int)random(1000, 10000);
  println("CHANGEH");
}
int s;
void onTap(float x, float y){
  saveFrame("//sdcard//DCIM/Test/"+s+++".png");
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == MENU) {
      selectionlist = new KetaiList(this, optionslist);
    }
  }
}
void onKetaiListSelection(KetaiList klist)
{
  String selection = klist.getSelection();
  if (selection == "Flash") {
    if (cam.isFlashEnabled()) {
      cam.disableFlash();
    }
    else {
      cam.enableFlash();
    }
  }
  else if (selection == "Toggle") {
    if (cam.isStarted())
    {
      cam.stop();
    }
    else {
      cam.start();
    }
  }
  else if (selection == "About") {
    text("Rufael Negash", 0, 0);
  }
}

void onCreate(Bundle bundle) {
  super.onCreate(bundle);
  getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
}
public boolean surfaceTouchEvent(MotionEvent event) {

  //call to keep mouseX, mouseY, etc updated
  super.surfaceTouchEvent(event);

  //forward event to class for processing
  return gesture.surfaceTouchEvent(event);
}
void onPause() {
  super.onPause();
  if (cam != null && cam.isStarted()) {
    cam.stop();
  }
}

void onCameraPreviewEvent() {
  cam.read();
}

void exit() {
  cam.stop();
}

