// Name: World.as
// Author(s):
// version 0.1
// --------------------------------------
// These classes are used to define the 
// world the other assets will be in


class World
{
	private array< ee::StaticEntity > setobj; 
	private array< ee::AnimatedEntity > movingobj;
	private int layer;

	World( uint x )
	{
		consolePrintLine( "Constructor for World. Sets the base layer for World." );
		layer = x;
	}

	void add( ee::AnimatedEntity x, uint relativelayer, string name )
	{
		ee::consolePrintln( "Adds animated entity to movingobj array. Adds object to render at layer input relative to the World Layer." );
		movingobj.insert( relative layer, x, name ); //no matching signatures with parameters (need movingObj.insert(int, ee::AnimatedEntity&, string&)
	}
}

//checkpoint saves the character, and stuff, when the character runs over the checkpoint
class Checkpoint
{
	private ee::StaticEntity checkpoint; 
	private ee::CharPosition position;
	
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