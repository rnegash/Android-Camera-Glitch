import android.view.WindowManager;
import ketai.camera.*;
import ketai.ui.*;
import android.os.Bundle;
import android.view.MotionEvent;

KetaiGesture gesture;
KetaiCamera cam;
KetaiList selectionList;
ArrayList<String> optionsList = new ArrayList<String>();

void setup() {
  orientation(LANDSCAPE);
  cam = new KetaiCamera(this, displayWidth, displayHeight, 30);
  gesture = new KetaiGesture(this);

  optionsList.add("Flash");
  optionsList.add("Toggle Camera On/Off");
  optionsList.add("About");

  thread("mode1");
  thread("mode2");
  thread("mode3");
  //cam.start();
}
int mode=3;
int mode1inst=2;
int mode2inst=2;
int mode3inst=2;
void draw() {
  switch(mode) {
  case 1:
    mode1(mode1inst);
    break;
  case 2:
    mode2(mode2inst);
    break;
  case 3:
    mode3(mode2inst);
    break;
  }
}
void onLongPress(float x, float y) {
  mode=(int)random(1, 4);
  mode1inst=(int)random(13);
  mode2inst=(int)random(1000, 5000);
  println("CHANGEH");
}
int s;
void onTap(float x, float y) {
  save("//sdcard//DCIM/Test/"+s+++".png");
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == MENU) {
      selectionList = new KetaiList(this, optionsList);
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
  else if (selection == "Toggle Camera On/Off") {
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
//Keep screen from sleeping
void onCreate(Bundle bundle) {
  super.onCreate(bundle);
  getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
}

public boolean surfaceTouchEvent(MotionEvent event) {
  super.surfaceTouchEvent(event);
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

