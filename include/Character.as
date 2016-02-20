// Name: NPC.as
// Author(s):
// version 0.1
// --------------------------------------
// This interface is defined for any 
// character

interface Character {
	private bool invincibility; // if invinsible or not
	private int cHealth; // current health
	private int mHealth; // max health
	private CharPosition pos; // postion on the map and degree the NPC is facing

	void follow( AIChar aic ); // the NPC follows another NPC

	void setRotation( int degree ); // sets the degree the NPC is facing

	const CharPosition@ getPos(); // gets the position of the NPC

	void move( int x, int y ); // moves the NPC to postion (x, y)

	void attack( int damage, AIChar@ npc ); // NPC attacks with damage on another NPC

	void talk( String phrase ); // the NPC speaks the phrase

	void changeHealth( int difference ); // cHealth of the NPC is subtracted by difference. If cHealth is below 0, the NPC dies

	void setInvincibility( bool flag) {
		invincibility = flag;
	} // sets invincibility
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