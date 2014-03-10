//Sagar Mohite
//Press 1,2,3 to switch cameras
//Press t to toggle modes - with noise/without noise
//Press r to reset.
//TODO: add hyperhelix motion

import damkjer.ocd.*;

Particle system;
Camera c1,c2,c3;
PShader blur;
boolean noise = false;

void setup(){
  background(0);
  size(displayWidth,displayHeight,P3D);
  system = new Particle(100,0.1);
  c1 = new Camera(this, width/2, height/4, 900);
  c2 = new Camera(this, width/2, height/2, 500, -width,-height, -900);
  c3 = new Camera(this, width/2, 0, 900, 0, 0, 100);
  blur = loadShader("blur.glsl");
}

void draw(){
  filter(blur);
  noStroke();
  fill(255);
  lights();
  system.travel(noise);
}

boolean sketchFullScreen(){
  return true;
}
void mouseMoved() {
  //c1.arc(radians(mouseX - pmouseX));
  //c2.arc(radians(mouseX - pmouseX));
  c3.arc(radians(mouseX - pmouseX));
}
void keyPressed(){
  if(key=='1'){
    directionalLight(150,150,255,0,1,0);
    c1.feed();
  }
  else if (key=='2'){
    directionalLight(150,150,255,0,1,0);
    camera(0, 0, (height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, 1, 0); 
  }
  else if (key=='3'){
    directionalLight(150,150,255,0,1,0);
    c3.feed();
  }
  else if (key=='t'){
    noise = !noise;
  }
  else if (key=='r' || key=='R'){
    COUNT = 0; //malpractice
    system = new Particle(100, 0.1);
  }
  
}

