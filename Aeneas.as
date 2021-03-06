// Name: Aeneas.as
// Author(s): Jason Wang
// version 0.1
// --------------------------------------
// This module controls Aeneas the character
// and includes his inventory etc.

#include "include/ControllableChar.as"
#include "Camera.as"

import ControllableChar @ getPlayer2() from "Player2.as"
// #include "include/Inventory.as"  <-- might add this in the future
// #include "include/Weapon.as"

// import array< AIChar > @ getTrojans() from "TrojanGreek.as";
// import array< AIChar > @ getGreeks() from "TrojanGreek.as";

const float BASE_WALK_SPEED = 300;
ControllableChar aeneas;
bool readyToChangeHealth;

void initialize () {
	aeneas = ControllableChar( "Character", "Aeneas", Inventory(), 0, 0, 0, 100, 100, BASE_WALK_SPEED, 0, 0.0, 50.0, 0.01 );

	readyToChangeHealth = false;
}

void setUpAeneasSpawn( string name ) {
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
ControllableChar @ getAeneas() { return aeneas; }

CharStats @ getAeneasStats() { return aeneas.stats; }

// function to transfer Aeneas' position to another module
CharPosition @ getAeneasPos() { return aeneas.getCharPosition(); }

float getAeneasWalkSpeed() { return aeneas.getStat().getWalkSpeedRef(); }

// Returns true when health has been changed for the last time
bool isReadyToChangeAeneasHealthBar() { 
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
	aeneas.checkInputs( milliseconds, getPlayer2() );

	/*
	int curHealth = aeneas.stats.getCHealth();
	int maxiHealth = aeneas.stats.getMHealth();

	healthBar.setScale( curHealth / maxiHealth, getScaleY() );
	*/

	// Allows isReadyToChangeHealth() to return true, which allows Camera's stalling do while loop in step to progress
	readyToChangeHealth = true;
}
	
