// Name: ControllableChar.as
// Author(s): Jason Wang
// version 0.1
// --------------------------------------
// This class defines an entity that can be
// controlled by the user through system 
// inputs

// NOTE: Please make sure all angles are correct; atan and tan output / input in radians, must be converted.

#include "Character.as"
#include "Collectible.as"

shared class ControllableChar : Character {

	private Inventory inv;
	CharPosition @ pos; //name conflict
	CharStats @ stats; //name conflict
	final float PI = 3.14159;


	// Unnecessary function, since step method is called in Aeneas.as
	/*
	void step(uint milliseconds)
	{
		checkInputs();
	}
	*/

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
	// PARAMETER ERROR: Inventory is not a data type in global namespace
	ControllableChar( Inventory i, int x, int y, double angle, int cH, int mH, float wS, int p, float cW, float mCW ) {
		Character( x, y, angle, cH, mH, wS, p, cW, mCW );
		inv = i;

		pos = getCharPosition();
		stats = getStat();
	}

	// Tells Aeneas to follow a certain AI Character
	bool follow ( AIChar aic, uint32 milliseconds ) {
		CharPosition @ rPos = aic.getPos();

		int yDif = pos.y - rPos.y;
		int xDif = pos.x - rPos.x;

		if( xDif != 0)
			pos.angle = 180 / PI * atan( ( (float) yDif ) / xDif );
		else if ( xDif == 0 && yDif > 0 )
			pos.angle = 90;
		else
			pos.angle = -90;
		if( xDif < 0 )
			pos.angle += 180;

		float distance = sqrt( yDif*yDif + xDif*xDif );

		// TODO: Update positions
		float bubble = 30; //or 20

		updatePos( pos.x, pos.y, pos.angle );

		// NOTE: Changed this so that it actually moves DIRECTLY towards AIChar being followed
		// with the correct speeds (using cos and sin)
		if( bubble < distance )
		{
			/*
			updatePos( pos.x + stats.walkSpeed * milliseconds / 1000, 
					pos.y + stats.walkSpeed * milliseconds / 1000, pos.getAngle() );
			*/
			x = pos.x + stats.getWalkSpeed * milliseconds / 1000 * cos( PI / 180 * angle );
			y = pos.y + stats.getWalkSpeed * milliseconds / 1000 * sin( PI / 180 * angle );
			updatePos( x, y, angle );
			return false;
		}
		else {
			updatePos( pos.x, pos.y, angle );
			return true;
		}
	}

	// Tells Aeneas to update the position using x, y and angle values
	void updatePos( int iX, int iY, double ang ) { setPos( iX, iY, ang ); } 

	// gets Character Position
	CharPosition @ getCharPosition() { return getPos(); }

	// Calls update for Entity render
	void update() { update(); }

	// Rotates Aeneas to follow the Mouse
	void setRotation () {
		int yDif = ee::getYPosMouse - pos.y;
		int xDif = ee::getXPosMouse - pos.x;

		if( xDif != 0)
			pos.angle = 180 / PI * atan( ( (float) yDif ) / xDif ); //problems with brackets
		else if ( xDif == 0 && yDif > 0 )
			pos.angle = 90;
		else
			pos.angle = -90;
		if( xDif < 0 )
			pos.angle += 180;
	}

	// Tell Aeneas to move in a certain direction based on W, A, S, D 
	void moveX( uint32 milliseconds, bool sign ) {		//sign is direction (true = positive)
		
		int x = (int) stats.getWalkSpeed() * milliseconds / 1000; //problems with brackets (typecasting done wrong)	
		if( sign )
			updatePos( pos.x + x, pos.y, pos.angle );
		else
			updatePos( pos.x - x, pos.y, pos.angle );		
 	}

	void moveY( uint32 milliseconds, bool sign ) {		//sign is direction (true = positive)
		int y = (int) stats.getWalkSpeed() * milliseconds / 1000; //problems with brackets (typecasting done wrong)	
		if( sign )
			updatePos( pos.x, pos.y + y, pos.angle );
		else
			updatePos( pos.x, pos.y - y, pos.angle );	
	}

	void moveXY( uint32 milliseconds, bool xPos, bool yPos ) {
		int distance = (int) stats.getWalkSpeed() * milliseconds / 1000;
		if( xPos == true ) {
			if( yPos == true ) {
				updatePos( pos.x + distance / sqrt( 2 ), pos.y + distance / sqrt( 2 ), pos.angle );
			} else {
				updatePos( pos.x + distance / sqrt( 2 ), pos.y - distance / sqrt( 2 ), pos.angle );
			}
		} else {
			if( yPos == true ) {
				updatePos( pos.x - distance / sqrt( 2 ), pos.y + distance / sqrt( 2 ), pos.angle );
			} else {
				updatePos( pos.x - distance / sqrt( 2 ), pos.y - distance / sqrt( 2 ), pos.angle );	
			}
		}
	}

	// Checks for inputs
	// if-statements must be listed in order of priority
	void checkInputs( uint32 milliseconds ) {
		// If clicking on NPC
		// Make sure that mouse is on NPC

		// NOTE: Ask Dennis how to communicate to get Trojans and Greeks
		array< AIChar > @ trojans = setTrojans();
		array< AIChar > @ greeks = setGreeks();
		array< AIChar > npcArray;

		// NOTE: Check for intensity of this calculation
		for( AIChar trojan: trojans ) {
			npcArray.insertLast( trojan );
		}
		for( AIChar greek: greeks ) {
			npcArray.insertLast( greek );
		}

		if ( ee::isButtonPressed( Left ) ) {
			for( AIChar npc : npcArray ) {  //expected ";"
				if( ifMouseOnNPC( npc ) ) {
					if( npc.stats.isHostile() )
						attack( damage, npc );
					else
						talk( npc );
				}
			}
		}
		checkForMove( milliseconds ); // moving logistics moved to checkForMove();
	}

	void checkForMove( uint32 milliseconds ) {
		if( ee::isKeyPressed( W ) ) {
			if( ee::isKeyPressed( A ) ) { // Allows for moving up-left
				moveXY( milliseconds, false, true );
			} else if( ee::isKeyPressed( D ) ) { // Allows for moving up-right
				moveXY( milliseconds, true, true );
			} else {
				moveY( milliseconds, true );
			}
		}
		else if( ee::isKeyPressed( S ) ) {
			if( ee::isKeyPressed( A ) ) { // Allows for moving down-left
				moveXY( milliseconds, false, false );
			} else if( ee::isKeyPressed( D ) ) { // Allows for moving down-right
				moveXY( milliseconds, true, false );
			} else {
				moveY( milliseconds, false );
			}
		}
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

		// NOTE: Need to display animation
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

	array< AIChar > @ setTrojans( array< AIChar > @ trojans ) { return trojans; }

	array< AIChar > @ setGreeks( array< AIChar > @ greeks ) { return greeks; }
	
	bool saveRequestValues() {
		// Saves stats
		ee::writeToDataCont( "Aeneas", "cHealth", stats.getCHealth() );
		ee::writeToDataCont( "Aeneas", "mHealth", stats.getMHealth() );
		ee::writeToDataCont( "Aeneas", "walkSpeed", stats.getWalkSpeed() );
		ee::writeToDataCont( "Aeneas", "piety", stats.getPiety() );
		ee::writeToDataCont( "Aeneas", "carryWeight", stats.getCarryWeight() );
		ee::writeToDataCont( "Aeneas", "maxCarryWeight", stats.getMaxCarryWeight() );

		// Saves position
		ee::writeToDataCont( "Aeneas", "x", pos.x );
		ee::writeToDataCont( "Aeneas", "y", pos.y );
		ee::writeToDataCont( "Aeneas", "angle", pos.angle );

		// Saves inventory
		// TODO: save inventory
	}
}


