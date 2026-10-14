/* Steps for Scafolding a Program while learning code
rect(nameX, nameY, nameWidth, nameHeight);
Copy and Paste, rename
*/

import ddf.minim.*;

Minim minim;
AudioPlayer player;

// Replace with your real file names and info
String[] files       = { "song1.mp3", "song2.mp3", "song3.mp3" };
String[] songNames   = { "Song One", "Song Two", "Song Three" };
String[] artistNames = { "Artist One", "Artist Two", "Artist Three" };
int current = 0;

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
    minim = new Minim(this);
  loadSong(0);
}

void draw() {
  background(25);

  // What happens when a song finishes
  if (isPlaying && !player.isPlaying()) {
    if (loopOneOn) {
      player.rewind();
      player.play();
    } else if (loopOn || shuffleOn || current < files.length - 1) {
      nextSong();
    } else {
      player.rewind();
      isPlaying = false;
    }
  }

  // Move the progress dot
  float pct = 0;
  if (player.length() > 0) pct = (float) player.position() / player.length();
  progX = progbarX + pct * (progbarWidth - progWidth);

  // Cover art placeholder
  fill(70);
  stroke(120);
  rect(coverX, coverY, coverWidth, coverHeight);

  // Song and artist text
  fill(255);
  textAlign(LEFT, CENTER);
  textSize(songHeight * 0.7);
  text(songNames[current], songX, songY + songHeight / 2);
  fill(180);
  textSize(artistHeight * 0.7);
  text(artistNames[current], artistX, artistY + artistHeight / 2);

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
  text(formatTime(player.position()), timeX, timeY);
  textAlign(RIGHT, TOP);
  text(formatTime(player.length()), totaltimeX + totaltimeWidth, totaltimeY);

  // Buttons
  button("STOP", stopX, stopY, stopWidth, stopHeight);
  button("END", endX, endY, endWidth, endHeight);
  button("PREV", prevX, prevY, prevWidth, prevHeight);
  button("REW", rewX, rewY, rewWidth, rewHeight);
  button("PLAY", playX, playY, playWidth, playHeight, isPlaying);
  button("PAUSE", pauseX, pauseY, pauseWidth, pauseHeight, !isPlaying);
  button("FF", ffX, ffY, ffWidth, ffHeight);
  button("NEXT", nxtX, nxtY, nxtWidth, nxtHeight);
  button("SHUF", shuffleX, shuffleY, shuffleWidth, shuffleHeight, shuffleOn);
  button("LOOP", loopX, loopY, loopWidth, loopHeight, loopOn);
  button("LOOP1", looponeX, looponeY, looponeWidth, looponeHeight, loopOneOn);
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

void button(String label, float x, float y, float w, float h, boolean active) {
  if (active) fill(30, 215, 96); else fill(60);
  stroke(120);
  rect(x, y, w, h, 5);
  fill(active ? 0 : 255);
  textAlign(CENTER, CENTER);
  textSize(h * 0.3);
  text(label, x + w / 2, y + h / 2);
}
 

boolean over(float x, float y, float w, float h) {
  return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
}

void mousePressed() {
  if (over(playX, playY, playWidth, playHeight))     { player.play();  isPlaying = true; }
  if (over(pauseX, pauseY, pauseWidth, pauseHeight)) { player.pause(); isPlaying = false; }
  if (over(stopX, stopY, stopWidth, stopHeight))     { player.pause(); player.rewind(); isPlaying = false; }
  if (over(endX, endY, endWidth, endHeight))         { player.cue(max(0, player.length() - 100)); }
  if (over(prevX, prevY, prevWidth, prevHeight))     { prevSong(); }
  if (over(nxtX, nxtY, nxtWidth, nxtHeight))         { nextSong(); }
  if (over(rewX, rewY, rewWidth, rewHeight))         { player.skip(-10000); }   // back 10 sec
  if (over(ffX, ffY, ffWidth, ffHeight))             { player.skip(10000); }    // forward 10 sec
  if (over(addX, addY, addWidth, addHeight))         { println("ADD SONG"); }

  if (over(shuffleX, shuffleY, shuffleWidth, shuffleHeight)) { shuffleOn = !shuffleOn; }
  if (over(loopX, loopY, loopWidth, loopHeight)) {
    loopOn = !loopOn;
    if (loopOn) loopOneOn = false;
  }
  if (over(looponeX, looponeY, looponeWidth, looponeHeight)) {
    loopOneOn = !loopOneOn;
    if (loopOneOn) loopOn = false;
  }

  // Click the progress bar to jump to that spot
  if (over(progbarX, progbarY, progbarWidth, progbarHeight)) {
    float pct = (mouseX - progbarX) / progbarWidth;
    player.cue(int(pct * player.length()));
  }
}

void loadSong(int i) {
  boolean wasPlaying = isPlaying;
  if (player != null) player.close();
  current = i;
  player = minim.loadFile(files[current]);
  isPlaying = false;
  if (wasPlaying) {
    player.play();
    isPlaying = true;
  }
}

void nextSong() {
  if (shuffleOn) {
    int n = current;
    while (n == current) n = int(random(files.length));
    loadSong(n);
  } else {
    loadSong((current + 1) % files.length);
  }
}

void prevSong() {
  if (player.position() > 3000) {
    player.rewind();                       // restart the song if it's been playing a while
  } else {
    loadSong((current - 1 + files.length) % files.length);
  }
}

String formatTime(int ms) {
  int s = ms / 1000;
  return (s / 60) + ":" + nf(s % 60, 2);
}
