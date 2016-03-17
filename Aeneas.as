// Name: Aeneas.as
// Author(s):
// version 0.1
// --------------------------------------
// This module controls Aeneas the character
// and includes his inventory etc.

#include "include/ControllableChar.as"
// #include "include/Inventory.as"  <-- might add this in the future
// #include "include/Weapon.as"

import array< AIChar > @ getTrojans() from "TrojanGreek.as";
import array< AIChar > @ getGreeks() from "TrojanGreek.as";

final float BASE_WALK_SPEED = 10;
ControllableChar aeneas;

void initialize () {
	try {
		// Retrieve data from the save files and figure out what to do from there
		if( ee::readFromDataCont( "Aeneas", "cHealth" ) != null )
		 	finishInitialization( true );
	} catch { // Just in case ee:readFromDataCont( "Aeneas", "cHealth" ) throws error
		finishInitialization( false );
	}
	finishInitialization( false );
}

void finishInitialization ( bool thereIsASaveGame ) {
	if( thereIsASaveGame ) {
		// Then retrieve the ControllableChar object saved
		int cHealth = ee::readFromDataCont( "Aeneas", "cHealth" );
		int mHealth = ee::readFromDataCont( "Aeneas", "mHealth" );
		float walkSpeed = ee::readFromDataCont( "Aeneas", "walkSpeed" );
		int piety = ee::readFromDataCont( "Aeneas", "piety" );
		float carryWeight = ee::readFromDataCont( "Aeneas", "carryWeight" );
		float maxCarryWeight = ee::readFromDataCont( "Aeneas", "maxCarryWeight" );

		int x = ee::readFromDataCont( "Aeneas", "x" );
		int y = ee::readFromDataCont( "Aeneas", "y" );
		double angle = ee::readFromDataCont( "Aeneas", "angle" );

		Inventory inventory = Inventory(); // TODO: Inventory saving and loading

		aeneas = ControllableChar( inventory, x, y, angle, cHealth, mHealth, walkSpeed, 
				piety, carryWeight, maxCarryWeight );
	} else {
		aeneas = ControllableChar( Inventory(), 0, 0, 0, 100, 100, BASE_WALK_SPEED, 0, 0.0, 50.0, 0 );
		// Place Aeneas at the correct position on the map via updatePos;
	}
	aeneas.setTrojans( getTrojans() );
	aeneas.setGreeks( getGreeks() );
}

bool requestSaveData () {
	try {
		return aeneas.saveRequestValues();
	} catch { 
		ee::consolePrintln( "ERROR: Aeneas.requestSaveData cannot save Aeneas." );
		return false;
	}
}

// function to transfer Aeneas to another module
ControllableChar @ getAeneas() { return aeneas; }

// function to transfer Aeneas' position to another module
CharPosition @ getAeneasPos() { return aeneas.getCharPosition(); }

// ----------------------------------------------------------------------------------------------------------------------

void step ( uint16 milliseconds ) {
	// Update health, stamina, piety points
	// Update position
	// Update directionality
	// Update state (attack, walking, etc.)
	// Update animation
	// Update armor, weapons
	// Interact with picking up weapons

	aeneas.setRotation();
	aeneas.checkInputs( milliseconds );
}