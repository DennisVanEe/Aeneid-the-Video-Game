
// The base NPC interface

interface NPC {
	private int cHealth; // current health;
	private int mHealth; // max health;
	private CharPosition pos; // postion on the map and degree the NPC is facing

	void follow( AIChar aic ); // the NPC follows another NPC

	void setRotation( int degree ); // sets the degree the NPC is facing

	const CharPosition@ getPos(); // gets the position of the NPC

	void move( int x, int y ); // moves the NPC to postion (x, y)

	void attack(); // NPC attacks

	void talk( String phrase ); // the NPC speaks the phrase

	void changeHealth( int changedTo ); // cHealth of the NPC is changed to changedTo. If cHealth is 0, the NPC dies
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