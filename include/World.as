// Name: World.as
// Author(s):
// version 0.1
// --------------------------------------
// These classes are used to define the 
// world the other assets will be in
#include "Aeneas.as"  
import bool saveAIChars() from "TrojanGreek.as"
import bool saveCitizens() from "Citizen.as"
import bool requestSaveData() from "Aeneas.as"

class World
{
	dictionary< ee::StaticEntity > setobj; 
	dictionary< ee::AnimatedEntity > movingobj;
	private int layer;
	Checkpoint checkpoint;
	string name;

	World( string name )
	{
		bool checkPointUsed;
		try {
			checkPointUsed = ee::readFromDataCont( name, "checkPointUsed" );
		} catch {
			checkPointUsed = false;
		}
		ee::consolePrintLine( "Constructor for World. Sets the base layer for World." );
		layer = 1000;
		setName( name );

		setupCheckpoint( 0, 0 ); // Temporary placeholder until setupCheckpoint is called again to make actual checkpoint
		checkpoint.setCheckPointUsed( checkPointUsed );
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

	void setName( string n ) {
		name = n;
	}

	ee::StaticEntity getStaticEntity( string contName, string entName ) {
		return ee::StaticEntity( contName, entName );
	}

	ee::AnimatedEntity getAnimatedEntity( string contName, string entName ) {
		return ee::AnimatedEntity( contName, entName );
	}

	bool isCompleted() {
		// Implement this function, to return boolean when Aeneas is ready to progress to next World
	}

	void setupCheckpoint( int x, int y ) {
		checkpoint = Checkpoint( x, y, null );
	}

	void setCheckPointWasUsed( bool b ) {
		checkpoint.setCheckPointUsed( b );
	}

	void step( uint32 milliseconds ) {
		checkpoint.step( name, milliseconds );
	}
}

//checkpoint saves the character, and stuff, when the character runs over the checkpoint
// Assumes only one checkpoint in each World (at beginning of map)
class Checkpoint
{
	private ee::StaticEntity checkpoint;
	private CharPosition checkpoint;
	bool checkPointUsed;
	
	Checkpoint( int x, int y, ee::StaticEntity check )
	{
		consolePrintLine( "Creates position for the Checkpoint." );
		checkpoint = check;

		checkPointUsed = false;
	}

	void setCheckPointUsed( bool cpu ) {
		checkPointUsed = cpu;
	}
	
	void step(string name, uint32 milliseconds)
	{
		CharPosition aeneaspos = getAeneasPos();
		float xdif = abs( aeneaspos.getX() - checkpoint.getPosX() );
		float ydif = abs( aeneaspos.getY() - checkpoint.getPosY() );
		float difference = pow( xdif, 2 ) + pow( ydif, 2 );
		float radius = 2500;
		if( difference < radius && !checkPointUsed ) {
			requestSaveData();
			saveAIChars();
			saveCitizens();
			checkPointUsed = true;

			// Allows future saves to see that the checkpoint in world "name" has been used
			ee::writeToDataCont( name, "checkPointUsed", true );
		}
	}
}