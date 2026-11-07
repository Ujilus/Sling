shader_type canvas_item;

uniform sampler2D screen_texture:hint_screen_texture,repeat_disable,filter_nearest;

float round_from_to(float from, float to){
	return round(from * to) / to;
}
void fragment() {
	vec3 color = texture(screen_texture,SCREEN_UV).rgb;
	color.r = round_from_to(color.r,16.0);
	color.g = round_from_to(color.r,16.0);
	color.b = round_from_to(color.b,16.0);
	COLOR.rgb = color;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
