#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;                                           // this is the color comnig in
varying vec4 vertTexCoord;
uniform float param1;



void main() {
	vec4 thisPixColor = texture2D(texture, vertTexCoord.st);                        // get the color of our pixel
	float thisPixBrightness= (thisPixColor.r+thisPixColor.g+thisPixColor.b)/3;      // average to get gray brightness 
	if (thisPixBrightness>param1){
  		gl_FragColor = vec4(0,0,0,1);                          // make a vec4 with black   
  	}else{
  		gl_FragColor = vec4(1,1,1,1);                          // make a vec4 with white  
  	}
}