void initialize()
{
	
}

void step( uint16 milliseconds )
{
	
}
 
#include "NPCInterface.as";

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