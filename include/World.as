// Name: World.as
// Author(s):
// version 0.1
// --------------------------------------
// These classes are used to define the 
// world the other assets will be in

class World
{
	private array< StaticEntity@ > setobj;
	private array< AnimatedEntity@ > movingobj;
	private int layer;

	World( uint x )
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

class Checkpoint
{
	private StaticEntity@ checkpoint;
	private array< int > arr;
	private CharPosition@ position;
	private double speed;
	
	Checkpoint( int x, int y )
	{
		CharPosition checkpointpos = new CharPosition( x, y, 0 );
	}
	
	void save( Aeneas character )
	{
		arr = character.getSaveValues();
		position = character.getPos();
		speed = character.getSpeed();
	}
}