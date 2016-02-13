
// NOTES:
// Add on "/sdk/add_on/scriptmath" for complex math functions
// Implement step function for Aeneas module
// Implement animation switch with master sprite sheet
// Implement damage calculations and health reduction as well as stamina reduction
// Implement position change and angle change (preferably through updatePos() function)
// Find out what the hell we need to do

interface NPC {
	private int cHealth;
	private int mHealth;
	private CharPosition pos;

	void follow ();

	void rotate ();

	void setRotation ();

	CharPosition@ getPos();

	void move();
}

// ----------------------------------------------------------------------------------------------------------------------

class Aeneas implements NPC {
	private int cHealth;
	private int mHealth;
	private int cStamina;
	private int mStamina;
	private int piety;
	private CharPosition pos;
	private double walkSpeed;

	Aeneas () {
		Aeneas ( 0, 0, 0 );
	}

	Aeneas ( int x, int y, double angle ) {
		Aeneas ( 100, 100, 100, 100, 0, x, y, angle, 100 );
	}

	Aeneas ( int mH, int cH, int cS, int mS, int p, int x, int y, double angle, double walk ) {
		mHealth = mH;
		cHealth = cH;
		cStamina = cS;
		mStamina = mS;
		piety = p;
		pos = new CharPosition ( x, y, angle );
		walkSpeed = walk;
	}

	// Implemented function
	void follow ( AIChar aic ) {
		CharPosition@ rPos = aic.getPos();

		int yDif = os.getY() - rPos.getY();
		int xDif = pos.getX() - rPos.getX();

		double angle = Math.atan( ( (float) yDif ) / xDif );
		float distance = Math.sqrt( yDif*yDif + xDif*xDif );

		// TODO: Update positions
		// TODO: Finish follow method
	}

	void updatePos( int iX, int iY, double ang ) {
		pos.setX( iX );
		pos.setY( iY );
		pos.setAngle( ang );
	}

	// Implemented function
	void rotate () {

	}

	// Implemented function
	void setRotation () {

	}

	// Implemented function
	const CharPosition@ getPos() {
		CharPosition@ refPos = pos;

		if (refPos != null ) {
			return refPos;
		}
		return CharPosition( 0, 0, 0 );
	}

	// Implemented function
	void move() {
		
	}
}

// ----------------------------------------------------------------------------------------------------------------------

class CharPosition() {
	public int x;
	public int y;
	public double angle; // measured in degrees (circle)

	CharPosition ( int iX, int iY, double ang ) {
		x = iX;
		y = iY;
		angle = ang; // determined by tan-1()
	}
}

// ----------------------------------------------------------------------------------------------------------------------

void initialize () {
	// Retrieve data from the save files and figure out what to do from there
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
}


