// Name: NPC.as
// Author(s):
// version 0.1
// --------------------------------------
// This interface is defined for any 
// character

#include "Movable.as"
#include "CharStats.as"
#include "AIChar.as"

// interface Character {
shared class Character : Movable {

	protected CharStats stats;

	Character() {
		Movable( 0, 0, 0 );

		stats = CharStats();
	}

	// Constructor for ControllableChar
	Character( int x, int y, double angle, int cH, int mH, float wS, int p, float cW, float mCW ) {
		Movable( x, y, angle );

		stats = CharStats( cH, mH, wS, p, cW, mCW );
	}

	// Constructor for AIChar
	Character( int x, int y, double angle, int cH, int mH, float wS, float rS, bool immunity, bool hostile, int damage ) {
		Movable( x, y, angle );

		stats = CharStats( cH, mH, wS, rS, immunity, hostile, damage );
	}
	
	CharPosition @ getPos() {
		return getPos();
	}

	void setPos( int x, int y, double a ) {
		setPos( x, y, a );
	}

	void update() {
		update();

		// Tells the game engine to re-render the Entity in the correct position, 
		// orientation, state, etc.
	}

	CharStats getStat() { return stats; }
	void setStat( CharStats s ) { stats = s; }

	void follow( AIChar aic ){} // the NPC follows another NPC
	void setRotation( int degree ){} // sets the degree the NPC is facing
	void move( int x, int y ){} // moves the NPC to postion (x, y)
	void attack( int damage, AIChar@ npc ){} // NPC attacks with damage on another NPC
	void talk( string phrase ){} // the NPC speaks the phrase

}