varying vec2 vUv;
varying vec3 vNormal;

uniform float u_time;

void main() {
  vec3 newPosition = position;
  vUv = uv;
  vNormal = normal;

  float x = newPosition.x;

  float amplitude = 1.7;
  float frequency = 1.;
  float y = sin(x * frequency + u_time / 10.0);
  // float t = 0.01*(-u_time);
  // y += sin(x*frequency*2.1 + t)*0.5;
  // y += sin(x*frequency*1.72 + t*0.121)*1.0;
  // y += sin(x*frequency*2.221 + t*0.437)*1.0;
  // y += sin(x*frequency*3.1122+ t*3.269)*1.5;
  // y *= amplitude;

  gl_Position = projectionMatrix * modelViewMatrix * vec4( newPosition.x, newPosition.y + y, newPosition.z + y, 1.0 );
}