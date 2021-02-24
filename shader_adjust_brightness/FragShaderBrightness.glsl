// The world pixel by pixel 2021
// Daniel Rozin
// fragment shader to adjust brightness of live video

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;                                           // this is the whole image coming in
varying vec4 vertTexCoord;                                        // this is the coordinates of this fragment (pixel ?)
uniform float param1 ;                                              // our parameter passed from processing will land here



void main() {
	vec4 thisPixColor = texture2D(texture, vertTexCoord.st);        // get the color of our pixel
	
  
  
  
  float newR= clamp(1-thisPixColor.r,0,1);                   // add a value to each component R,G,B and make sure its 0-1
	float newG= clamp(1-thisPixColor.g,0,1);                   // clamping is not really needed cause the shader does it by default
	float newB= clamp(1-thisPixColor.b,0,1);

  
  
  
  	gl_FragColor = vec4(newR,newG,newB,1);                          // make a vec4 with the new R,G,B ,A and set as the output
}
