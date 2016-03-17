// Name: World.as
// Author(s):
// version 0.1
// --------------------------------------
// These classes are used to define the 
// world the other assets will be in
#include "Aeneas.as"  
import bool saveAIChars() from "TrojanGreek.as"

class World
{
	dictionary< ee::StaticEntity > setobj; 
	dictionary< ee::AnimatedEntity > movingobj;
	private int layer;

	World()
	{
		ee::consolePrintLine( "Constructor for World. Sets the base layer for World." );
		layer = 1000;
	}

	void add( ee::AnimatedEntity x, string name ) 
	{
		ee::consolePrintLine( "Adds animated entity to movingobj array. Adds object to render at layer input relative to the World Layer." );
		movingobj.set( name, x );
	}

	void add( ee::StaticEntity x, string name )
	{
		ee::consolePrintLine( "Adds static entity to movingobj array. Adds object to render at layer input relative to the World Layer." );
		setobj.set( name, x );
	}

	ee::StaticEntity getStaticEntity( string contName, string entName ) {
		return ee::StaticEntity( contName, entName );
	}

	ee::AnimatedEntity getAnimatedEntity( string contName, string entName ) {
		return ee::AnimatedEntity( contName, entName );
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
		checkpoint = check;;
	}
	
	void step(uint32 milliseconds)
	{
		CharPosition aeneaspos = getAeneasPos();
		float xdif = abs( aeneaspos.getX() - checkpoint.getPosX() );
		float ydif = abs( aeneaspos.getY() - checkpoint.getPosY() );
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
			ee::writeToDataCont( "Aeneas", "invincibility", isInvincible() ); 
			ee::writeToDataCont( "Aeneas", "isItHostile", isHostile() );
			ee::writeToDataCont( "Aeneas", "x", aeneaspos.getX() );
			ee::writeToDataCont( "Aeneas", "y", aeneaspos.getY() );
			ee::writeToDataCont( "Aeneas", "angle", aeneaspos.getAngle() );
			saveAIChars();
		}
	}
}