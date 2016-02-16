
class Cluster
{
	
	public array<StaticEntity@> s_entarray;
	public array<AnimatedEntity@> a_entarray;
	public Vector origin;
	
	Cluster()
	{
		x = new array<StaticEntity@>();
		y = new array<AnimatedEntity@>();
		origin = new Vector(0,0);
	}
	
	Cluster(int x, int y)
	{
		x = new array<StaticEntity@>();
		y = new array<AnimatedEntity@>();
		origin = new Vector(x,y);
	}
	
	void addAnimatedEntity(AnimatedEntity@ ent)
	{
		y.insert(ent);
	}
	
	void addStaticEntity(StaticEntity@ ent)
	{
		x.insert(ent);
	}
	
	void moveAll(int xx, int yy)
	{
		for(int i = 0; i<x.size(); i++)
		{
			x[i].setPositionX(x[i].getPositionX(),x[i].getPositionX() + xx);
		}
		
		for(int z = 0; z<y.size(); z++)
		{
			y[z].setPositionX(y[z].getPositionY,y[z].getPositionY + yy);
		}
	}
	
	void rotateAll(int degrees)
	{
		for(int i = 0; i<x.size(); i++) //(x,y) --> (u,v) = (r, (theta)) --> (xcos(theta) - ysin(theta), ycos(theta) + xsin(theta)))
		{
			x[i].setOrigin((x[i].getOriginX() * Math.cos(Math.radians(degrees)) - x[i].getOriginY() * Math.sin(Math.radians(degrees)), x[i].getOriginY() * Math.cos(Math.radians(degrees)) + x[i].getOriginX() * Math.sin(Math.radians(degrees)));
			x[i].rotate(degrees);
		}
		
		for(int z = 0; z<y.size(); z++)
		{
			y[z].setOrigin((y[z].getOriginX() * Math.cos(Math.radians(degrees)) - y[z].getOriginY() * Math.sin(Math.radians(degrees)), y[z].getOriginY() * Math.cos(Math.radians(degrees)) + y[z].getOriginX() * Math.sin(Math.radians(degrees)));
			y[z].rotate(degrees);
		}
	}
	
	
	
}