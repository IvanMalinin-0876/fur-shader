uniform sampler2D hairMap;
uniform sampler2D colorMap;
uniform vec3 color;
uniform float offset;

varying vec3 vNormal;

varying vec2 vUv;

void main() {

	vec4 hairColor = texture2D(hairMap, vec2(vUv.s, vUv.t));
	vec4 col = texture2D(colorMap, vec2(vUv.s*0.2, vUv.t*0.2));

	// discard no hairs + above the max length
	if (hairColor.a <= 0.0 || hairColor.g < offset) {
		discard;
	}

	// darker towards bottom of the hair
	float shadow = mix(0.0,hairColor.b*1.2,offset);

	// light
	vec3 light = vec3(0.1,1.0,0.3);
	float d = pow(max(0.25,dot(vNormal.xyz, light))*2.75, 1.4);

	gl_FragColor = vec4(color*col.xyz*d*shadow, 1.1-offset);

}