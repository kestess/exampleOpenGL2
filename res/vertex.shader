#version 330 core
layout(location = 0) in vec3 position;
// layout(location = 1) in vec3 color;
layout(location = 2) in vec2 texCoord;

//out vec3 ourColor;
out vec2 TexCoord;

// uniform mat4 u_MVP;

// not sure about these, but will continue without checking
uniform mat4 model;      // location to camera
uniform mat4 view;       // 0 to 1
uniform mat4 projection; // view to pixel

void main()
{
    // gl_Position = u_MVP * vec4(position, 1.0);
    gl_Position = projection * view * model * vec4(position, 1.0);
    // ourColor = color;
    TexCoord = vec2(texCoord.x, 1.0 - texCoord.y);
}
