
// The base NPC interface


interface NPC {
	private int cHealth;
	private int mHealth;
	private CharPosition pos;

	void follow();

	void rotate();

	void setRotation();

	CharPosition@ getPos();

	void move();

	void attack();

	void talk();
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