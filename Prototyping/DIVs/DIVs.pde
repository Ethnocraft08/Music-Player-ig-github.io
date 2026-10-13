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
  looponeX = mmX(181);    looponeY = mmY(152);    looponeWidth = mmX(10);     looponeHeight = mmY(10);
  addX = mmX(190);        addY = mmY(152);        addWidth = mmX(10);         addHeight = mmY(10);
}

void draw() {
  background(255);

  rect(coverX, coverY, coverWidth, coverHeight);
  rect(songX, songY, songWidth, songHeight);
  rect(artistX, artistY, artistWidth, artistHeight);
  rect(progbarX, progbarY, progbarWidth, progbarHeight);
  rect(progX, progY, progWidth, progHeight);
  rect(timeX, timeY, timeWidth, timeHeight);
  rect(totaltimeX, totaltimeY, totaltimeWidth, totaltimeHeight);

  rect(stopX, stopY, stopWidth, stopHeight);
  rect(endX, endY, endWidth, endHeight);
  rect(prevX, prevY, prevWidth, prevHeight);
  rect(rewX, rewY, rewWidth, rewHeight);
  rect(playX, playY, playWidth, playHeight);
  rect(pauseX, pauseY, pauseWidth, pauseHeight);
  rect(ffX, ffY, ffWidth, ffHeight);
  rect(nxtX, nxtY, nxtWidth, nxtHeight);
  rect(shuffleX, shuffleY, shuffleWidth, shuffleHeight);
  rect(loopX, loopY, loopWidth, loopHeight);
  rect(looponeX, looponeY, looponeWidth, looponeHeight);
  rect(addX, addY, addWidth, addHeight);
}
