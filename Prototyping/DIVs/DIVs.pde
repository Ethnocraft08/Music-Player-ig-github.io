/* Steps for Scafolding a Program while learning code
rect(nameX, nameY, nameWidth, nameHeight);
Copy and Paste, rename
*/

float coverX, coverY, coverWidth, coverHeight;
float songX, songY, songWidth, songHeight;
float artistX, artistY, artistWidth, artistHeight;
float progbarX, progbarY, progbarWidth, progbarHeight;
float progX, progY, progWidth, progHeight;
float timeX, timeY, timeWidth, timeHeight;
float totaltimeX, totaltimeY, totaltimeWidth, totaltimeHeight;
float endX, endY, endWidth, endHeight;
float stopX, stopY, stopWidth, stopHeight;
float prevX, prevY, prevWidth, prevHeight;
float rewX, rewY, rewWidth, rewHeight;
float playX, playY, playWidth, playHeight;
float pauseX, pauseY, pauseWidth, pauseHeight;
float ffX, ffY, ffWidth, ffHeight;
float nxtX, nxtY, nxtWidth, nxtHeight;
float shuffleX, shuffleY, shuffleWidth, shuffleHeight;
float loopX, loopY, loopWidth, loopHeight;
float looponeX, looponeY, looponeWidth, looponeHeight;
float addX, addY, addWidth, addHeight;

boolean isPlaying = false;
boolean shuffleOn = false;
boolean loopOn = false;
boolean loopOneOn = false;

final float PAPER_W = 280;
final float PAPER_H = 215;

float mmX(float mm) { return mm / PAPER_W * width; }
float mmY(float mm) { return mm / PAPER_H * height; }

void setup() {
  size(840, 645);   // 3 pixels per mm

  coverX = mmX(95);       coverY = mmY(10);       coverWidth = mmX(77);       coverHeight = mmY(77);
  songX = mmX(67);        songY = mmY(103);       songWidth = mmX(39);        songHeight = mmY(8);
  artistX = mmX(67);      artistY = mmY(114);     artistWidth = mmX(26);      artistHeight = mmY(6);
  progbarX = mmX(67);     progbarY = mmY(131);    progbarWidth = mmX(130);    progbarHeight = mmY(5);
  progX = mmX(130);       progY = mmY(130);       progWidth = mmX(7);         progHeight = mmY(7);
  timeX = mmX(67);       timeY = mmY(136);       timeWidth = mmX(15);        timeHeight = mmY(5);
  totaltimeX = mmX(182);  totaltimeY = mmY(136);  totaltimeWidth = mmX(15);   totaltimeHeight = mmY(5);

  stopX = mmX(63);        stopY = mmY(152);       stopWidth = mmX(10);        stopHeight = mmY(10);
  endX = mmX(74);         endY = mmY(152);        endWidth = mmX(10);         endHeight = mmY(10);
  prevX = mmX(84);        prevY = mmY(152);       prevWidth = mmX(10);        prevHeight = mmY(10);
  rewX = mmX(97);         rewY = mmY(152);        rewWidth = mmX(10);         rewHeight = mmY(10);
  playX = mmX(108);       playY = mmY(152);       playWidth = mmX(10);        playHeight = mmY(10);
  pauseX = mmX(118);      pauseY = mmY(152);      pauseWidth = mmX(10);       pauseHeight = mmY(10);
  ffX = mmX(131);         ffY = mmY(152);         ffWidth = mmX(10);          ffHeight = mmY(10);
  nxtX = mmX(142);        nxtY = mmY(152);        nxtWidth = mmX(10);         nxtHeight = mmY(10);
  shuffleX = mmX(154);    shuffleY = mmY(152);    shuffleWidth = mmX(10);     shuffleHeight = mmY(10);
  loopX = mmX(166);       loopY = mmY(152);       loopWidth = mmX(10);        loopHeight = mmY(10);
  looponeX = mmX(179);    looponeY = mmY(152);    looponeWidth = mmX(10);     looponeHeight = mmY(10);
  addX = mmX(190);        addY = mmY(152);        addWidth = mmX(10);         addHeight = mmY(10);
}

void draw() {
  background(25);

  // Cover art placeholder
  fill(70);
  stroke(120);
  rect(coverX, coverY, coverWidth, coverHeight);

  // Song and artist text
  fill(255);
  textAlign(LEFT, CENTER);
  textSize(songHeight * 0.7);
  text("Song Name", songX, songY + songHeight / 2);
  fill(180);
  textSize(artistHeight * 0.7);
  text("Artist Name", artistX, artistY + artistHeight / 2);

  // Progress bar and dot
  fill(60);
  noStroke();
  rect(progbarX, progbarY, progbarWidth, progbarHeight, 4);
  fill(30, 215, 96);
  ellipse(progX + progWidth / 2, progY + progHeight / 2, progWidth, progHeight);

  // Times
  fill(200);
  textSize(timeHeight * 0.9);
  textAlign(LEFT, TOP);
  text("0:00", timeX, timeY);
  textAlign(RIGHT, TOP);
  text("3:45", totaltimeX + totaltimeWidth, totaltimeY);

  // Buttons
  button("STOP", stopX, stopY, stopWidth, stopHeight);
  button("END", endX, endY, endWidth, endHeight);
  button("PREV", prevX, prevY, prevWidth, prevHeight);
  button("REW", rewX, rewY, rewWidth, rewHeight);
  button("PLAY", playX, playY, playWidth, playHeight);
  button("PAUSE", pauseX, pauseY, pauseWidth, pauseHeight);
  button("FF", ffX, ffY, ffWidth, ffHeight);
  button("NEXT", nxtX, nxtY, nxtWidth, nxtHeight);
  button("SHUF", shuffleX, shuffleY, shuffleWidth, shuffleHeight);
  button("LOOP", loopX, loopY, loopWidth, loopHeight);
  button("LOOP1", looponeX, looponeY, looponeWidth, looponeHeight);
  button("ADD", addX, addY, addWidth, addHeight);
}

void button(String label, float x, float y, float w, float h) {
  fill(60);
  stroke(120);
  rect(x, y, w, h, 5);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(h * 0.3);
  text(label, x + w / 2, y + h / 2);
}


 

boolean over(float x, float y, float w, float h) {
  return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
}

void mousePressed() {
  if (over(playX, playY, playWidth, playHeight))             { isPlaying = true;  println("PLAY"); }
  if (over(pauseX, pauseY, pauseWidth, pauseHeight))         { isPlaying = false; println("PAUSE"); }
  if (over(stopX, stopY, stopWidth, stopHeight))             { isPlaying = false; println("STOP"); }
  if (over(endX, endY, endWidth, endHeight))                 { println("END"); }
  if (over(prevX, prevY, prevWidth, prevHeight))             { println("PREV"); }
  if (over(nxtX, nxtY, nxtWidth, nxtHeight))                 { println("NEXT"); }
  if (over(rewX, rewY, rewWidth, rewHeight))                 { println("REWIND"); }
  if (over(ffX, ffY, ffWidth, ffHeight))                     { println("FAST FORWARD"); }
  if (over(addX, addY, addWidth, addHeight))                 { println("ADD SONG"); }

  if (over(shuffleX, shuffleY, shuffleWidth, shuffleHeight)) { shuffleOn = !shuffleOn; }
  if (over(loopX, loopY, loopWidth, loopHeight)) {
    loopOn = !loopOn;
    if (loopOn) loopOneOn = false;   // only one loop mode at a time
  }
  if (over(looponeX, looponeY, looponeWidth, looponeHeight)) {
    loopOneOn = !loopOneOn;
    if (loopOneOn) loopOn = false;
  }
}
