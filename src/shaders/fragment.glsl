uniform vec2 u_resolution;  // Canvas size (width,height)
uniform vec2 u_mouse;       // mouse position in screen pixels
uniform float u_time;       // Time in seconds since load

varying vec2 vUv;
varying vec3 vNormal;

void main() {
  float diff = dot(vec3(1.0), vNormal);

  float fresnel = abs(dot(cameraPosition, vNormal));
  fresnel = fresnel * fresnel * fresnel;

  gl_FragColor = vec4(vUv, 0.0, 1.0);
  gl_FragColor = vec4(vNormal, 1.0);
  vec4 color = vec4(abs(sin(diff * 8.0 + u_time)), - vNormal.y, abs(sin(diff * 5.0 + u_time)), 1.0);
  gl_FragColor = vec4( color.x, color.y, color.z + 1.0 - abs(sin(color.z *fresnel / 1000.0)), 1.0);
}