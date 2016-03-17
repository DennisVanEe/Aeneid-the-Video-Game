// Name: World.as
// Author(s):
// version 0.1
// --------------------------------------
// These classes are used to define the 
// world the other assets will be in
#include "Aeneas.as"  

class World
{
	array< ee::StaticEntity > setobj; 
	array< ee::AnimatedEntity > movingobj;
	private int layer;

	World( uint x )
	{
		ee::consolePrintLine( "Constructor for World. Sets the base layer for World." );
		layer = 1000;
	}

	void add( ee::AnimatedEntity x, uint relativelayer, string name )
	{
		ee::consolePrintLine( "Adds animated entity to movingobj array. Adds object to render at layer input relative to the World Layer." );
		movingobj.insert( relativelayer, x, name ); //no matching signatures with parameters (need movingobj.insert(int, ee::AnimatedEntity&, string&);
	}

	void add( ee::StaticEntity x, uint relativelayer, string name )
	{
		ee::consolePrintLine( "Adds static entity to movingobj array. Adds object to render at layer input relative to the World Layer." );
		setobj.insert( relativelayer, x, name ); //no matching signatures with parameters (need setobj.insert(int, ee::AnimatedEntity&, string&);
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
		checkpointpos = new CharPosition( 0, 0, 0 );
	}
	
	void step()
	{
		CharPosition aeneaspos = getPosition();
		float xdif = abs( aeneaspos.x - checkpointpos.x );
		float ydif = abs( aeneaspos.y - checkpointpos.y );
		float difference = pow( xdif, 2 ) + pow( ydif, 2 );
		float radius = 2500;
		if( difference < radius ) {
			ee::writeToDataCont( "Aeneas", "cHealth", getCHealth() );
			ee::writeToDataCont( "Aeneas", "mHealth", getMHealth() );
			ee::writeToDataCont( "Aeneas", "walkSpeed", getWalkSpeed() );
			ee::writeToDataCont( "Aeneas", "piety", getPiety() );
			ee::writeToDataCont( "Aeneas", "carryWeight", getCarryWeight() );
			ee::writeToDataCont( "Aeneas", "maxCarryWeight", getMaxCarryWeight() );
			ee::writeToDataCont( "Aeneas", "rotationSpeed", getRotationSpeed() );
			ee::writeToDataCont( "Aeneas", "invincibility", getInvincible() );
			ee::writeToDataCont( "Aeneas", "isItHostile", isHostile() ); 
			ee::writeToDataCont( "Aeneas", "x", aeneaspos.getX() );
			ee::writeToDataCont( "Aeneas", "y", aeneaspos.getY() );
			ee::writeToDataCont( "Aeneas", "angle", aeneaspos.getAngle() );
		}
	}
}