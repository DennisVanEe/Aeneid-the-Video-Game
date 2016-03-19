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
	CharPosition @ cPos; //name conflict
	CharStats @ cStats; //name conflict
	float PI = 3.14159;
	
	protected ee::AnimatedEntity entityMove;
	protected ee::AnimatedEntity entityAttack;
	protected ee::AnimatedEntity entityAttackMove;

	// array< AIChar > @ trojans;
	// array< AIChar > @ greeks;

	void addItem( const string &in name, Collectible c ) { 
		ee::consolePrintln( "ControllableChar.as/addItem: adds a collectible item" );
	}

	// Default Constructor
	ControllableChar() {
		Character();
		entityMove = ee::AnimatedEntity( contName, entName + "Move" );
		entityAttack = ee::AnimatedEntity( contName, entName + "Attack" );
		entityAttackMove = ee::AnimatedEntity( contName, entName + "AttackMove" );
		entityMove.setEntityVisibilities( true, false, false );
		entityMove.setFrame( 0 );

		cPos = getCharPosition();
		stats = getStat();
	}

	// Constructor with all values as parameter
	// PARAMETER ERROR: Inventory is not a data type in global namespace
	ControllableChar( string contName, string entName, Inventory i, int x, int y, double angle, int cH, int mH, float wS, 
					int p, float cW, float mCW, float dmg) {
		Character( x, y, angle, cH, mH, wS, p, cW, mCW );   	
		entityMove = ee::AnimatedEntity( contName, entName + "Move" );
		entityAttack = ee::AnimatedEntity( contName, entName + "Attack" );
		entityAttackMove = ee::AnimatedEntity( contName, entName + "AttackMove" );
		inv = i;

		setEntityVisibilities( true, false, false );

		entityMove.setFrame( 0 );

		cPos = getCharPosition();
		cStats = getStat();
	}

	void playAnimationStates( uint32 milliseconds ) {
		// entityMove.play( milliseconds );
		if( entityMove.isVisible() )
			entityMove.playFrame( milliseconds );  //error
		else if( entityAttack.isVisible() )
			entityAttack.playFrame( milliseconds ); //error
		else
			entityAttackMove.playFrame( milliseconds ); //error
	}

	void updateEntityPos() {
		entityMove.setPosition( cPos.x, cPos.y );
		entityMove.setRotation( cPos.angle );

		entityAttack.setPosition( cPos.x, cPos.y );
		entityAttack.setRotation( cPos.angle );

		entityAttackMove.setPosition( cPos.x, cPos.y );
		entityAttackMove.setRotation( cPos.angle );
	}

	// Checks for inputs
	// if-statements must be listed in order of priority
	void checkInputs( uint32 milliseconds, ControllableChar @ otherGuy, string name ) {
		// If clicking on NPC
		// Make sure that mouse is on NPC();

		// NOTE: Ask Dennis how to communicate to get Trojans and Greeks
		// array< AIChar > npcArray;

		// NOTE: Check for intensity of this calculation
		/*
		for( int i = 0; i < trojans.length(); i++ ) {
			npcArray.insertLast( trojans[i] );
		}
		for( int i = 0; i < greeks.length(); i++ ) {
			npcArray.insertLast( greeks[i] );
		}
		*/

		bool isAttacking = false;

		if ( ee::isButtonPressed( ee::Left ) ) {
			if( ifMouseOnNPC( otherGuy ) ) {
				attack( cStats.getDamage(), otherGuy, milliseconds );
				isAttacking = true;
			}
		}
		if( name == "Aeneas" )
			checkForMove( milliseconds, isAttacking ); // moving logistics moved to checkForMove();
		else if( name == "Player2" )
			checkForMove2( milliseconds, isAttacking ); // moving logistics moved to checkForMove();
	}

	void checkForMove( uint32 milliseconds, bool isAttacking ) {
		if( ee::isKeyPressed( ee::W ) ) { // If button W is pressed
			if( isAttacking ) // Sets entity visibilities during attack-move or move
				setEntityVisibilities( false, false, true );
			else
				setEntityVisibilities( true, false, false );

			if( ee::isKeyPressed( ee::A ) ) // Allows for moving up-left
				moveXY( milliseconds, false, true );
			else if( ee::isKeyPressed( ee::D ) ) // Allows for moving up-right
				moveXY( milliseconds, true, true );
			else
				moveY( milliseconds, true );
			playAnimationStates( milliseconds );
			return;
		}
		else if( ee::isKeyPressed( ee::S ) ) { // If button S is pressed
			if( isAttacking ) // Sets entity visibilities during attack-move or move
				setEntityVisibilities( false, false, true );
			else
				setEntityVisibilities( true, false, false );

			if( ee::isKeyPressed( ee::A ) ) // Allows for moving down-left
				moveXY( milliseconds, false, false );
			else if( ee::isKeyPressed( ee::D ) ) // Allows for moving down-right
				moveXY( milliseconds, true, false );
			else
				moveY( milliseconds, false );
			playAnimationStates( milliseconds );
			return;
		}
		else if( ee::isKeyPressed( ee::D ) ) { // If button D is pressed
			if( isAttacking ) // Sets entity visibilities during attack-move or move
				setEntityVisibilities( false, false, true );
			else
				setEntityVisibilities( true, false, false );
			moveX( milliseconds, true );
			playAnimationStates( milliseconds );
			return;
		}
		else if(ee::isKeyPressed(ee::A)){ 
			if( isAttacking ) // Sets entity visibilities during attack-move or move
				setEntityVisibilities( false, false, true );
			else
				setEntityVisibilities( true, false, false );
			moveX( milliseconds, false );
			playAnimationStates( milliseconds );
			return;
		}
		setEntityVisibilities( true, false, false );
		entityMove.setFrame( 0 );
	}

	void checkForMove2( uint32 milliseconds, bool isAttacking ) {
		if( ee::isKeyPressed( ee::I ) ) { // If button W is pressed
			if( isAttacking ) // Sets entity visibilities during attack-move or move
				setEntityVisibilities( false, false, true );
			else
				setEntityVisibilities( true, false, false );

			if( ee::isKeyPressed( ee::J ) ) // Allows for moving up-left
				moveXY( milliseconds, false, true );
			else if( ee::isKeyPressed( ee::L ) ) // Allows for moving up-right
				moveXY( milliseconds, true, true );
			else
				moveY( milliseconds, true );
			playAnimationStates( milliseconds );
			return;
		}
		else if( ee::isKeyPressed( ee::K ) ) { // If button S is pressed
			if( isAttacking ) // Sets entity visibilities during attack-move or move
				setEntityVisibilities( false, false, true );
			else
				setEntityVisibilities( true, false, false );

			if( ee::isKeyPressed( ee::J ) ) // Allows for moving down-left
				moveXY( milliseconds, false, false );
			else if( ee::isKeyPressed( ee::L ) ) // Allows for moving down-right
				moveXY( milliseconds, true, false );
			else
				moveY( milliseconds, false );
			playAnimationStates( milliseconds );
			return;
		}
		else if( ee::isKeyPressed( ee::L ) ) { // If button D is pressed
			if( isAttacking ) // Sets entity visibilities during attack-move or move
				setEntityVisibilities( false, false, true );
			else
				setEntityVisibilities( true, false, false );
			moveX( milliseconds, true );
			playAnimationStates( milliseconds );
			return;
		}
		else if(ee::isKeyPressed(ee::J)){ 
			if( isAttacking ) // Sets entity visibilities during attack-move or move
				setEntityVisibilities( false, false, true );
			else
				setEntityVisibilities( true, false, false );
			moveX( milliseconds, false );
			playAnimationStates( milliseconds );
			return;
		}
		setEntityVisibilities( true, false, false );
		entityMove.setFrame( 0 );
	}

	void setEntityVisibilities( bool m, bool a, bool am ) {
		entityMove.setVisible( m );
		entittyMove.setCollidable( m );
		entityAttack.setVisible( a );
		entityAttack.setCollidable( a );
		entityAttackMove.setVisible( am );
		entityAttackMove.setCollidable( am );
	}

	// Tells Aeneas to update the position using x, y and angle values
	void updatePos( int iX, int iY, double ang ) { setPos( iX, iY, ang ); } 

	// gets Character Position
	const CharPosition @ getCharPosition() { return getPos(); }

	// gets Character stats
	CharStats @ getStat() { return getStat(); }

	// Calls update for Entity render
	void update() { update(); }

	// Rotates Aeneas to follow the Mouse
	void setRotation () {
		int yDif = int(ee::getYPosMouse() - cPos.y);
		int xDif = int(ee::getXPosMouse() - cPos.x);

		if( xDif != 0)
			cPos.angle = 180 / PI * atan( ( float(yDif) ) / xDif ); //problems with brackets
		else if ( xDif == 0 && yDif > 0 )
			cPos.angle = 90;
		else
			cPos.angle = -90;
		if( xDif < 0 )
			cPos.angle += 180;
	}

	// Tell Aeneas to move in a certain direction based on W, A, S, D 
	void moveX( uint32 milliseconds, bool sign ) {		//sign is direction (true = positive)
		
		int x = int(cStats.getWalkSpeed() * milliseconds / 1000); //problems with brackets (typecasting done wrong)	
		if( sign ) {
			updatePos( cPos.x + x, cPos.y, cPos.angle );
			while( ee::isColliding( entityMove.getSprite() ) ) {
				updatePos( cPos.x - 2, cPos.y, cPos.angle );
			}
		}
		else {
			updatePos( cPos.x - x, cPos.y, cPos.angle );
			while( ee::isColliding( entityMove.getSprite() ) ) {
				updatePos( cPos.x + 2, cPos.y, cPos.angle );
			}	
		}
 	}

	void moveY( uint32 milliseconds, bool sign ) {		//sign is direction (true = positive)
		int y = int(cStats.getWalkSpeed() * milliseconds / 1000); //problems with brackets (typecasting done wrong)	
		if( !sign ) { // ! because -y is up, y is down
			updatePos( cPos.x, cPos.y + y, cPos.angle );
			while( ee::isColliding( entityMove.getSprite() ) )
				updatePos( cPos.x, cPos.y - 2, cPos.angle );
		}
		else {
			updatePos( cPos.x, cPos.y - y, cPos.angle );
			while( ee::isColliding( entityMove.getSprite() ) )
				updatePos( cPos.x, cPos.y + 2, cPos.angle );
		}	
			
	}

	void moveXY( uint32 milliseconds, bool xPos, bool yPos ) {
		int distance = int(cStats.getWalkSpeed() * milliseconds / 1000);
		if( xPos == true ) {
			if( !(yPos == true) ) { // ! because -y is up, y is down
				updatePos( cPos.x + distance / sqrt( 2 ), cPos.y + distance / sqrt( 2 ), cPos.angle );
				while( ee::isColliding( entityMove.getSprite() ) )
					updatePos( cPos.x - 2, cPos.y - 2, cPos.angle );
			} else {
				updatePos( cPos.x + distance / sqrt( 2 ), cPos.y - distance / sqrt( 2 ), cPos.angle );
				while( ee::isColliding( entityMove.getSprite() ) )
					updatePos( cPos.x - 2, cPos.y - 2, cPos.angle );
			}
		} else {
			if( !(yPos == true) ) { // ! because -y is up, y is down
				updatePos( cPos.x - distance / sqrt( 2 ), cPos.y + distance / sqrt( 2 ), cPos.angle );
				while( ee::isColliding( entityMove.getSprite() ) )
					updatePos( cPos.x - 2, cPos.y - 2, cPos.angle );
			} else {
				updatePos( cPos.x - distance / sqrt( 2 ), cPos.y - distance / sqrt( 2 ), cPos.angle );
				while( ee::isColliding( entityMove.getSprite() ) )
					updatePos( cPos.x - 2, cPos.y - 2, cPos.angle );
			}
		}
	}
	
	bool ifMouseOnNPC( ControllableChar @ character ) {
		ee::intersect( character.getEntity(), ee::getXPosMouse, ee::getYPosMouse );
	}

	// Tell Aeneas to attack the AI Character, with a certain amount of damage
	void attack( float damage, ControllableChar @ otherGuy, uint32 milliseconds ) {
		// Check to see if AI Character is in front of Aeneas

		// NOTE: Need to display animation
		otherGuy.changeHealth( damage, milliseconds );
	}

	ee::AnimatedEntity getEntity() {
		if( entityMove.isVisible() )
			return entityMove;
		else if( entityAttack.isVisible() )
			return entityAttack;
		else
			return entityAttackMove;
	}

	// Aeneas initiate conversation with a certain AI Character
	void talk( AIChar aic ) {
		// Do stuff with AIChar
	}

	// cHealth of the NPC is changed to changedTo. If cHealth is 0, the NPC dies
	void changeHealth( float difference, uint32 milliseconds ) {
		cStats.damage( difference );
		if( cStats.getCHealth() <= 0 || cStats.getCHealth() < 1 ) //invalid operation on method
			die();
	}

	// A function for when Aeneas dies
	void die() {
		// NOTE: Add something for when Aeneas dies
		// Game over
		// Reset game after a brief few seconds of black
	}
}


