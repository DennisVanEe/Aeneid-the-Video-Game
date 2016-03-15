// Name: ControllableChar.as
// Author(s): Jason Wang
// version 0.1
// --------------------------------------
// This class defines an entity that can be
// controlled by the user through system 
// inputs

// NOTE: Please make sure all angles are correct; atan and tan output / input in radians, must be converted.

#include "Character.as"

class ControllableChar : Character {

	private Inventory inv;
	CharPosition @ pos; //name conflict
	CharStats @ stats; //name conflict

	void step(uint milliseconds)
	{
		if(ee::isPressed(W))
		{
			pos.y += 		

	}

	void addItem( const string &in, Collectible c ) { //Collectible is not a data type in global namespace

	}

	// Default Constructor
	ControllableChar() {
		Character();
		inv = Inventory();

		pos = getCharPosition();
		stats = getStat();
	}

	// Constructor with all values as parameter
	ControllableChar( Inventory i, int x, int y, double angle, int cH, int mH, float wS, int p, float cW, float mCW ) { //Inventory is not a data type in global namespace
		Character( x, y, angle, cH, mH, wS, p, cW, mCW );
		inv = i;

		pos = getCharPosition();
		stats = getStat();
	}

	// Tells Aeneas to follow a certain AI Character
	void follow ( AIChar aic ) {
		CharPosition@ rPos = aic.getPos();

		int yDif = pos.y - rPos.y;
		int xDif = pos.x - rPos.x;

		double angle = atan( ( (float) yDif ) / xDif ); //problems with brackets
		if( xDif < 0 )
			angle += 180;

		float distance = sqrt( yDif*yDif + xDif*xDif );

		move();		//not going to work right now because it takes it 2 inputs

		// TODO: Update positions
		// TODO: Finish follow method
	}

	// Tells Aeneas to update the position using x, y and angle values
	void updatePos( int iX, int iY, double ang ) { Character.setPos( iX, iY, ang ); } //Character is not declared

	// gets Character Position
	CharPosition @ getCharPosition() { return Character.getPos(); } //Character is not declared

	// Calls update for Entity render
	void update() { Character.update(); } //Character not declared

	// Rotates Aeneas to follow the Mouse
	void setRotation () {
		int yDif = ee::getYPosMouse - pos.y;
		int xDif = ee::getXPosMouse - pos.x;

		if( xDif != 0)
			pos.angle = atan( ( (float) yDif ) / xDif ); //problems with brackets
		else if ( xDif == 0 && yDif > 0 )
			pos.angle = 90;
		else
			pos.angle = -90;
		if( xDif < 0 )
			pos.angle += 180;
	}

	// Tell Aeneas to move in a certain direction based on W, A, S, D 
	void moveX( uint16 milliseconds, boolean sign ) {		//sign is direction (true = positive)
		
		int x = (int) stats.getWalkSpeed() * milliseconds / 1000; //problems with brackets (typecasting done wrong)	
		if( sign )
			Aeneas.updatePos( pos.x + x, y, pos.angle );
		else
			Aeneas.updatePos( pos.x - x, y, pos.angle );		
 	}

	void moveY( uint16 milliseconds, boolean sign ) {		//sign is direction (true = positive)
		int y = (int) stats.getWalkSpeed() * milliseconds / 1000; //problems with brackets (typecasting done wrong)	
		if( sign )
			Aeneas.updatePos( x, pos.y + y, pos.angle );
		else
			Aeneas.updatePos( x, pos.y - y, pos.angle );	
	}

	// Checks for inputs
	// if-statements must be listed in order of priority
	void checkInputs( uint16 milliseconds ) {
		// If clicking on NPC
		// Make sure that mouse is on NPC
		array npcArray = readFromDataCont( "npcList", "npcArray" ); // NOTE: Ask Dennis
		if ( ee::isButtonPressed( Left ) ) {
			for( AIChar aic : npcArray ) {  //expected ";"
				if( ifMouseOnNPC( aic ) ) {
					if( aic.isHostile() )
						attack( damage, aic );
					else
						talk( aic );
				}
			}
		}
		if( ee::isKeyPressed( W ) )
			moveY( milliseconds, true );
		else if( ee::isKeyPressed( S ) ) 
			moveY( milliseconds, false );
		else if( ee::isKeyPressed( D ) )
			moveX( milliseconds, true );
		else
			moveX( milliseconds, false );
	}
	
	bool ifMouseOnNPC( AIChar character ) {
		ee::intersect( character.getEntity(), ee::getXPosMouse, ee::getYPosMouse ); // NOTE: Must get Entity for character
 	}   //no matching signatures to AIChar::getEntity()

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
		stats.damage( difference );
		if( stats.getCHealth <= 0 || stats.getCHealth < 1 ) //invalid operation on method
			die();
	}

	// A function for when Aeneas dies
	void die() {
		// NOTE: Add something for when Aeneas dies
	}
	
	bool saveRequestValues() {
		// Saves stats
		ee::readFromDataCont( "Aeneas", "cHealth", stats.getCHealth() );
		ee::readFromDataCont( "Aeneas", "mHealth", stats.getMHealth() );
		ee::readFromDataCont( "Aeneas", "walkSpeed", stats.getWalkSpeed() );
		ee::readFromDataCont( "Aeneas", "piety", stats.getPiety() );
		ee::readFromDataCont( "Aeneas", "carryWeight", stats.getCarryWeight() );
		ee::readFromDataCont( "Aeneas", "maxCarryWeight", stats.getMaxCarryWeight() );

		// Saves position
		ee::readFromDataCont( "Aeneas", "x", pos.x );
		ee::readFromDataCont( "Aeneas", "y", pos.y );
		ee::readFromDataCont( "Aeneas", "angle", pos.angle );

		// Saves inventory
		// TODO: save inventory
	}
}


