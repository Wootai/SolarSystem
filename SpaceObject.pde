class SpaceObject{
  PVector pos;
  PVector vel;
  PVector accel;
  float mass;
  float rad;
  PVector shadow;
  color col;
  boolean lightsource;
  
  SpaceObject(PVector _pos, PVector _vel, float _mass, float _rad, color _col, boolean ls){
   pos = _pos;
   vel = _vel;
   mass = _mass;
   rad = _rad;
   accel = new PVector(0,0);
   shadow = new PVector();
   col = _col;
   lightsource = ls;
  }

  void update(){
    vel.add(accel);
    pos.add(vel);
    accel.mult(0);

  }

  void show(){
    fill(col);
    ellipse(pos.x, pos.y, rad*2, rad*2);
    if(!lightsource){
      fill(0, 50);
      arc(pos.x, pos.y, rad*2, rad*2, shadow.heading()-(HALF_PI+.051), shadow.heading()+(HALF_PI+.051));
    }
  }

  void gravity(SpaceObject ob2){
    float distance = pow(PVector.dist(pos, ob2.pos), 2);
    float fGravity = GRAV_CONST*(mass * ob2.mass) / distance;
    PVector direction = pos.copy();
    direction.sub(ob2.pos);
    shadow = direction.copy();
    direction.setMag(fGravity);
    accel.sub(direction);
  }
}