// Name: Player2.as
// Author(s): Jason Wang
// version 0.1
// --------------------------------------
// This module controls Aeneas the character
// and includes his inventory etc.

#include "include/ControllableChar.as"
#include "Camera.as"

import ControllableChar @ getAeneas() from "Aeneas.as"
// #include "include/Inventory.as"  <-- might add this in the future
// #include "include/Weapon.as"

// import array< AIChar > @ getTrojans() from "TrojanGreek.as";
// import array< AIChar > @ getGreeks() from "TrojanGreek.as";

const float BASE_WALK_SPEED = 300;
ControllableChar aeneas;
bool readyToChangeHealth;

void initialize () {
	aeneas = ControllableChar( "Character", "Aeneas", Inventory(), 0, 0, 0, 100, 100, BASE_WALK_SPEED, 0, 0.0, 50.0, 0 );

	readyToChangeHealth = false;
}

void setUpPlayer2Spawn( string name ) {
	if( name == "VillageTown" )
		aeneas.updatePos( 2051, 1731, aeneas.cPos.getAngle() );
	else if( name == "cityThree" )
		aeneas.updatePos( 436, 1046, aeneas.cPos.getAngle() );
	else if( name == "cityTwo" )
		aeneas.updatePos( 40, 1831, aeneas.cPos.getAngle() );
	else if( name == "cityOne" )
		aeneas.updatePos( 23, 1830, aeneas.cPos.getAngle() );
	else if( name == "PriamAltar" )
		aeneas.updatePos( 1689, 1623, aeneas.cPos.getAngle() );
}

// function to transfer Aeneas to another module
ControllableChar @ getPlayer2() { return aeneas; }

CharStats @ getPlayer2Stats() { return aeneas.stats; }

// function to transfer Aeneas' position to another module
CharPosition @ getPlayer2Pos() { return aeneas.getCharPosition(); }

float getPlayer2WalkSpeed() { return aeneas.getStat().getWalkSpeedRef(); }

// Returns true when health has been changed for the last time
bool isReadyToChangePlayer2HealthBar() { 
	if( readyToChangeHealth ) {
		readyToChangeHealth = false;
		return true;
	}
	return false;
}


// ----------------------------------------------------------------------------------------------------------------------

void step ( uint32 milliseconds ) {
	// Update health, stamina, piety points
	// Update position
	// Update directionality
	// Update state (attack, walking, etc.)
	// Update animation
	// Update armor, weapons
	// Interact with picking up weapons

	aeneas.setRotation();
	aeneas.checkInputs( milliseconds, getAeneas() );

	/*
	int curHealth = aeneas.stats.getCHealth();
	int maxiHealth = aeneas.stats.getMHealth();

	healthBar.setScale( curHealth / maxiHealth, getScaleY() );
	*/

	// Allows isReadyToChangeHealth() to return true, which allows Camera's stalling do while loop in step to progress
	readyToChangeHealth = true;
}
	
