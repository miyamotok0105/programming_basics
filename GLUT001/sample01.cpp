#include <OpenGL/gl.h>
#include <GLUT/glut.h>

//gcc sample01.cpp -o sample01.out -Wall -framework GLUT -framework OpenGL

void draw(void)
{
}

int main( int argc, char* argv[] )
{
  glutInit( &argc, argv );
  glutCreateWindow( argv[0] );
}
