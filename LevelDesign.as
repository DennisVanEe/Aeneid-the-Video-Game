void initialize()
{
	
}

void step( uint16 milliseconds )
{
	
}

class world
{
	private array< StaticEntity@ > setobj;
	private array< AnimatedEntity@ > movingobj;
	private int layer;

	world( uint x )
	{
		layer = x
	}

	void add( AnimatedEntity@ x, uint relativelayer, String name )
	{
		movingobj.insert( x );
		addEntityToRender( relativelayer + layer, x, name );
	}

	void add( StaticEntity@ x, uint relativelayer, String name )
	{
		setobj.insert( x );
		addEntityToRender( relativelayer + layer, x, name );
	}
}