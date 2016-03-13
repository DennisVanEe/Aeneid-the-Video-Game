// Name: ControllableChar.as
// Author(s): Jason Wang
// version 0.1
// --------------------------------------
// This class defines the Movable base
// class, which is used to determine
// positions of various characters and
// objects.

class Movable {
	protected CharPosition pos;
	
	Movable() {
		Movable (0, 0, 0);
	}

	Movable( int x, int y, double a) {
		pos = CharPosition( x, y, a );
	}

	CharPosition @ getPos() {
		return pos;
	}

	void setPos( int x, int y, double a ) {
		pos.x = x;
		pos.y = y;
		pos.angle = a;
	}

	// Used to make sure engine does not try to render Entity
	// multiple times in same frame. Called during step in
	// order to only render entity once per step.
	void update() {
	//must implement
	}
}

class CharPosition {
    int x; 
	int y; 
	double angle; // measured in degrees (circle)

	CharPosition() {
	 	CharPosition(0,0,0);
	}
	
	CharPosition ( int iX, int iY, double ang ) {
		x = iX;
		y = iY;
		angle = ang; // determined by tan-1()
	}
	
	int getX() {
		return x;
	}
	
	int getY() {
	return y;
	}
	
	double getAngle() {
	return angle;
	}
	
	void setAngle(double x) {
	angle = x;
	}
	
	void setX(int ix)
	{
	x = ix;
	}
	
	void setY(int iy)
	{
	y = iy;
	}

	double getRadians() {
		return angle / 180 * 3.14159;
	}

	updateCharPosition( int iX, int iY, double ang ){
		x = iX;
		y = iY;
		angle = ang;
	}
}