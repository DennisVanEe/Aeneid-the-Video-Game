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
#include "Camera.as"

shared class ControllableChar : Character {

	private Inventory inv;
	CharPosition @ pos; //name conflict
	CharStats @ stats; //name conflict
	final float PI = 3.14159;
	HUD headsUp;
	private ee::AnimatedEntity entityMove;
	private ee::AnimatedEntity entityAttack;
	private ee::AnimatedEntity entityAttackMove;

	void addItem( const string &in name, Collectible c ) { 
		ee::consolePrintln( "ControllableChar.as/addItem: adds a collectible item" );
		
	}

	// Default Constructor
	ControllableChar() {
		Character();
		inv = Inventory();

		pos = getCharPosition();
		stats = getStat();
		headsUp = HUD();
	}

	// Constructor with all values as parameter
	// PARAMETER ERROR: Inventory is not a data type in global namespace
	ControllableChar( string contName, string entName, Inventory i, int x, int y, double angle, int cH, int mH, float wS, int p, float cW, float mCW) {
		Character( x, y, angle, cH, mH, wS, p, cW, mCW );   
		inv = i;											
		entityMove = ee::AnimatedEntity( contName, entName + "Move" ); // CHECK TO SEE IF THIS WORKS
		entityAttack = ee::AnimatedEntity( contName, entName + "Attack" );
		entityAttackMove = ee::AnimatedEntity( contName, entName + "AttackMove" );

		setEntityVisibilities( true, false, false );

		entityMove.setFrame( 0 );

		pos = getCharPosition();
		stats = getStat();
		headsUp = HUD();
	}

	void playAnimationStates( uint32 milliseconds ) {
		// entityMove.play( milliseconds );
		if( entityMove.isVisible() )
			entityMove.play( milliseconds );
		else if( entityAttack.isVisible() )
			entityAttack.play( milliseconds );
		else
			entityAttackMove.play( milliseconds );
	}

	void updateEntityPos() {
		entityMove.setPosition( pos.x, pos.y );
		entityMove.setRotation( pos.angle );

		entityAttack.setPosition( pos.x, pos.y );
		entityAttack.setRotation( pos.angle );

		entityAttackMove.setPosition( pos.x, pos.y );
		entityAttackMove.setRotation( pos.angle );
	}

	// Checks for inputs
	// if-statements must be listed in order of priority
	void checkInputs( uint32 milliseconds ) {
		// If clicking on NPC
		// Make sure that mouse is on NPC
		updateEntityPos();

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

		bool isAttacking = false;

		if ( ee::isButtonPressed( ee::Left ) ) {
			for( AIChar npc : npcArray ) {  //expected ";"
				if( ifMouseOnNPC( npc ) ) {
					if( npc.stats.isHostile() ) {
						attack( damage, npc );
						isAttacking = true;
						break;
					}
					else {
						talk( npc );
						break;
					}
				}
			}
		}
		checkForMove( milliseconds, isAttacking ); // moving logistics moved to checkForMove();
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
		else { // If button A is pressed
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
		entityAttack.setVisible( a );
		entityAttackMove.setVisible( am );
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

	// gets Character stats
	CharStats @ getStat() { return getStat(); }

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
		if( !sign ) // ! because -y is up, y is down
			updatePos( pos.x, pos.y + y, pos.angle );
		else
			updatePos( pos.x, pos.y - y, pos.angle );	
			
	}

	void moveXY( uint32 milliseconds, bool xPos, bool yPos ) {
		int distance = (int) stats.getWalkSpeed() * milliseconds / 1000;
		if( xPos == true ) {
			if( !(yPos == true) ) { // ! because -y is up, y is down
				updatePos( pos.x + distance / sqrt( 2 ), pos.y + distance / sqrt( 2 ), pos.angle );
			} else {
				updatePos( pos.x + distance / sqrt( 2 ), pos.y - distance / sqrt( 2 ), pos.angle );
			}
		} else {
			if( !(yPos == true) ) { // ! because -y is up, y is down
				updatePos( pos.x - distance / sqrt( 2 ), pos.y + distance / sqrt( 2 ), pos.angle );
			} else {
				updatePos( pos.x - distance / sqrt( 2 ), pos.y - distance / sqrt( 2 ), pos.angle );	
			}
		}
	}

	/*class HUD //create a HUD object for Aeneas in this module somewhere 
{
	ee::StaticEntity health;
	ee::StaticEntity objective;
	
	HUD(ee::StaticEntity h, ee::StaticEntity o)
	{
		health = h;
		health.setPosition(low x value, high y value); //top left
		health.addEntityToRender(0,h,"healthbar");
		objective = o;
		objective.setPosition(high x value, high y value); //top right
		objective.addEntityToRender(0,o,"objective");
	}
	
	void changeObjective(/*ee::StaticEntity obj*/)
	{
		//CAN HARD CODE IN STRING OBJECTIVES WITH IF STATEMENTS HERE TO PRINT OUT
		/*bool doit = objective.removeEntityToRender("objective");
		objective = obj;
		objective.addEntityToRender(0,h,"objective"); */
	/*	this is what i mean
		if(first checkpoint reached)
		    objective.addEntityToRender(0,ADDENTITY HERE, "whatever");
		if(second checkpoint reached)
			objective.addEntityToRender(0,SECONDENTITYHERE, "whatever");
		etc...	
		
	}
	
	void changeHealth(int x)
	{
		//something about changing the image/sprite of the health bar DENNIS
		//this doesn't change the health statistic, this has to change the animation of the HUD to show visible change
	}
	
	StaticEntity @ getHealth()
	{
		return health;
	}
	
	StaticEntity @ getObjective()
	{
		return objective;
	}
	
	void moveXHUD(int x)
	{
		h.move(x,0);
		o.move(x,0);
	}
	
	void moveYHUD(int y)
	{
	
		h.move(0,y);
		o.move(0,y);
	}
	
	void moveXYHUD(int x, int y)
	{
		h.move(x,y);
		o.move(x,y);
	}
} */
	
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
		headsUp.changeHealth();
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


