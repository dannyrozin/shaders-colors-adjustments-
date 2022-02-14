// The world pixel by pixel 2022
// Daniel Rozin
//fragment shader to threshold


#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;                    // this is the whole image coming in
varying vec4 vertTexCoord;                    // this is the coordinates of this fragment (pixel?)
uniform float param1;                         // this is a variable for our parameter sent from Processing



void main() {
	vec4 thisPixColor = texture2D(texture, vertTexCoord.st);                        // get the color of our pixel
	float thisPixBrightness= (thisPixColor.r+thisPixColor.g+thisPixColor.b)/3;      // average to get gray brightness 
	if (thisPixBrightness>param1){
  		gl_FragColor = vec4(0,0,0,1);                          // if our pixel is dark make a vec4 with black
  	}else{
  		gl_FragColor = vec4(1,1,1,1);                          // if our pixel is bright make a vec4 with white
  	}
}
