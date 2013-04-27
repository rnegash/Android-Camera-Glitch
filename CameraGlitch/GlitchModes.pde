public void mode1(int avs) {
  image(cam, 0, 0);
  loadPixels();
  for (int i = 0; i < (displayWidth*displayHeight) ;i+=1) {
    int ran=(int)random(i-avs, i+avs);
    if (ran>0&&ran<=i) {
      if (i<i/10&&ran>0) {
        pixels[i] = pixels[ran];
      }
      else if (i>i/10&&i<7&&ran>0) {
        pixels[i] = pixels[ran]+i;
      }
      else if (i>i/7&&i<5&&ran>0) {
        pixels[i] = pixels[ran]-i/2;
      }
      else if (i>i/5&&i<2&&ran>0) {
        pixels[i] = pixels[ran]+i/2;
      }
      else {
        pixels[i] = pixels[ran]-i/2;
      }
    }
    else {
      pixels[i] = pixels[i]-i;
    }
  }
  updatePixels();
}
public void mode2(int avs) {
  image(cam, 0, 0);
  loadPixels();
  for (int i = 0; i < (displayWidth*displayHeight) ;i+=1) {
    if (i%3==0) {
      pixels[i] = pixels[i]-avs/2;
    }
    else if (i%5==0) {
      pixels[i] = pixels[i]+avs*2;
    } 
    else if (i%2==0) {
      pixels[i] = pixels[i]-avs;
    }
    else {
      pixels[i] = pixels[i]+avs;
    }
  }
  updatePixels();
}
public void mode3(int avs) {
  image(cam, 0, 0);
  loadPixels();
  for (int i = 0; i < (displayWidth*displayHeight) ;i+=1) {
    if (i%2==0) { 
      int ran=(int)random(i-avs, i+avs);
      if (ran>0&&ran<=i) {
        if (i<i/10&&ran>0) {
          pixels[i] = pixels[ran];
        }
        else if (i>i/10&&i<7&&ran>0) {
          pixels[i] = pixels[ran]+i;
        }
        else if (i>i/7&&i<5&&ran>0) {
          pixels[i] = pixels[ran]-i/2;
        }
        else if (i>i/5&&i<2&&ran>0) {
          pixels[i] = pixels[ran]+i/2;
        }
        else {
          pixels[i] = pixels[ran]-i/2;
        }
      }
      else {
        pixels[i] = pixels[i]-i;
      }
    }
    else {
      pixels[i] = pixels[i];
    }
  }
  updatePixels();
}

