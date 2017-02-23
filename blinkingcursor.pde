class Transp {

  boolean red=false;
  float x;
  float y;
  float r = 20;
  float transparency; 
  float transto;

  boolean doOnce;


  Transp() {



    transparency = 1;
    transto = -0.04;
  }

  void cursorcolor() {
    red=!red;
  }






  void blink() {


    x = mouseX;
    y = mouseY;
    noStroke();
    // setup the halo around the mouse
    for (int i=0; i<6; i++) {
      float a = map(transparency, 0, 1, 100 - i*5,20-i*5);

      if (!red) {  
        fill(0, 105, 200, a);
      } else {  
        fill(250, 50, 0, a);
      }

      //fill(0, 0, 255, a);


      r = map(transparency, 0, 1, 10+i*10, 30+i*10);
      ellipse(x, y, r, r);
    }
    transparency += transto;

    if (transparency < 0) {
      transto  = -transto;
    } else if (transparency > 1) {
      transto = -transto;
    }

    //transparency=1;
  }
}