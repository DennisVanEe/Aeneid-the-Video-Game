// Name: World.as
// Author(s):
// version 0.1
// --------------------------------------
// These classes are used to define the 
// world the other assets will be in
#include "Aeneas.as"

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
	private CharPosition checkpointpos; 
	
	Checkpoint( int x, int y, ee::StaticEntity check )
	{
		consolePrintLine( "Creates position for the Checkpoint." );
		checkpoint = check;
		heckpointpos = new CharPosition( x, y, 0 );
	}
	
	void step()
	{
		consolePrintLine( "Requests for Character position and angle." );
		CharPosition aeneaspos = getPosition();
		if( aeneaspos.x == checkpointpos.x && aeneaspos.y == checkpointpos.y ) {
			ee::writeToDataCont( "Aeneas", "CharStats",  )
		}
	}
}