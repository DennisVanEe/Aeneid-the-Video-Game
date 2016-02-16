
class Cluster
{
	
	public array<StaticEntity@> s_entarray;
	public array<AnimatedEntity@> a_entarray;
	public Vector origin;
	
	Cluster()
	{
		s_entarray = new array<StaticEntity@>();
		a_entarray = new array<AnimatedEntity@>();
		origin = new Vector(0,0);
	}
	
	Cluster(int x, int y)
	{
		s_entarray = new array<StaticEntity@>();
		a_entarray = new array<AnimatedEntity@>();
		origin = new Vector(x,y);
	}
	
	void addAnimatedEntity(AnimatedEntity@ ent)
	{
		a_entarray.insert(ent);
	}
	
	void addStaticEntity(StaticEntity@ ent)
	{
		s_entarray.insert(ent);
	}
	
	void moveAll(int xx, int yy)
	{
		for(int i = 0; i<x.size(); i++)
		{
			s_entarray[i].setPositionX( s_entarray[i].getPositionX(), s_entarray[i].getPositionX() + xx );
		}
		
		for(int z = 0; z<y.size(); z++)
		{
			a_entarray[z].setPositionX( a_entarray[z].getPositionY, a_entarray[z].getPositionY + yy );
		}
	}
	
	void rotateAll(int degrees)
	{
		for(int i = 0; i < s_entarray.size(); i++) //(x,y) --> (u,v) = (r, (theta)) --> (xcos(theta) - ysin(theta), ycos(theta) + xsin(theta)))
		{
			s_entarray[i].setOrigin((s_entarray[i].getOriginX() * Math.cos(Math.toRadians(degrees)) - s_entarray[i].getOriginY() * Math.sin(Math.toRadians(degrees)), s_entarray[i].getOriginY() * Math.cos(Math.toRadians(degrees)) + s_entarray[i].getOriginX() * Math.sin(Math.toRadians(degrees)));
			s_entarray[i].rotate(degrees);
		}
		
		for(int z = 0; z<y.size(); z++)
		{
			y[z].setOrigin((y[z].getOriginX() * Math.cos(Math.toRadians(degrees)) - y[z].getOriginY() * Math.sin(Math.toRadians(degrees)), y[z].getOriginY() * Math.cos(Math.toRadians(degrees)) + y[z].getOriginX() * Math.sin(Math.toRadians(degrees)));
			y[z].rotate(degrees);
		}
	}
	
	
	
}