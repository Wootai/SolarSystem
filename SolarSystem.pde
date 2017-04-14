color[] COLORS = {color(255, 0, 0), color(0,0,255), color(255,0,150), color(0,150,0), color(0,0,110), color(110, 50, 0), color(0,0,150), color(255,255,0)};
float GRAV_CONST = 9.73;
ArrayList<SpaceObject> solarSystem;
PVector POS ;
PVector VEL;
float MASS;
float RAD;

SpaceObject s;

ArrayList<PVector> stars;

void setup(){
  solarSystem = new ArrayList<SpaceObject>();
  size(800,800);
  
  //-----SUN------// 
  POS = new PVector(width*.5, height*.5);
  VEL = new PVector(0,0);
  MASS = 30;
  RAD = 43;
  s = new SpaceObject(POS, VEL, MASS, RAD, COLORS[7], true);
  solarSystem.add(s);
  
  //-----PLANET 1------//
  POS = new PVector(width*.5 + 170, height*.5);;
  VEL = new PVector(.2, 1.42);;
  MASS = 1.7;
  RAD = 13;
  s = new SpaceObject(POS, VEL, MASS, RAD, COLORS[5], false);
  solarSystem.add(s);

  //-----PLANET 2------//
  POS = new PVector(width*.5+240, height*.5+22);;
  VEL = new PVector(-0.02, -1.732);
  MASS = 2.5;
  RAD = 7;
  s = new SpaceObject(POS, VEL, MASS, RAD, COLORS[3], false);
  solarSystem.add(s);
  
  //-----PLANET 3------//
  POS = new PVector(width*.5+370, height*.5+15);
  VEL = new PVector(0.01, .89);
  MASS = 1.6;
  RAD = 10;
  s = new SpaceObject(POS, VEL, MASS, RAD, COLORS[6], false);
  solarSystem.add(s);
  
  //---BACKGROUND STARS----//
  stars = new ArrayList<PVector>();
  for(int i = 0; i < 100; i++){
    PVector star = new PVector(random(width), random(height));
    stars.add(star);
  }
}

void draw(){
  background(0);
  stars(); 
  noStroke();  
  system();
}

void stars(){
  stroke(255);
  strokeWeight(1);
  for(PVector s : stars){
     point(s.x, s.y);
   }  
}

void system(){
  solarSystem.get(0).show();
  for(int i = 1; i < solarSystem.size(); i++){
    solarSystem.get(i).gravity(solarSystem.get(0));
  }
 
  for(SpaceObject s: solarSystem){
    s.update();
    s.show();
  }
}