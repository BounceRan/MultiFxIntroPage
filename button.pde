class button {
  PImage enter;
  int recstate=0;
  int recstateprev = 0;
  boolean click;




  button() {


//load the words"enter", which is a picture online
    String url1="http://www.multi-fx.com/home/wp-content/uploads/2014/11/enter2.png";
    enter=loadImage(url1, "png"); 



    click= false;
  }





  void rec() {
    
// change the color of the button area
    if (recstate==0) {
      fill(200, 100);
      rect(width*-.1, height*.1, width*0.2,height*.08, 50);
    } else if (recstate==1) {
      fill(#92baf5, 200);
      // tint(#245db3);
      rect(width*-.1, height*.1, width*.2, height*.08, 50);
    }
  }


  void imageshow() {
    //translate(width*1/2,height*1/2);
    image(enter, -0.1*width, 0.1*height, 0.2*width, 0.08*height);
  }


// check the mouse position change the state 
  void changebutton() {

    if ((mouseX>width*.4)&&(mouseX<width*.6)&&(mouseY>height*.6)&&(mouseY<height*.68)) {
      recstateprev = recstate;
      recstate=1;
      
// if mouse in the button change cursor to hand
      cursor(HAND);
    } else {
      recstateprev = recstate;
      recstate=0;
      cursor(ARROW);
    }
  }

  void homepage() {
    if ((mouseX>width*.4)&&(mouseX<width*.6)&&(mouseY>height*.6)&&(mouseY<height*.68)&&click==true) { 
      click=false;
      link("http://www.multi-fx.com/home/");
    }
    click=true;
  }

  //void clickstate(){
  //
  //click=true;
  //}
  //
  //}
}