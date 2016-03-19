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

	CharStats stats;

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
	
	const CharPosition @ getPos() {
		ee::consolePrintln( "Character.as/getPos: returns the position of the character." );
		return getPos();
	}

	void setPos( int x, int y, double a ) {
		ee::consolePrintln( "Character.as/setPos: sets the position of the character." );
		setPos( x, y, a );
	}

	CharStats @ getStat() { 
		ee::consolePrintln( "Character.as/getStat: returns the character stats." );
		return stats; }
	void setStat( CharStats s ) { 
		ee::consolePrintln( "Character.as/setStat: sets the character stats." );
		stats = s; }

	void follow ( Character aic, uint32 milliseconds ){} // the NPC follows another NPC
	void setRotation( int degree ){} // sets the degree the NPC is facing
	void move( uint32 milliseconds ){} // moves the NPC to postion (x, y)
	void attack(Character npc, uint32 milliseconds ){} // NPC attacks with damage on another NPC
	void talk( string phrase ){} // the NPC speaks the phrase

}