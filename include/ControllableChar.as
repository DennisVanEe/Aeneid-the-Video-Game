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

	// Default Constructor
	ControllableChar () {
		ControllableChar ( 0, 0, 0 );
	}

	// Constructor with default base values
	ControllableChar ( int x, int y, double angle ) {
		ControllableChar ( 100, 100, 100, 100, 0, x, y, angle, 100 );
	}

	// Constructor with custom values for everything
	ControllableChar ( int mH, int cH, int cS, int mS, int p, int x, int y, double angle, double walk ) {
		mHealth = mH;
		cHealth = cH;
		cStamina = cS;
		mStamina = mS;
		piety = p;
		pos = new CharPosition ( x, y, angle );
		walkSpeed = walk;
	}

	// Tells Aeneas to follow a certain AI Character
	void follow ( AIChar aic ) {
		CharPosition@ rPos = aic.getPos();

		int yDif = pos.y - rPos.y;
		int xDif = pos.x - rPos.x;

		double angle = Math.atan( ( (float) yDif ) / xDif );
		float distance = Math.sqrt( yDif*yDif + xDif*xDif );

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
		int xMouse = getXPosMouse();
		int yMouse = getYPosMouse();

		int yDif = pos.getY() - yMouse;
		int xDif = pos.getX() - xMouse;

		pos.angle = Math.atan( ( (float) yDif ) / xDif );
	}

	// Tell Aeneas to move in a certain direction based on W, A, S, D or a combo of that
	void move( uint16 milliseconds ) {
		// Play movement animations
		// Shift position of character
		double angle = pos.angle;
		int displacement = (int) walkSpeed * milliseconds / 1000;
		int x = displacement * Math.acos(angle);
		int y = displacement * Math.asin(angle);

		Aeneas.updatePos( pos.x + x, pos.y + y, angle );
 	}

	// Checks for inputs
	// if-statements must be listed in order of priority
	void checkInputs( uint16 milliseconds ) {
		if( isKeyPressed( W ) || isKeyPressed( A ) || isKeyPressed( S ) || isKeyPressed( D ) )
			move( milliseconds );
		// If clicking on NPC
		// Make sure that mouse is on NPC
		if ( isButtonPressed( Left ) && ifMouseOnNPC() ) {
			// See who to talk to who
			AIChar aic = new AIChar();
			talk( aic );
		}
		if( isButtonPressed( Left ) )
			attack();
	}
	
	bool ifMouseOnNPC( Character character) {
		intersect( character.getEntity(), getXPosMouse, getYPosMouse );
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

	}
	
	// Returns a reference to the position of Aeneas
	const CharPosition@ getPos() {
		CharPosition@ refPos = pos;

		if (refPos != null ) {  return refPos;  }
			return CharPosition( 0, 0, 0 );
	}
	
	void saveRequestValues() {
		addRequest("aeneas", Request("aeneasCH", 0, WRITE_DATA, "cH", cHealth) );
		addRequest("aeneas", Request("aeneasMH", 0, WRITE_DATA, "mH", mHealth) );
		addRequest("aeneas", Request("aeneasCS", 0, WRITE_DATA, "cS", cStamina) );
		addRequest("aeneas", Request("aeneasMS", 0, WRITE_DATA, "mS", mStamina) );
		addRequest("aeneas", Request("aeneasPiety", 0, WRITE_DATA, "piety", piety) );
		addRequest("aeneas", Request("aeneasPosX", 0, WRITE_DATA, "posX", pos.x) );
		addRequest("aeneas", Request("aeneasPosY", 0, WRITE_DATA, "posY", pos.y) );
		addRequest("aeneas", Request("aeneasPosAngle", 0, WRITE_DATA, "posAngle", pos.angle) );
		addRequest("aeneas", Request("aeneasWalkSpeed", 0, WRITE_DATA, "walkSpeed", walkSpeed) );
	}
}


