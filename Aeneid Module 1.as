
// NOTES:
// Add on "/sdk/add_on/scriptmath" for complex math functions
// Implement step function for Aeneas module
// Implement animation switch with master sprite sheet
// Implement damage calculations and health reduction as well as stamina reduction
// Implement position change and angle change (preferably through updatePos() function)
// Find out what the hell we need to do

#include "AIChar.as";
#include "NPCInterface.as";

class Aeneas {
	private int cHealth; // Current Health
	private int mHealth; // Maximum Health
	private int cStamina; // Current Stamina
	private int mStamina; // Maximum Stamina
	private int piety; // Piety points
	private CharPosition pos; // Position
	private double walkSpeed; // Walk speed

	// Default Constructor
	Aeneas () {
		Aeneas ( 0, 0, 0 );
	}

	// Constructor with default base values
	Aeneas ( int x, int y, double angle ) {
		Aeneas ( 100, 100, 100, 100, 0, x, y, angle, 100 );
	}

	// Constructor with custom values for everything
	Aeneas ( int mH, int cH, int cS, int mS, int p, int x, int y, double angle, double walk ) {
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

		int yDif = pos.getY() - rPos.getY();
		int xDif = pos.getX() - rPos.getX();

		double angle = Math.atan( ( (float) yDif ) / xDif );
		float distance = Math.sqrt( yDif*yDif + xDif*xDif );

		// Call move function

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

	// Returns a reference to the position of Aeneas
	const CharPosition@ getPos() {
		CharPosition@ refPos = pos;

		if (refPos != null ) {  return refPos;  }
		return CharPosition( 0, 0, 0 );
	}

	// Tell Aeneas to move in a certain direction based on W, A, S, D or a combo of that
	void move() {
		
	}

	// Checks for inputs
	// if-statements must be listed in order of priority
	void checkInputs() {
		if( isKeyPressed( W ) || isKeyPressed( A ) || isKeyPressed( S ) || isKeyPressed( D ) )
			move();
		// If clicking on NPC
		if ( isButtonPressed( Left ) && mouseOnNPC ) { // Make sure that mouse is on NPC
			// See who to talk to who
			AIChar aic = new AIChar();
			talk( aic );
		}
		if( isButtonPressed( Left ) )
			attack();
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
}

// ----------------------------------------------------------------------------------------------------------------------

void initialize () {
	// Retrieve data from the save files and figure out what to do from there
	boolean thereIsASaveGame = false; // Change this
	if( thereIsASaveGame ) {
		// Then retrieve the Aeneas object saved
	} else {
		Aeneas aeneas = new Aeneas();
	}

	// Finish this
}

// ----------------------------------------------------------------------------------------------------------------------

void step ( uint16 milliseconds ) {
	// Update health, stamina, piety points
	// Update position
	// Update directionality
	// Update state (attack, walking, etc.)
	// Update animation
	// Update armor, weapons
	// Interact with picking up weapons

	Aeneas.setRotation();
	Aeneas.checkInputs();
}


