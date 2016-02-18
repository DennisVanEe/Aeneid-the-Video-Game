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

	// Implemented function
	// Tells Aeneas to follow a certain AI Character
	void follow ( AIChar aic ) {
		CharPosition@ rPos = aic.getPos();

		int yDif = pos.getY() - rPos.getY();
		int xDif = pos.getX() - rPos.getX();

		double angle = Math.atan( ( (float) yDif ) / xDif );
		float distance = Math.sqrt( yDif*yDif + xDif*xDif );

		// TODO: Update positions
		// TODO: Finish follow method
	}

	// Tells Aeneas to update the position using x, y and angle values
	void updatePos( int iX, int iY, double ang ) {
		pos.setX( iX );
		pos.setY( iY );
		pos.setAngle( ang );
	}

	// Implemented function
	// Rotates Aeneas to follow the Mouse
	void setRotation () {
		int xMouse = getXPosMouse();
		int yMouse = getYPosMouse();

		int yDif = pos.getY() - yMouse;
		int xDif = pos.getX() - xMouse;

		pos.angle = Math.atan( ( (float) yDif ) / xDif );
	}

	// Implemented function
	// Returns a reference to the position of Aeneas
	const CharPosition@ getPos() {
		CharPosition@ refPos = pos;

		if (refPos != null ) {  return refPos;  }
		return CharPosition( 0, 0, 0 );
	}

	// Implemented function
	// Tell Aeneas to move in a certain direction based on W, A, S, D or a combo of that
	void move() {
		
	}

	void attack() {

	}

	void talk() {

	}
}


