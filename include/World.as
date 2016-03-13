// Name: World.as
// Author(s):
// version 0.1
// --------------------------------------
// These classes are used to define the 
// world the other assets will be in


class World
{
	private array< ee::StaticEntity@ > setobj;  //OBJECT HANDLES NOT SUPPORTED FOR ee::Static and ee::AnimatedEntity
	private array< ee::AnimatedEntity@ > movingobj;
	private int layer;

	World( uint x )
	{
		consolePrintLine( "Constructor for World. Sets the base layer for World." );
		layer = x;
	}

	void add( ee::AnimatedEntity@ x, uint relativelayer, string name )
	{        //object handle not supported for ee::AnimatedEntity
		ee::consolePrintln( "Adds animated entity to movingobj array. Adds object to render at layer input relative to the World Layer." );
		movingobj.insert( x ); //no matching signatures with parameters (need movingObj.insert(int, ee::AnimatedEntity&, string&)
		addEntityToRender( relativelayer + layer, x, name ); //no matching signature
	}
}

class Checkpoint
{
	private ee::StaticEntity@ checkpoint; //object handles not supported for this type
	private ee::CharPosition@ position; //same as above
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