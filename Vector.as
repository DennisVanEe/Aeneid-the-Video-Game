class Vector
{
	public int x, y;
	
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