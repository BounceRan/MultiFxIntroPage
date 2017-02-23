class logo {
  PImage logo;

  logo() {
    String url2="http://www.multi-fx.com/home/wp-content/uploads/2014/11/logo1.png";
    logo=loadImage(url2, "png");
  }
  void logoshow() {
    //translate(width*1/2,height*1/2);

    image(logo, -0.23*width, -0.25*height, 0.5*(4.0/5)*width, 0.2*height*4/5);
  }
}