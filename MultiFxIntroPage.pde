// This is a intro page project for a Portfolio WebSite. By Dan, Ran




//---Call Blinking Cursor
Transp transp;
//---Call Logo 
logo Logo;
//---Button
button Button;

boolean follow=false;

//ArrayList fishs; 

int nFish = 25;

fish fishes[] = new fish[nFish];




void setup ()
{
  //size (1000, 1000);
 size(displayHeight,displayHeight);
 
   if (frame != null) {
    frame.setResizable(true);}
 
transp= new Transp();
  Button=new button();

  //  Fish=new fish();
  //  Fish2=new fish();
  //  Fish3=new fish();

  for (int i = 0; i<fishes.length; i++) {
    fishes[i] = new fish();
  }
  Logo= new logo();


  frameRate (35);
}

void draw () {
  background (30);
  
  
  //cursor
  transp.blink();
  
  //button
  pushMatrix();
  translate(width*1/2, height*1/2);
  Button.rec();
  Button.imageshow();
  popMatrix();
  
  
  //------- check the statue if they need follow the mouse
  if (!follow)
  {
    //    Fish.move();
    //    Fish.steer (random (width), random (height));
    //    Fish.display();
    //    Fish2.steer (random (width), random (height));
    //
    //    Fish2.display();
    //    Fish2.move();
    //    Fish3.steer (random (width), random (height));
    //    Fish3.display();
    //    Fish3.move();
    for (int i = 0; i<fishes.length; i++) {
      fishes[i].move();
      fishes[i].steer (random (width), random (height));
      fishes[i].display();
    }
  } else { 
    //    Fish.move();
    //    Fish.steer (mouseX, mouseY);
    //    Fish.display();
    //    Fish2.move();
    //    Fish2.steer(mouseX+1, mouseY+5);
    //    Fish2.display();
    //    Fish3.move();
    //    Fish3.steer(mouseX+2, mouseY+1);
    //    Fish3.display();

    for (int i = 0; i<fishes.length; i++) {
      fishes[i].move();
      fishes[i].steer (mouseX + random(-10*i, 10*i), mouseY + random(-10*i, 10*i));
      fishes[i].display();
    }
  }

 
  // println(fishes[0].isinsidebutton + " " + fishes[0].isinsidebuttonprev);
  //  Button.rec();
  //  Button.imageshow();
  
  // show the logo 
  pushMatrix();
  translate(width*1/2, height*1/2);

  Logo.logoshow();
  popMatrix();
  
  
}


void mouseClicked() {
  Button.homepage();
  transp.cursorcolor();
  follow=!follow;
  //Button.clickstate();
}



void mousePressed(){

//follow=!follow;

}



void mouseMoved() {


  Button.changebutton();
}