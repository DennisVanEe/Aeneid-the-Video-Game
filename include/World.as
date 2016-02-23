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
		consolePrintLine( "Constructor for World. Sets the base layer for World." );
		layer = x
	}

	void add( AnimatedEntity@ x, uint relativelayer, String name )
	{
		consolePrintLine( "Adds animated entity to movingobj array. Adds object to render at layer input relative to the World Layer." );
		movingobj.insert( x );
		addEntityToRender( relativelayer + layer, x, name );
	}

	void add( StaticEntity@ x, uint relativelayer, String name )
	{
		consolePrintLine( "Adds static entity to setobj array. Adds object to render at layer input relative to the World layer. );
		setobj.insert( x );
		addEntityToRender( relativelayer + layer, x, name );
	}
}

class Checkpoint
{
	private StaticEntity@ checkpoint;
	private CharPosition@ position;
	private Request@ posX;
	private Request@ posY;
	private Request@ posAngle;
	
	Checkpoint( int x, int y )
	{
		consolePrintLine( "Creates position for the Checkpoint." );
		CharPosition checkpointpos = new CharPosition( x, y, 0 );
	}
	
	void save()
	{
		consolePrintLine( "Requests for Character position and angle." );
		posX = Request( 
	}
}