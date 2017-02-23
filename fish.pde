// class for fishs

class fish {

  PVector [] location;
  PVector direction;
  PVector getHead;

  float speed;

  boolean isinsidebutton= false ; //
  boolean isinsidebuttonprev = false;
  color c= color(random(0, 100), random(0, 100), random(200,245), 200);
  //color c1= color(random(255),random(255),255,200);
  //color c2= lerpColor(c,c1,.1);

  color cprev;

  fish() { 
    // set up the fish's color for the start point.
    cprev=  color(random(100, 150), random(100, 200), random(230,255), 200);;


    location = new PVector [15];
    //location[0] = new PVector (random (width), random (height));
    location[0] = new PVector (width*.5, height*.5);
    for (int i = 0; i < location.length; i++)
    {
      location[i] = location[0].get ();
    }
    speed = 5;
    float angle = random (TWO_PI);
    direction = new PVector (cos (angle), sin (angle));
  }
//fish head
  void fishHead (PVector pos)
  {
    location [location.length-1]= pos.get();

    fishBody ();
  }


//fish body

  void fishBody ()
  {
    for (int i = 0; i < location.length-1; i++)
    {
      location [i] = location [i+1];
    }
  }


  void display ()
  {

    noStroke();
    for (int i = 0; i < location.length; i++)
    {
      //      if (!isinsidebutton) {
      //        float s = map (i, 0, location.length, 1, 30  );
      //        fill(ramcolor);
      //
      //        ellipse (location[i].x, location [i].y, s, s);
      //      } else {  
      //        color co = lerpColor (#92baf5, #245db3, map (i, 0, location.length, 1, 0 ) );
      //        float s = map (i, 0, location.length, 1, 30  );
      //        //color co1=random(255);
      //        fill (co);
      //
      //        ellipse (location[i].x, location [i].y, s, s);
      //      }

// check when they need change the color  
      color co = lerpColor (cprev, c, map (i, 0, location.length, 1, 0 ) );
      fill(co);
      float s = map (i, 0, location.length, 1, 30  );
      ellipse (location[i].x, location [i].y, s, s);

      // check if fish is inside the button
      if ((location[i].x>width*.4)&&(location[i].x<width*.6)&&(location [i].y>height*.6)&&(location [i].y<height*.68)) {
        isinsidebuttonprev = isinsidebutton;
        isinsidebutton = true;
        //isinsidebutton=!isinsidebutton;
      } else {
        if (isinsidebuttonprev == true) {
         // println("exit button"); 
          cprev = c;
          c = color(random(255), random(255), random(255));
        }
        isinsidebuttonprev  = isinsidebutton;
        isinsidebutton = false;
      }
    }



    //  noStroke();
    //  for (int i = 0; i < location.length; i++)
    //  {
    //    color co = lerpColor (#92baf5, #245db3, map (i, 0, location.length, 1, 0 ) );
    //    float s = map (i, 0, location.length, 1, 30  );
    // //color co1=random(255);
    //    fill (co);
    //    //ellipse (location[i].x, location [i].y, s, s);
    //  ellipse (location[i].x, location [i].y, s, s);
    // }
  }


  PVector getHead ()
  {
    return location [location.length-1].get();
  }



  void steer (float x, float y)
  {
    PVector location = getHead();

    float angle = atan2 (y-location.y, x -location.x);

    PVector force = new PVector (cos (angle), sin (angle));
    force.mult (0.1);

    direction.add (force);
    direction.normalize();
  }



  void move ()

  {

    PVector location = getHead();

    PVector velocity = direction.get();
    velocity.mult (speed);
    location.add (velocity);

    fishHead (location);
  }
}