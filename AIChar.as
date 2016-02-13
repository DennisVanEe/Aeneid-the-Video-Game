
#include "NPCInterface.as";

class AIChar : NPC {
	private int cHealth;
	private int mHealth;
	private CharPosition pos;
	private double walkSpeed;

	AIChar ( int mH, int cH, int x, int y, double angle, double walk ) {
		cHealth = cH;
		mHealth = mH;
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

	void attack() {

	}

	void talk() {

	}
}