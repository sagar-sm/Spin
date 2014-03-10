int SIZE = 7, COUNT = 0; //malpractice //wtf


class Particle{
  PVector pos;
  float amp;
  float theta, vr, t; //Vr is angular velocity
  Particle inner;
  
  Particle(float _a, float _vr){ 
    pos = new PVector();
    amp = _a;
    theta = random(0,2*PI);
    pos.x = amp*sin(theta);
    pos.y = amp*cos(theta);
    pos.z = 0;
    vr = _vr;
    t = 0;
    COUNT++;
    if(COUNT<SIZE)
      inner = new Particle(amp/2, vr*1.4);
  }
  
  void travel(boolean noise){
    update(noise);
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    sphere(2);
    //println("sphere drawn at: " + pos.x + " " + pos.y + " " + pos.z);
    popMatrix();
    if(inner!=null)
      inner.travel(noise);
  }
  
  void update(boolean noise){
    pos.x = amp*sin(theta);// + map(noise(t),0,1,0,amp);
    pos.y = amp*cos(theta);// + map(noise(t),0,1,0,amp);
    if(noise)
      pos.z += map(noise(t),0,1,0,amp);
    else
      pos.z++;
    theta+=vr;
    t+=0.01;
  }
}
