// Name: Vector.as
// Author(s):
// version 0.1
// --------------------------------------
// This class defines an object that is a 
// vector. Great for math and position

class Vector
{
	int x, y;
	
	Vector()
	{
		this(0,0);
	}
	
	Vector(int a, int b)
	{
		x = a;
		y = b;
	}
	
	void opAdd(const vector@ other)
	{
		x += other.x;
		y += other.y;
	}
}