final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;
int n;
int q;
int u;
int l;
int hogX,hogY;

final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;

PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered;
PImage bg, soil8x24,soil0,soil1,soil2,soil3,soil4,soil5; 
PImage hog;
PImage stone1,stone2;
PImage lifeImg;

// For debug function; DO NOT edit or remove this!
int playerHealth = 0;
float cameraOffsetY = 0;
boolean debugMode = false;

void setup() {
  size(640, 480, P2D);
  // Enter your setup code here (please put loadImage() here or your game will lag like crazy)
  bg = loadImage("img/bg.jpg");
  title = loadImage("img/title.jpg");
  gameover = loadImage("img/gameover.jpg");
  startNormal = loadImage("img/startNormal.png");
  startHovered = loadImage("img/startHovered.png");
  restartNormal = loadImage("img/restartNormal.png");
  restartHovered = loadImage("img/restartHovered.png");
  soil8x24 = loadImage("img/soil8x24.png");
  soil0 =loadImage("img/soil0.png");
  soil1 =loadImage("img/soil1.png");
  soil2 =loadImage("img/soil2.png");
  soil3 =loadImage("img/soil3.png");
  soil4 =loadImage("img/soil4.png");
  soil5 =loadImage("img/soil5.png");
  hog = loadImage("img/groundhogIdle.png");
  stone1 =loadImage("img/stone1.png");
  stone2 =loadImage("img/stone2.png");
  lifeImg = loadImage("img/life.png");
  playerHealth = 2;
}

void draw() {
    /* ------ Debug Function ------ 

      Please DO NOT edit the code here.
      It's for reviewing other requirements when you fail to complete the camera moving requirement.

    */
    if (debugMode) {
      pushMatrix();
      translate(0, cameraOffsetY);
    }
    /* ------ End of Debug Function ------ */

    
  switch (gameState) {

    case GAME_START: // Start Screen
    image(title, 0, 0);

    if(START_BUTTON_X + START_BUTTON_W > mouseX
      && START_BUTTON_X < mouseX
      && START_BUTTON_Y + START_BUTTON_H > mouseY
      && START_BUTTON_Y < mouseY) {

      image(startHovered, START_BUTTON_X, START_BUTTON_Y);
      if(mousePressed){
        gameState = GAME_RUN;
        mousePressed = false;
      }

    }else{

      image(startNormal, START_BUTTON_X, START_BUTTON_Y);

    }
    break;

    case GAME_RUN: // In-Game

    // Background
    image(bg, 0, 0);

    // Sun
      stroke(255,255,0);
      strokeWeight(5);
      fill(253,184,19);
      ellipse(590,50,120,120);

    // Grass
    fill(124, 204, 25);
    noStroke();
    rect(0, 160 - GRASS_HEIGHT-80*q, width, GRASS_HEIGHT);
 
    // Soil - REPLACE THIS PART WITH YOUR LOOP CODE!
    image(soil8x24, 0, 160-q*80);  

    //soil*24

    for ( int n =0; n< 8; n++){
      image(soil1,0+80*n,480-q*80,80,80);
    }
    for ( int n =0; n< 8; n++){
      image(soil1,0+80*n,80+480-q*80,80,80);
    }
    for ( int n =0; n< 8; n++){
      image(soil1,0+80*n,160+480-q*80,80,80);
    }
    for ( int n =0; n< 8; n++){
      image(soil1,0+80*n,240+480-q*80,80,80);
    }
    
    
    for ( int n =0; n< 8; n++){
      image(soil2,0+80*n,320+480-q*80,80,80);
    }
    for ( int n =0; n< 8; n++){
      image(soil2,0+80*n,400+480-q*80,80,80);
    }
    for ( int n =0; n< 8; n++){
      image(soil2,0+80*n,480+480-q*80,80,80);
    }
    for ( int n =0; n< 8; n++){
      image(soil2,0+80*n,560+480-q*80,80,80);
    }
    
    
     for ( int n =0; n< 8; n++){
      image(soil3,0+80*n,640+480-q*80,80,80);
    }
    for ( int n =0; n< 8; n++){
      image(soil3,0+80*n,720+480-q*80,80,80);
    }
    for ( int n =0; n< 8; n++){
      image(soil3,0+80*n,800+480-q*80,80,80);
    }
    for ( int n =0; n< 8; n++){
      image(soil3,0+80*n,880+480-q*80,80,80);
    }
    
     for ( int n =0; n< 8; n++){
      image(soil4,0+80*n,960+480-q*80,80,80);
    }
    for ( int n =0; n< 8; n++){
      image(soil4,0+80*n,1040+480-q*80,80,80);
    }
    for ( int n =0; n< 8; n++){
      image(soil4,0+80*n,1120+480-q*80,80,80);
    }
    for ( int n =0; n< 8; n++){
      image(soil4,0+80*n,1200+480-q*80,80,80);
    }
    
    
    for ( int n =0; n< 8; n++){
      image(soil5,0+80*n,1280+480-q*80,80,80);
    }
    for ( int n =0; n< 8; n++){
      image(soil5,0+80*n,1360+480-q*80,80,80);
    }
    for ( int n =0; n< 8; n++){
      image(soil5,0+80*n,1440+480-q*80,80,80);
    }
    for ( int n =0; n< 8; n++){
      image(soil5,0+80*n,1520+480-q*80,80,80);
    }
    
    //stone
    
    for (int n=0; n< 8; n++){
      image(stone1,0+80*n,160+0+80*n-q*80,80,80);
    }
    
    
     for(float t=1;t<=8;t++){
     for(float i=0;i<8;i++){
      if( t%4==0 || t%4== 1){
      if( i%4 == 0 || i%4== 1 ){
        image(stone1,80+i*80,720+t*80-80*q,80,80);
      }
      }
      if(t%4==2 || t%4==3){
      if(i%4 ==2 ){
        image(stone1,-160+i*80,720+t*80-80*q,80,80);
      }
      if(i%4 ==3){
        image(stone1,i*80,720+t*80-80*q,80,80);
      }
      }
      for (float b=0;b<9;b++){
        for(float k=-1;k<15;k++){
          if(k%3 ==1 ||k%3==2){
        image(stone1,0+80*k-80*b,1440+b*80-80*q,80,80);
          if(k%3 ==2){
        image(stone2,0+80*k-80*b,1440+b*80-80*q,80,80);
        }
          }
        }
      }
     
     }
     
     }
      
   
   hogX=(320+80*l);
   hogY=(80+80*u);
   if(hogX<0){
     hogX=0;
     l=-4;
   }
   if(hogX>560){
     hogX=560;
     l=3;
   }
  
   image (hog,hogX,hogY,80,80);
  
    // Player

    // Health UI
    if(playerHealth<=5){
        for(int h =0; h<playerHealth ; h++){
          int x =10+70*h;
          image(lifeImg,x,10,50,50);
       }
      }
    
      

    break;

    case GAME_OVER: // Gameover Screen
    image(gameover, 0, 0);
    
    if(START_BUTTON_X + START_BUTTON_W > mouseX
      && START_BUTTON_X < mouseX
      && START_BUTTON_Y + START_BUTTON_H > mouseY
      && START_BUTTON_Y < mouseY) {

      image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
      if(mousePressed){
        gameState = GAME_RUN;
        mousePressed = false;
        // Remember to initialize the game here!
      }
    }else{

      image(restartNormal, START_BUTTON_X, START_BUTTON_Y);

    }
    break;
    
  }

    // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
    if (debugMode) {
        popMatrix();
    }
}

void keyPressed(){
  // Add your moving input code here

  // DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
    switch(key){
      case 'w':
      debugMode = true;
      cameraOffsetY += 25;
      break;

      case 's':
      debugMode = true;
      cameraOffsetY -= 25;
      break;

      case 'a':
      if(playerHealth > 0) playerHealth --;
      break;

      case 'd':
      if(playerHealth < 5) playerHealth ++;
      break;
      
    
    }
    if (key==CODED){
      switch( keyCode )
      {
        case DOWN:
        q+=1;
        break;
        
        case LEFT:
        l-=1;
        break;
        
        case RIGHT:
        l+=1;
        break;
        
      }
     
      if(q>20){
          q=20;
          if(key ==CODED){
            switch ( keyCode )
            {
              case DOWN:
              u+=1;
              
              if(u>4){
              u=4;
              } 
              
              break;
            
          
            }
             
          }
          
        }
    }
}

void keyReleased(){
}
