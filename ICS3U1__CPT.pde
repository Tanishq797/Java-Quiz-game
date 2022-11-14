int screen = 0; //<>//
int x = 320;
int y = 550;
int w = 400;
int h = 60;
PImage scene, arrow1, arrow2, card;
PFont font, font2, font3, font4;
int countdown= 10;
int seconds, startTime;
int score= 0;
int timer;
    int[] x1={75, 575};
    int[] y2={243, 543};//164
import processing.sound.*;
SoundFile file;  
//background setup
void setup() {
  size(1000, 1000);
  timer = millis();
  scene= loadImage("TanishqStart.png");
  arrow1= loadImage("backarrow.png");
  arrow2= loadImage("arrow.png");
  card= loadImage("graphicsCard2.png");
  file= new SoundFile(this, "timer.mp3");
  rect(7, 600, 85, 77);
  rect(330, 450, 400, 60);
  rect(273, 465, 355, 40);
  fill(0);
  rect(x, y, w, h);
  font= loadFont("Font.vlw");
  font2= loadFont("font2.vlw");
  font3= loadFont("font3.vlw");
  font4= loadFont("font4.vlw");
  //For countdown time
  fill(0);
  textSize(50);
  startTime = millis()/1000 + countdown;
}
void draw() {
  if (screen == 0) {
    image(scene, 0, 0);
    textFont(font);
    textSize(120);
    text("COMPUTER TRIVIA", 20, 100);
    startButtons();
    if (mousePressed & mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h || mousePressed && mouseX>330 && mouseX <330+400 && mouseY>450 && mouseY <450+60) {
      fill(0);
    }
    if (mouseX>330 && mouseX <330+400 && mouseY>450 && mouseY <450+60 && millis()-timer > 250) {
      fill(0, 0, 255);
      stroke(10);
      cursor(HAND);
    } else if (mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h && millis()-timer > 250) {
      fill(0, 255, 0);
      stroke(0);
      cursor(HAND);
    } else {
      cursor(ARROW);
    }
  }
  if (screen == 1) {//Instructions screen
    fill(255);
    instructions();
    if (mouseX>7 && mouseX <7+85 && mouseY>600 && mouseY <600+77) {
      cursor(HAND);
    } else {
      cursor(ARROW);
    }
  }
  if (screen == 2) {//first question
    fill(255);
    question1(75, 243, 355, 115, "15 bits");
    question1(75, 543, 355, 115, "200 MB");
    question1(575, 243, 355, 115, "735 KB");
    question1(575, 543, 355, 115, "10 GB");
    score= 0;
  }
  if (screen != 0 && screen != 1) {//10 second countdown timer
    timer();
    score();
  }
  if (screen == 3) {//game over screen
    gameOver();
  }
  if (screen == 4) {//Second question
    fill(0);
    question2(75, 243, 355, 115, "700 Hz");
    question2(75, 543, 355, 115, "2 GHz");
    question2(575, 243, 355, 115, "1.25 GHz");
    question2(575, 543, 355, 115, "1000 MHz");
  }
  if (screen == 5) {//third question
    question3(75, 243, 355, 115, "Keyboard, ");
    text("Mouse, Scanner", 130, 330);
    question3(75, 543, 355, 115, "Monitor, TV screen,");
    text("Microphone", 130, 630);
    question3(575, 243, 355, 115, "Digital Mixers, Speakers,");
    text("Projector", 625, 330);
    question3(575, 543, 355, 115, "Video Camera, Printer,");
    text("Joystick", 625, 630);
  }
  if (screen == 6) {
    question4(75, 243, 355, 115, "TRUE");
    question4(575, 243, 355, 115, "FALSE");
  }
  if (screen == 7) {
    question5(75, 243, 355, 115, "TRUE");
    question5(575, 243, 355, 115, "FALSE");
  }
  if (screen == 8) {
    question6(75, 243, 355, 115, "Storage");
    question6(75, 543, 355, 115, "Software");
    question6(575, 243, 355, 115, "Virus");
    question6(575, 543, 355, 115, "Processing");
  }
  if (screen == 9) {
    question7(75, 243, 355, 115, "Transistors");
    question7(75, 543, 355, 115, "Antennas");
    question7(575, 243, 355, 115, "Microns");
    question7(575, 543, 355, 115, "Chips");
  }
  if (screen == 10) {
    image(card, 500, 500);
    question8(75, 243, 355, 115, "Graphics Card");
    question8(575, 243, 355, 115, "Motherboard");
  }
  if (screen == 11) {
    question9(75, 243, 355, 115, "Logic Board");
    question9(75, 543, 355, 115, "Network Interface Card \n (NIC)");
    question9(575, 243, 355, 115, "Random Access Memory \n (RAM)");
    question9(575, 543, 355, 115, "Optical Drive");
  }
  if (screen == 12) {
    question10(75, 243, 355, 115, "500 Hz");
    question10(75, 543, 355, 115, "0.025 KHz");
    question10(575, 243, 355, 115, "2.25 KHz");
    question10(575, 543, 355, 115, "0.001 KHz");
  }
}

void mouseClicked() {
  if (screen == 0) {//start button to first question
    if (mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h && millis()-timer > 250) {
      background(25, 75, 69);
      screen = 2;
      timer= millis();
    }
  }
  if (screen == 0) {//How to play button
    if (mouseX>330 && mouseX <330+400 && mouseY>450 && mouseY <450+60 && millis()-timer > 250) {
      background(#F07D30);
      screen = 1;
      timer= millis();
    }
  }
  if (screen == 1) {//Arrow for returning to home screen from instructions screen 
    if (mouseX>7 && mouseX <7+85 && mouseY>600 && mouseY <600+77 && millis()-timer > 250) {
      screen = 0;
      timer= millis();
    }
  }
  if (screen == 2) {//question 1 to question 2
    cursor(ARROW);
    if (mouseX>x1[-2] && mouseX<x1[2]+355 && mouseY>y2[2] && mouseY <y2[2]+115 && millis()-timer > 250) {
      background(#519EC4);
      score+=10;
      screen= 4;
      timer= millis();
      startTime = millis()/1000 + countdown;
    } else if (mouseX>575 && mouseX<575+355 && mouseY>243 && mouseY <243+115 && millis()-timer > 250) {   
      fill(225, 0, 0);
      textFont(font3);
      text("OOPS!Wrong answer", 200, 400);
      image(arrow2, 400, 400);
    } else if (mouseX>75 && mouseX<75+355 && mouseY>543 && mouseY <543+115 && millis()-timer > 250) {
      fill(225, 0, 0);
      textFont(font3);
      text("OOPS!Wrong answer", 200, 400);
      image(arrow2, 400, 400);
    } else if (mouseX>75 && mouseX<75+355 && mouseY>243 && mouseY <243+115 && millis()-timer > 250) {
      fill(225, 0, 0);
      textFont(font3);
      text("OOPS!Wrong answer", 200, 400);
      image(arrow2, 400, 400);
      timer= millis();
    }
    if (mouseX>150 && mouseX<150+400 && mouseY>150 && mouseY<150+400 && millis()-timer > 250) {
      background(#519EC4);
      screen= 4;
      timer= millis();
      startTime = millis()/1000 + countdown;
    }
  }

  if (screen == 4) {//question 2 to question 3
    if (mouseX>575 && mouseX<575+355 && mouseY>543 && mouseY <543+115 && millis()-timer > 250) {
      fill(225, 0, 0);
      textFont(font3);
      text("OOPS!Wrong answer", 200, 400);
      image(arrow2, 400, 400);
    } else if (mouseX>575 && mouseX<575+355 && mouseY>243 && mouseY <243+115 && millis()-timer > 250) {      
      fill(225, 0, 0);
      textFont(font3);
      text("OOPS!Wrong answer", 200, 400);
      image(arrow2, 400, 400);
    } else if (mouseX>75 && mouseX<75+355 && mouseY>543 && mouseY <543+115 && millis()-timer > 250) {
      background(#9B8719);
      screen= 5;
      score+=10;
      timer= millis();
      startTime = millis()/1000 + countdown;
    } else if (mouseX>75 && mouseX<75+355 && mouseY>243 && mouseY <243+115 && millis()-timer > 250) {
      fill(225, 0, 0);
      textFont(font3);
      text("OOPS!Wrong answer", 200, 400);
      image(arrow2, 400, 400);
      timer= millis();
    }
    if (mouseX>150 && mouseX<150+400 && mouseY>150 && mouseY<150+400 && millis()-timer > 250) {
      background(#519EC4);
      screen= 5;
      timer= millis();
      startTime = millis()/1000 + countdown;
    }
  }
  if (screen == 5) {//question 3 to question 4
    if (mouseX>575 && mouseX<575+355 && mouseY>543 && mouseY <543+115 && millis()-timer > 250) {
      fill(225, 0, 0);
      textFont(font3);
      text("OOPS!Wrong answer", 200, 400);
      image(arrow2, 400, 400);
    } else if (mouseX>575 && mouseX<575+355 && mouseY>243 && mouseY <243+115 && millis()-timer > 250) {      
      fill(225, 0, 0);
      textFont(font3);
      text("OOPS!Wrong answer", 200, 400);
      image(arrow2, 400, 400);
    } else if (mouseX>75 && mouseX<75+355 && mouseY>543 && mouseY <543+115 && millis()-timer > 250) {
      fill(225, 0, 0);
      textFont(font3);
      text("OOPS!Wrong answer", 200, 400);
      image(arrow2, 400, 400);
    } else if (mouseX>75 && mouseX<75+355 && mouseY>243 && mouseY <243+115 && millis()-timer > 250) {
      background(25, 75, 69);
      screen= 6;
      score+=10;
      timer= millis();
      startTime = millis()/1000 + countdown;
    }
    if (mouseX>150 && mouseX<150+400 && mouseY>150 && mouseY<150+400 && millis()-timer > 250) {
      background(#519EC4);
      screen= 6;
      timer= millis();
      startTime = millis()/1000 + countdown;
    }
  }
  if (screen == 6) {//question 4 to question 5
    if (mouseX>75 && mouseX<75+355 && mouseY>243 && mouseY <243+115 && millis()-timer > 250) {
      fill(225, 0, 0);
      textFont(font3);
      text("OOPS!Wrong answer", 200, 400);
      image(arrow2, 400, 400);
      timer= millis();
    } else if (mouseX>575 && mouseX<575+355 && mouseY>243 && mouseY <243+115 && millis()-timer > 250) {
      background(25, 75, 69);
      screen= 7;
      score+=10;
      timer= millis();
      startTime = millis()/1000 + countdown;
    }
    if (mouseX>150 && mouseX<150+400 && mouseY>150 && mouseY<150+550 && millis()-timer > 250) {
      background(25, 75, 69);
      screen= 7;
      timer= millis();
      startTime = millis()/1000 + countdown;
    }
  }
  if (screen == 7) {//question 5 to 6
    if (mouseX>75 && mouseX<75+355 && mouseY>243 && mouseY <243+115 && millis()-timer > 250) {
      background(25, 75, 69);
      screen= 8;
      score+=10;
      timer= millis();
      startTime = millis()/1000 + countdown;
    } else if (mouseX>75 && mouseX<75+355 && mouseY>243 && mouseY <243+115 && millis()-timer > 250) {
      fill(225, 0, 0);
      textFont(font3);
      text("OOPS!Wrong answer", 200, 400);
      image(arrow2, 400, 400);
    }
    if (mouseX>150 && mouseX<150+400 && mouseY>150 && mouseY<150+550 && millis()-timer > 250) {
      background(25, 75, 69);
      screen= 8;
      timer= millis();
      startTime = millis()/1000 + countdown;
    }
  }
  if (screen == 8) {
    if (mouseX>575 && mouseX<575+355 && mouseY>543 && mouseY <543+115 && millis()-timer > 250) {
      fill(225, 0, 0);
      textFont(font3);
      text("OOPS!Wrong answer", 200, 400);
      image(arrow2, 400, 400);
    } else if (mouseX>575 && mouseX<575+355 && mouseY>243 && mouseY <243+115 && millis()-timer > 250) {      
      fill(225, 0, 0);
      textFont(font3);
      text("OOPS!Wrong answer", 200, 400);
      image(arrow2, 400, 400);
    } else if (mouseX>75 && mouseX<75+355 && mouseY>543 && mouseY <543+115 && millis()-timer > 250) {
      background(25, 75, 69);
      screen= 9;
      score+=10;
      timer= millis();
      startTime = millis()/1000 + countdown;
    } else if (mouseX>75 && mouseX<75+355 && mouseY>243 && mouseY <243+115 && millis()-timer > 250) {
      fill(225, 0, 0);
      textFont(font3);
      text("OOPS!Wrong answer", 200, 400);
      image(arrow2, 400, 400);
      timer= millis();
    }
    if (mouseX>150 && mouseX<150+400 && mouseY>150 && mouseY<150+400 && millis()-timer > 250) {
      background(#F07D30);
      screen= 9;
      timer= millis();
      startTime = millis()/1000 + countdown;
    }
  }
  if (screen == 9) {
    if (mouseX>575 && mouseX<575+355 && mouseY>543 && mouseY <543+115 && millis()-timer > 250) {
      fill(225, 0, 0);
      textFont(font3);
      text("OOPS!Wrong answer", 200, 400);
      image(arrow2, 400, 400);
    } else if (mouseX>575 && mouseX<575+355 && mouseY>243 && mouseY <243+115 && millis()-timer > 250) {      
      fill(225, 0, 0);
      textFont(font3);
      text("OOPS!Wrong answer", 200, 400);
      image(arrow2, 400, 400);
    } else if (mouseX>75 && mouseX<75+355 && mouseY>543 && mouseY <543+115 && millis()-timer > 250) {
      fill(225, 0, 0);
      textFont(font3);
      text("OOPS!Wrong answer", 200, 400);
      image(arrow2, 400, 400);
    } else if (mouseX>75 && mouseX<75+355 && mouseY>243 && mouseY <243+115 && millis()-timer > 250) {
      background(25, 75, 69);
      screen= 10;
      score+=10;
      timer= millis();
      startTime = millis()/1000 + countdown;
    }
    if (mouseX>150 && mouseX<150+400 && mouseY>150 && mouseY<150+400 && millis()-timer > 250) {
      background(#F07D30);
      screen= 10;
      timer= millis();
      startTime = millis()/1000 + countdown;
    }
  }
  if (screen == 10) {
    if (mouseX>75 && mouseX<75+355 && mouseY>243 && mouseY <243+115 && millis()-timer > 250) {
      background(25, 75, 69);
      screen= 11;
      score+=10;
      timer= millis();
      startTime = millis()/1000 + countdown;
    } else if (mouseX>75 && mouseX<75+355 && mouseY>243 && mouseY <243+115 && millis()-timer > 250) {
      fill(225, 0, 0);
      textFont(font3);
      text("OOPS!Wrong answer", 200, 400);
      image(arrow2, 400, 400);
    }
    if (mouseX>150 && mouseX<150+400 && mouseY>150 && mouseY<150+550 && millis()-timer > 250) {
      background(25, 75, 69);
      screen= 11;
      startTime = millis()/1000 + countdown;
    }
  }
  if (screen == 11) {
    if (mouseX>575 && mouseX<575+355 && mouseY>543 && mouseY <543+115 && millis()-timer > 250) {
      fill(225, 0, 0);
      textFont(font3);
      text("OOPS!Wrong answer", 200, 400);
      image(arrow2, 400, 400);
    } else if (mouseX>575 && mouseX<575+355 && mouseY>243 && mouseY <243+115 && millis()-timer > 250) {      
      fill(225, 0, 0);
      textFont(font3);
      text("OOPS!Wrong answer", 200, 400);
      image(arrow2, 400, 400);
    } else if (mouseX>75 && mouseX<75+355 && mouseY>543 && mouseY <543+115 && millis()-timer > 250) {
      background(#3CE31B);
      screen= 12;
      score+=10;
      timer= millis();
      startTime = millis()/1000 + countdown;
    } else if (mouseX>75 && mouseX<75+355 && mouseY>243 && mouseY <243+115 && millis()-timer > 250) {
      fill(225, 0, 0);
      textFont(font3);
      text("OOPS!Wrong answer", 200, 400);
      image(arrow2, 400, 400);
    }
    if (mouseX>150 && mouseX<150+400 && mouseY>150 && mouseY<150+400 && millis()-timer > 250) {
      background(#F07D30);
      screen= 12;
      timer= millis();
      startTime = millis()/1000 + countdown;
    }
  }
  if (screen == 12) {
    if (mouseX>575 && mouseX<575+355 && mouseY>543 && mouseY <543+115 && millis()-timer > 250) {
      background(25, 75, 69);
      screen= 3;
      score+=10;
      timer= millis();
      startTime = millis()/1000 + countdown;
    } else if (mouseX>575 && mouseX<575+355 && mouseY>243 && mouseY <243+115 && millis()-timer > 250) {      
      fill(225, 0, 0);
      textFont(font3);
      text("OOPS!Wrong answer", 200, 400);
      image(arrow2, 400, 400);
    } else if (mouseX>75 && mouseX<75+355 && mouseY>543 && mouseY <543+115 && millis()-timer > 250) {
      fill(225, 0, 0);
      textFont(font3);
      text("OOPS!Wrong answer", 200, 400);
      image(arrow2, 400, 400);
    } else if (mouseX>75 && mouseX<75+355 && mouseY>243 && mouseY <243+115 && millis()-timer > 250) {
      fill(225, 0, 0);
      textFont(font3);
      text("OOPS!Wrong answer", 200, 400);
      image(arrow2, 400, 400);
    }
    if (mouseX>150 && mouseX<150+400 && mouseY>150 && mouseY<150+400 && millis()-timer > 250) {
      background(#F07D30);
      screen= 3;
      timer= millis();
      startTime = millis()/1000 + countdown;
    }
  }

  println(screen);
  if (screen == 3) {//question 1 to game over screen
    if (mouseX>273 && mouseX<273+355 && mouseY>465 && mouseY<465+40 && millis()-timer > 250) {
      screen= 0;
      timer= millis();
      startTime = millis()/1000 + countdown;
    }
  }
}
//Button starts game
void startButtons() {
  textSize(40);
  text("HOW TO PLAY", 375, 500);
  text("CLick Here To Start", 325, 600);
  fill(255);
}
void instructions() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      screen= 0;
    }
  }
  image(arrow1, 10, 600);
  textFont(font2);
  textSize(100);
  text("INSTRUCTIONS", 40, 100);
  textFont(font4);
  textSize(25);
  text("Welcome to computer trivia! \n ", 30, 250);
  text("Rules of this game are quite simple", 30, 300);
  text("For each multiple choice and true or false question,", 30, 320);
  text("you will have a time limit of 10 seconds to answer", 30, 340);
  text("If the question requires to arrange the boxes or match certain", 30, 370);
  text("terms, your time limit will be 30 seconds", 30, 390);
  text("Once you have clicked on the correct answer or finished the", 30, 420);
  text("ordering and matching questions properly, you will automatically", 30, 440);
  text("be taken to the next question", 30, 460);
  text("If the answers you chose in a question are incorrect,", 30, 500);
  text("you will need to restart", 30, 520);
  text("You can always try again", 30, 540);
  text("GOOD LUCK!", 30, 570);
}
void gameOver() {
  background(0);
  fill(random(255), random(255), random(255));
  textFont(font3);
  textSize(100);
  text("GAME OVER", 175, 300);
  textSize(40);
  text("Final Score: " + score, 325, 350);
  textSize(40);
  textFont(font);
  text("Try again?", 350, 450);
  text("CLick Here To Start", 275, 500);
  if (mousePressed && mouseX>273 && mouseX<273+355 && mouseY>465 && mouseY<465+40) {
    fill(0, 255, 0);
  }
}
void timer() {
  fill(25, 75, 69);
  noStroke();
  rect(10, 0, 35, 45);
  seconds = startTime - millis()/1000;

  if (seconds < 0) {
    screen=3;
  } else {
    fill(255);
    textFont(font3);
    text(seconds, 10, 40);
  }
  if (screen == 0) {
    startTime = millis()/1000 + countdown;
  }
}
void score() {
  text("Score:"+score, 825, 40);
}
void question1(int x, int y, int w, int h, String text) {
  textFont(font3);
  fill(255);
  textSize(55);
  text("Which of the following shows \n the highest storage space?", 70, 90);
  rect(x, y, w, h);
  textSize(50);
  fill(0);
  text(text, x+50, y+60);
}
void question2(int x, int y, int w, int h, String text) {
  textFont(font3);
  fill(255);
  textSize(55);
  text("Which option represents the \n fastest clock speed?", 70, 70);
  rect(x, y, w, h);
  textSize(50);
  fill(0);
  text(text, x+50, y+60);
}
void question3(int x, int y, int w, int h, String text) {
  textFont(font3);
  fill(255);
  textSize(55);
  text("What are three examples \n of input devices?", 70, 70);
  rect(x, y, w, h);
  textFont(font2);
  textSize(30);
  fill(0);
  text(text, x+50, y+60);
}
void question4(int x, int y, int w, int h, String text) {
  textFont(font3);
  fill(255);
  textSize(45);
  text("CPU stands for", 70, 70);
  text("COMPUTER PROCESSING UNIT", 70, 130);
  rect(x, y, w, h);
  textFont(font3);
  textSize(40);
  fill(0);
  text(text, x+50, y+60);
}
void question5(int x, int y, int w, int h, String text) {
  textFont(font3);
  fill(255);
  textSize(55);
  text("There are 8", 70, 90);
  text("bits in one byte of storage.", 70, 130);
  rect(x, y, w, h);
  textFont(font3);
  textSize(40);
  fill(0);
  text(text, x+50, y+60);
}
void question6(int x, int y, int w, int h, String text) {
  textFont(font3);
  fill(255);
  textSize(45);
  text("These programs fall into three different categories:", 70, 90);
  text("operating systems, applications, and programming languages.", 70, 165);
  rect(x, y, w, h);
  textFont(font3);
  textSize(40);
  fill(0);
  text(text, x+50, y+60);
}
void question7(int x, int y, int w, int h, String text) {
  textFont(font3);
  fill(255);
  textSize(55);
  text("The CPU in a computer consists of many:", 70, 90);
  rect(x, y, w, h);
  textFont(font3);
  textSize(40);
  fill(0);
  text(text, x+50, y+60);
}
void question8(int x, int y, int w, int h, String text) {
  textFont(font3);
  fill(255);
  textSize(55);
  text("The following is a picture of a :", 70, 90);
  rect(x, y, w, h);
  textFont(font3);
  textSize(40);
  fill(0);
  text(text, x+50, y+60);
}
void question9(int x, int y, int w, int h, String text) {
  textFont(font3);
  fill(255);
  textSize(45);
  text("Data transfer rate is a common specification ", 70, 90);
  text("that is used to determine this components speed.", 70, 135);
  text("Data rates are measured in Mbps.", 70, 190);
  rect(x, y, w, h);
  textFont(font3);
  textSize(40);
  fill(0);
  text(text, x+35, y+60);
}
void question10(int x, int y, int w, int h, String text) {
  textFont(font3);
  fill(255);
  textSize(55);
  text("How many \"Kilohertz\" are in 1 \"Hertz\"?", 70, 90);
  rect(x, y, w, h);
  textFont(font3);
  textSize(40);
  fill(0);
  text(text, x+50, y+60);
}
void question11() {
  textFont(font3);
  score();
  textFont(font4);
  text("Match the following terms with the correct definitions", 20, 30);
  for (int i=1; i<=3; i++) {
    stroke(1);
    fill(255);
    rect(-200+i*275, 500, 300, 110);
  }
  for (int j=1; j<=3; j++) {
    stroke(1);
    rect(-200+j*275, 300, 300, 110);
  }
  //for defintions
  textSize(25);
  textFont(font2);
  fill(0);
  text("Information provided to \n the computer from the user.", 100, 270);
  text("Information is saved in case \n it needs to be retrieved later.", 375, 270);
  text("These programs fall into three different \n categories: operating systems, applications, \n and programming languages.", 615, 250);
  text("These are programs designed to \n allow users to perform a specific task.", 75, 470);
  text("A program that infects computer \n programs by attaching itself to them.", 360, 470);
  text("Information from input is converted into \n a form that the computer can use.", 645, 470); 

  fill(#DEA6F5);
  rect(35, 70, 150, 50);
  rect(285, 70, 150, 50);
  rect(535, 70, 150, 50);
  rect(785, 70, 150, 50);
  rect(275, 175, 150, 50);
  rect(505, 175, 170, 50);
  //for terms
  fill(0);
  textSize(35);
  text("Processing", 40, 105);
  text("Virus", 315, 105);
  text("Input", 565, 105);
  text("Storage", 815, 105);
  text("Software", 280, 205);
  text("Applications", 510, 205);
}
