// Name: ControllableChar.as
// Author(s): Jason Wang
// version 0.1
// --------------------------------------
// This class defines the Movable base
// class, which is used to determine
// positions of various characters and
// objects.

shared class Movable {
	private CharPosition pos;
	
	Movable() {
		Movable (0, 0, 0);
	}

	Movable( int x, int y, double a) {
		pos = new CharPosition( x, y, a );
	}

	CharPosition getPos() {
		return pos;
	}

	void setPos( int x, int y, double a ) {
		pos.x = x;
		pos.y = y;
		pos.angle = a;
	}

	void update() {
		return null;
	}
}

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