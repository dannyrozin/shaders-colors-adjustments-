// The world pixel by pixel 2017
// Daniel Rozin
// use fragment shader to adjust brightness of live video

import processing.video.*;

Capture video;
PShader myFragShader;                                              // variable to hold shader

void setup() {
  size(640, 480, P2D);                                             // must be P2D or P3D for shaders
  frameRate(400);                                                  // set high FPS, defaults to 60
  myFragShader = loadShader("FragShaderBrightness.glsl");     // our shader file has to be in our folder
  
  video = new Capture(this,width, height);                          // open the video capture at size of window
  video.start();                                                    // start the video capture
}
void captureEvent(Capture c) {                                      // this is a calback function, the video calls it 
  c.read();                                                          //when a frame is ready, and then reads the frame
}

void draw() {
  image(video,0,0);                                                // we have to draw the live video to the window
  float adjustAmount= map (mouseX, 0,width, -1,1);                 // and the shader will transform it 
  myFragShader.set("param1",adjustAmount);                         // pass paramater to shader
  shader(myFragShader);                                            // call shader
  println (frameRate);
}