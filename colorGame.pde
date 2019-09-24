//color game

color red    = #DF151A;
color orange = #FD8603;
color yellow = #F4F328;
color green  = #00DA3C;
color blue   = #00CBE7;
color black  = #000000;
color white  = #FFFFFF;

color[]  colors = {red, orange, yellow, green, blue};
String[] colorWords = {"red", "orange", "yellow", "green", "blue"};
PImage[] gif = new PImage[30];
int n = 0;
int c = 0;
int w = 0;
int correct = 0;
String leadingZero = "0";
PFont myFont; 

final int intro = 0;
final int playing = 1;
final int gameover = 2;
int mode = intro;

void setup() {
  size(600, 600);
  myFont = createFont("font/Runaround Kid DEMO.otf", 200);
  textAlign(CENTER, CENTER);
  textSize(200);
  textFont(myFont);

  c = int(random(5));
  w = int(random(5));
  for (int i = 0; i < gif.length; i++) {
    if (i+2 < 10) leadingZero = "0"; 
    else leadingZero = "";
    gif[i] = loadImage("img/frame_"+leadingZero+(i+2)+"_delay-0.03s.png");
  }
}

void draw() {
  if (mode == intro) intro();
  else if (mode == playing) playing();
  else if (mode == gameover) gameOver();
  else println("Mode error");
}

void intro() {
  image(gif[n], 0, 0, width, height);
  n++;
  if (n >= gif.length) n = 0;
  fill(0);
  text("COLOR\nTHEORY", 305, 305);
  fill(colors[c]);
  text("COLOR\nTHEORY", 300, 300);
}

void playing() {
  noStroke();
  fill(0);
  rect(0, 0, 300, 600);
  fill(255);
  rect(300, 0, 300, 600);
  fill(255);
  textSize(100);
  text("TRUE", 150, 50);
  fill(0);
  textSize(100);
  text("FALSE", 450, 50);
  textSize(200);
  fill(colors[c]);
  text(colorWords[w], 300, 300);
  textSize(100);
  fill(160);
  text(correct, 300, 500);
}

void gameOver() {
}

void mouseReleased() {

  if (mode == intro) {
    mode = playing;
  } else if (mode == playing) {
    if (mouseX < 300) {
      if (w==c) {
        correct += 1; 
        background(green);
      } else {
        correct -= 1;
        background(red);
      }
    } else {
      if (w!=c) {
        correct += 1;
        background(green);
      } else {
        correct -= 1;
        background(red);
      }
    }
  } else if (mode == gameover) {
    mode = intro;
  }

  float choice = random(1);
  if (choice < 0.5) {
    c = int(random(5));
    w = int(random(5));
  } else {
    c = int(random(5));
    w = c;
  }
}
