int xPos, yPos,xpos,ypos,v;
int xDir1,yDir1,xDir2, yDir2;
int playerx, playery;
int [] a,b;
float t;
void setup() {
  size(500,700);
  background(255);
  xDir1=yDir1=(int)random(3,10);
  xDir2=yDir2=(int)random(3,10);
  xPos=(int)random(0,500);
  yPos=(int)random(0,700);
  xpos=(int)random(0,500);
  ypos=(int)random(0,700);
  a = new int [4];
  b = new int [4];
    for(int k = 0; k<4; k++){
      a[k] = 100 * k;
      b[k] = 100 *k;
  }
  v=2;
}


void draw() {
  playerx = mouseX;
  playery = mouseY;
  background(255);
  //마우스로 움직이는 네모
  fill(0,250,0);
  rect(playerx - 25, playery-10,50,20);
  fill(255,160,0);
   //ball1 움직이기
  ring1(xPos,yPos);
  xPos=xPos+xDir1;
  yPos=yPos+yDir1;
  
  if (yPos<40) {
    yDir1*=-1;
  }
  if( xPos<40) {
    xDir1*= -1;
  }
  if (yPos>height-40) {
    yDir1*=-1;
  }
  if (xPos>width-40) {
    xDir1*=-1;
  }
  //ball2 움직이기
  ring2(xpos,ypos);
  xpos=xpos+xDir2;
  ypos=ypos+yDir2;
  
  if (ypos<30) {
    yDir2*=-1;
  }
  if( xpos<30) {
    xDir2*= -1;
  }
  if (ypos>height-30) {
    yDir2*=-1;
  }
  if (xpos>width-30) {
    xDir2*=-1;
  }
  // ball3
  fill(0,0,200);
    for(int j = 0; j<4; j++){
      ring1(a[j],b[j]);
      a[j] += v;
      b[0] += v;
      b[1] += v;
      b[2] -= v;
      b[3] -= v;
      if(a[j]>width) a[j] = 0;
      if(b[j]>height) b[j]=0;
      if(b[j]<0) b[j]=height;
    
      // ball3와 충돌시 게임오버
      if (dist(playerx, playery, a[j], b[j]) < 45 & t>2 ) { 
        v=0;
        xDir1=0;
        yDir1=0;
        xDir2=0;
        yDir2=0;
      }
    
      
    }
   //충돌시 게임오버
  if (dist(playerx, playery, xPos, yPos) < 45 || dist(playerx, playery, xpos, ypos) < 50 & t>2){
    v=0;
    xDir1=0;
    yDir1=0;
    xDir2=0;
    yDir2=0;
    
  }
    if(xDir1==0||yDir1==0||xDir2==0||yDir2==0||v==0){
    t=t-0.017;
      textAlign(CENTER);
    textSize(50);
    fill(255, 0, 0);
    text("Game Over!\nTime:"+t, width/2, height/2);
    }
      t = t+0.017;
      stroke(255);
      textSize(20);
      text("score:"+t,70,20);
}
