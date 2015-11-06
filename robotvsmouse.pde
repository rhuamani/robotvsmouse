//Rosario Huamani Carpio
//Robotics
//Project 1
//Robot is scared of mouse, shakes and moves away when mouse gets near
// additionally, the 'ears' change into a red color 

float x;
float y;
float z;
float w;
float r;
int armAngle = 270;
int angleChange = 15;
final int ANGLE_LIMIT = 0;

void setup() {
  size(800, 600);
  x= 300;
  y=400;
  r=0;
  z= mouseX;
  w= mouseY;
  frameRate(15);
  
}

void draw() {
    background(247,238,136);

  //room
  fill(0,random(190,195),random(250,260));
  rect(300,100,200,150);
  strokeWeight(6);
  stroke(160,82,45);
  line(300,175,500,175);
  line(400,100,400,250);
  stroke(0);
  strokeWeight(1);
    noFill();

  rect(200,0,400,400);//room square
 
  line(0,height,200,400);//left room line
  line(width,height,600,400);//right room line
  fill(255);
  rect(200,150,150,300); //fridge
  rect(200,150,150,100);//top fridge
  fill(100);
  rect(210,170,10,70);//top handle
  rect(210,270,10,70);//bottom handle
  fill(200);
  rect(400,280,200,150);//stove square
  rect(400,280,200,130);
  fill(80);
  rect(440,320,120,70);//oven
  fill(0);
  rect(440,310,120,5);//handle oven
  fill(153,112,119);
  ellipse(440,300,15,15);
  ellipse(480,300,15,15);
  ellipse(520,300,15,15);
  ellipse(560,300,15,15);
  line(400,280,425,260);
  fill(255);
  quad(600,280,575,260,425,260,575,260);
  fill(100);
  ellipse (450,265,40,6);// back left 
  ellipse (550,265,40,6);//back right
  ellipse(440,275,50,7);
  ellipse(560,275,50,7);
  
 


  pushMatrix();
  armAngle += angleChange;


  popMatrix();
  pushMatrix();

  if ((mouseX-x)<150 &
    ((mouseY-500-y)<150 &
    ((mouseX-x)>-150)
    ))
  {
    pushMatrix();
    translate(random(-20, 20), random(-10, 10));
    broom();

    robot();
    stroke(0);
    strokeWeight(1);
    mouth();
    alert();

    leftarmmove();
    rightarmmove();
    spiralleft();
    spiralright();
    
    strokeWeight(10);
    stroke(250, 4, 0,150);
    robotEars();
    popMatrix();
    if (x>=(width-199))
    { 
      x=0;
      y= y+random(-40, 40);
    } else if ((x<width-199)){//||(y<height-300)) {
      x= x + 15;
      y= y+random(-40, 40);
    }
    if (y>=height+350);
    y= 350;
  } else {
    broom();
    robot();
    leftarm();
    rightarm();
    robotEars();
  }

  strokeWeight(1);
  pushMatrix();
  if (mouseY>=450){
  translate(mouseX, mouseY);
  mouse();}
  else {
  translate(mouseX,450);
  mouse();
}
  popMatrix();
  popMatrix();
} 


void robot() {
  fill(55,219,211);
  rect(x, y, 100, 150);//body
  rect(x+15, y-90, 70, 70);//head
  fill(200);
  rect(x+30, y-20, 40, 20);//neck
  fill(255);
  ellipse(x+30, y-60, 20, 20);//left eye
  ellipse(x+30,y-60,10,10); //inner eye
  ellipse(x+70, y-60, 20, 20); //right eye
  ellipse(x+70,y-60,10,10);//innerright
  rect(x+30, y-40, 40, 10);// mouth
  rect(x+30, y-40,40,5); // teeth

  
  
}

void mouth() {
  fill(255);
  rect(x+30, y-40,40,2); // mouth
  fill(0);
  rect(x+30, y-36,40,2); // mouth

  
}

void robotEars() {
  fill(247, 239, 7);
  ellipse(x+10, y-70, 8, 8);//leftear
  ellipse(x+90, y-70, 8, 8);//right ear
}

void mouse() {
  stroke(0);
  fill(191, 184, 188);
  ellipse(z-29, w-35, 15, 15);//outleftear
  fill(209, 148, 181);
  ellipse(z-30, w-33, 10, 10);//innerearleft
  fill(191, 184, 188);
  ellipse(z-10, w-35, 15, 15);//outerrightear
  fill(209, 148, 181);
  ellipse(z-11, w-33, 10, 10); //innerrightear
  fill(200);
  ellipse(z, w, 60, 30);//body
  ellipse(z-20, w-20, 30, 30);//head
  fill(255);
  ellipse(z-12, w-20, 4, 4); //righteye
  ellipse(z-28, w-20, 4, 4); //lefteye
  rotate(.5);
  smooth();
  stroke(0);
  pushMatrix();
  noFill();
  translate(-112, -60);
  curve(z+100, w+100, z+140, w+50, z+ 160, w+40, z+160, w+ 80);//mousetail
  popMatrix();
}

void spiralleft() {
  stroke(245, 7, 19);
  fill(255);
  strokeWeight(20);
  pushMatrix();
  translate(x+30, y-60);
  scale(0.04);
  rotate(r);
  r=r + 0.01;
  beginShape();
  for (int i=0; i<200; i++)
  {
    curveVertex((i*2)*sin(i/10.0), (i*2)*cos(i/10.0));
  }
  endShape(); 
  popMatrix();
}

void spiralright() {
  stroke(245, 7, 19);
  fill(255);
  strokeWeight(20);
  pushMatrix();
  translate(x+70, y-60);
  scale(0.04);
  rotate(r);
  r=r + 0.01;
  beginShape();
  for (int i=0; i<200; i++)
  {
    curveVertex((i*2)*sin(i/10.0), (i*2)*cos(i/10.0));
  }
  endShape(); 
  popMatrix();
}

void leftarmmove() {
  fill(247, 120, 30);
  pushMatrix();
  translate(x-15, y+20);

  rotate (radians(armAngle));
  rect(0, 0, 15, 90);
  popMatrix();
  fill(240, 66, 31);

  ellipse(x-10, y+25, 30, 30);
}
void leftarm() {
  fill(247, 120, 30);
  pushMatrix();
  translate(x-15, y+20);

  rect(0, 0, 15, 90);
  popMatrix();
  fill(240, 66, 31);

  ellipse(x-10, y+25, 30, 30);
}
void rightarm() {
  fill(247, 120, 30);
  pushMatrix();
  translate(x+100, y+25);
  rect(0, 0, 15, 90);
  popMatrix();
  fill(240, 66, 31);

  ellipse(x+105, y+25, 30, 30);
}

void rightarmmove() {
  stroke(1);
  fill(247, 120, 30);

  pushMatrix();
  translate(x+105, y+25);
  rotate(radians(-armAngle));
  rect(0, 0, 15, 90);
  popMatrix();
  fill(240, 66, 31);
  ellipse(x+100, y+25, 30, 30);//shoulder
}

void broom() {
  stroke(0);
  fill(139, 69, 19);
  pushMatrix();
  translate(45+x, y+140);
  rect(0, 0, 10, 60);//broom stick
  noStroke();
  fill(218,165,32);
  
  ellipse(5,60,50,40);
  rect(-20,67,50,30);
  stroke(0);
  line(-15,55,-15,96);
  line(-10,50,-10,96);
  line(-5,45,-5,96);
  line(0,40,0,96);
  line(5,35,5,96);
  line(10,40,10,96);
  line(15,45,15,96);
  line(20,50,20,96);
  line(25,55,25,96);
  strokeWeight(5);
  stroke(128,0,0);
  line(-20,67,30,67);
  popMatrix();
  strokeWeight(1);
  stroke(0);
}

void alert () {
  strokeWeight(2);
  stroke(0);
  fill(250,250,97);
  smooth();
  triangle(x+20,y+80,x+50,y+30,x+80,y+80);
fill(0);
textSize(50);
text("!", x+43,y+75);
  strokeWeight(1);
  stroke(0);
  
}
