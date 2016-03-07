// Name: ControllableChar.as
// Author(s):
// version 0.1
// --------------------------------------
// This class defines an entity that can be
// controlled by the user through system 
// inputs

#include "Character.as"

class ControllableChar : Character {
	private int cHealth; // Current Health
	private int mHealth; // Maximum Health
	private int cStamina; // Current Stamina
	private int mStamina; // Maximum Stamina
	private int piety; // Piety points
	private CharPosition pos; // Position
	private double walkSpeed; // Walk speed
	private int damage;

	// Default Constructor
	ControllableChar () {
		ControllableChar ( 0, 0, 0 );
	}

	// Constructor with default base values
	ControllableChar ( int x, int y, double angle ) {
		ControllableChar ( 100, 100, 100, 100, 0, x, y, angle, 100, 50 );
	}

	// Constructor with custom values for everything
	ControllableChar ( int mH, int cH, int cS, int mS, int p, int x, int y, double angle, double walk, int dmg ) {
		mHealth = mH;
		cHealth = cH;
		cStamina = cS;
		mStamina = mS;
		piety = p;
		pos = new CharPosition ( x, y, angle );
		walkSpeed = walk;
		damage = dmg;
	}

	// Tells Aeneas to follow a certain AI Character
	void follow ( AIChar aic ) {
		CharPosition@ rPos = aic.getPos();

		int yDif = pos.y - rPos.y;
		int xDif = pos.x - rPos.x;

		double angle = atan( ( (float) yDif ) / xDif ); // NOTE: PLEASE DO THIS
		if( xDif < 0 )
			angle += 180;

		float distance = sqrt( yDif*yDif + xDif*xDif );

		move();

		// TODO: Update positions
		// TODO: Finish follow method
	}

	// Tells Aeneas to update the position using x, y and angle values
	void updatePos( int iX, int iY, double ang ) {
		pos.setX( iX );
		pos.setY( iY );
		pos.setAngle( ang );
	}

	// Rotates Aeneas to follow the Mouse
	void setRotation () {
		int yDif = pos.getY() - ee::getYPosMouse;
		int xDif = pos.getX() - ee::getXPosMouse;

		pos.angle = atan( ( (float) yDif ) / xDif );
		if( xDif < 0 )
			angle += 180;
	}

	// Tell Aeneas to move in a certain direction based on W, A, S, D or a combo of that
	void move( uint16 milliseconds ) {
		// Play movement animations
		// Shift position of character
		int displacement = (int) walkSpeed * milliseconds / 1000;
		int x = displacement * acos(pos.angle);
		int y = displacement * asin(pos.angle);

		Aeneas.updatePos( pos.x + x, pos.y + y, pos.angle );
 	}

	// Checks for inputs
	// if-statements must be listed in order of priority
	void checkInputs( uint16 milliseconds ) {
		// If clicking on NPC
		// Make sure that mouse is on NPC
		array npcArray = readFromDataCont( "npcList", "npcArray" ); // NOTE: Ask Dennis
		if ( ee::isButtonPressed( Left ) ) {
			for( AIChar aic : npcArray ) {
				if( ifMouseOnNPC( aic ) ) {
					if( aic.isHostile() )
						attack( damage, aic );
					else
						talk( aic );
				}
			}
		}
		if( ee::isKeyPressed( W ) || ee::isKeyPressed( A ) || ee::isKeyPressed( S ) || ee::isKeyPressed( D ) )
			move( milliseconds );
	}
	
	bool ifMouseOnNPC( AIChar character ) {
		ee::intersect( character.getEntity(), ee::getXPosMouse, ee::getYPosMouse ); // NOTE: Must get Entity for character
 	}

	// Tell Aeneas to attack the AI Character, with a certain amount of damage
	void attack( int damage, AIChar@ aic ) {
		// Check to see if AI Character is in front of Aeneas
		aic.changeHealth( damage );
	}

	// Aeneas initiate conversation with a certain AI Character
	void talk( AIChar aic ) {
		// Do stuff with AIChar
	}

	// cHealth of the NPC is changed to changedTo. If cHealth is 0, the NPC dies
	void changeHealth( int difference ) {
		cHealth -= difference;
		if( cHealth <= 0 ) {
			die();
		}
	}

	// A function for when Aeneas dies
	void die() {
		// NOTE: Add something for when Aeneas dies
	}
	
	// Returns a reference to the position of Aeneas
	const CharPosition@ getPos() {
		CharPosition@ refPos = pos;

		if (refPos != null ) {  return refPos;  }
		ee::consolePrintLine( "ERROR: Aeneas Position is null." );
		return CharPosition( 0, 0, 0 );
	}
	
	void saveRequestValues() {
		// ee:writeToDataCont( "dataContName", "variableName", variable );
		ee::writeToDataCont( "aeneas", "cH", cHealth );
		ee::writeToDataCont( "aeneas", "mH", mHealth );
		ee::writeToDataCont( "aeneas", "cS", cStamina );
		ee::writeToDataCont( "aeneas", "mS", mStamina );
		ee::writeToDataCont( "aeneas", "piety", piety );
		ee::writeToDataCont( "aeneas", "posX", pos.x );
		ee::writeToDataCont( "aeneas", "posY", pos.y );
		ee::writeToDataCont( "aeneas", "posAngle", pos.angle );
		ee::writeToDataCont( "aeneas", "walkSpeed", walkSpeed );
		ee::writeToDataCont( "aeneas", "damage", damage );
	}
}


