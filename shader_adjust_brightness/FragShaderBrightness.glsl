#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;                                           // this is the color comnig in
varying vec4 vertTexCoord;
uniform float param1;



void main() {
	vec4 thisPixColor = texture2D(texture, vertTexCoord.st);        // get the color of our pixel
	float newR= clamp(thisPixColor.r+param1,0,1);                   // add a value to each component R,G,B and make sure its 0-1
	float newG= clamp(thisPixColor.g+param1,0,1);                   // clamping is not needed cause the shader does it by default
	float newB= clamp(thisPixColor.b+param1,0,1);

  	gl_FragColor = vec4(newR,newG,newB,1);                          // make a vec4 with the new R,G,B ,A and set as the output   
}