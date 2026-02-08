shader_type canvas_item;

uniform float speed = 1.0;
uniform float red = 1.0;
uniform float green = 1.0;
uniform float blue = 1.0;
uniform float alpha = 1.0;

void fragment() {
    COLOR = texture(TEXTURE, UV) * vec4(red, green, blue, alpha);
}

void vertex() {
	UV.x += TIME * speed;
	UV.y += TIME * speed;
}