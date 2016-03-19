// Name: World.as
// Author(s):
// version 0.1
// --------------------------------------
// These classes are used to define the 
// world the other assets will be in
import bool saveAIChars() from "TrojanGreek.as";
import bool saveCitizens() from "Citizen.as";
import bool requestSaveData() from "Aeneas.as";

#include "Movable.as"

class World
{
	array< ee::StaticEntity > setobj; // Expecting method, instead receives identifier
	array< ee::AnimatedEntity > movingobj; // Expecting method, instead receives identifier
	private int layer;
	Checkpoint checkpoint;
	string name;

	World( string name )
	{
		bool checkPointUsed;
		int x;
		checkPointUsed = ee::readFromDataCont( name, "checkPointUsed", x );
		ee::consolePrintln( "Constructor for World. Sets the base layer for World." );
		layer = 1000;
		setName( name );

		setupCheckpoint( 0, 0 ); // Temporary placeholder until setupCheckpoint is called again to make actual checkpoint
		checkpoint.setCheckPointUsed( checkPointUsed );
	}

	void add( ee::AnimatedEntity x, string name ) 
	{
		ee::consolePrintln( "Adds animated entity to movingobj array. Adds object to render at layer input relative to the World Layer." );
		movingobj.insertLast( x );
	}

	void add( ee::StaticEntity x, string name )
	{
		ee::consolePrintln( "Adds static entity to movingobj array. Adds object to render at layer input relative to the World Layer." );
		setobj.insertLast( x );
	}

	void setName( string n ) {
		name = n;
	}

	string getName() {
		return name;
	}

	ee::StaticEntity getStaticEntity( string contName, string entName ) {
		return ee::StaticEntity( contName, entName );
	}

	ee::AnimatedEntity getAnimatedEntity( string contName, string entName ) {
		return ee::AnimatedEntity( contName, entName );
	}

	bool isCompleted( int x, int y ) {
		CharPosition aeneaspos = getAeneasPos();
		float xdif = abs( aeneaspos.getX() - x );
		float ydif = abs( aeneaspos.getY() - y );
		float difference = pow( xdif, 2 ) + pow( ydif, 2 );
		float radius = 2500;
		if( difference < radius && !checkPointUsed ) {
			return true;
		}
	}

	void setupCheckpoint( int x, int y ) {
		// DO NOT SET COLLIDEABLE
		ee::StaticEntity e = StaticEntity( "HUD", "health" ); // setCollideable( true );
		e.setVisible( false );
		checkpoint = Checkpoint( x, y, e );
	}

	void setupExitPoint( int x, int y ) {
		// DO NOT SET COLLIDEABLE
		ee::StaticEntity e = StaticEntity( "HUD", "health" ); // setCollideable( true );
		e.setVisible( false );
		checkpoint = Checkpoint( x, y, e, true );
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
	private ee::StaticEntity checkp;
	private CharPosition checkpoint;
	bool checkPointUsed;

	bool isExitPoint;

	Checkpoint() {
		checkPointUsed = false;

		isExitPoint = false;
	}
	
	Checkpoint( int x, int y, ee::StaticEntity check )
	{
		ee::consolePrintln( "Creates position for the Checkpoint." );
		checkp = check;

		checkPointUsed = false;
		isExitPoint = false;
	}

	Checkpoint( int x, int y, ee::StaticEntity check, bool b )
	{
		checkp = check;

		isExitPoint = b;
	}

	void setCheckPointUsed( bool cpu ) {
		checkPointUsed = cpu;
	}
	
	void step(string name, uint32 milliseconds)
	{
		if( isExitPoint )
			stepForExitPoint();
		CharPosition aeneaspos = getAeneasPos();
		float xdif = abs( aeneaspos.getX() - checkpoint.getX() );
		float ydif = abs( aeneaspos.getY() - checkpoint.getY() );
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

	void stepForExitPoint() {
		CharPosition aeneaspos = getAeneasPos();
		float xdif = abs( aeneaspos.getX() - checkpoint.getX() );
		float ydif = abs( aeneaspos.getY() - checkpoint.getY() );
		float difference = pow( xdif, 2 ) + pow( ydif, 2 );
		float radius = 2500;
		if( difference < radius ) {
			
		}
	}


}



