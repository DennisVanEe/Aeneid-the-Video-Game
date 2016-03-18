// Name: Citizen.as
// Author(s): Jason Wang, Rene Lee
// version 0.1
// --------------------------------------
// This module sets up the random fleeing citizens

#include "include/AIChar.as"

import ControllableChar @ getAeneas() from "Aeneas.as";

array<AIChar> citizens; // Array of citizens
array<AIChar> trojans; // Array of Trojans
array<AIChar> greek; // Array of Greeks
ControllableChar @ aeneas;
final float BASE_WALK_SPEED = 300;

void initialize() {
    // Check savestate for previously saved stuff
    if( !requestCitizens() ) {
        // Set up citizens for the first time, in the first map

        
    }
}

void step( uint32 milliseconds ) {
    for( AIChar citizen: citizens ) {
    	citizen.citizenMove( milliseconds );
    }
}

bool saveCitizens() {
	int count = 0;
	for( AIChar citizen: citizens ) {
		citizen.requestSaveData( "citizen", count );
		count++;
	}
	bool b = ee::writeToDataCont( "citizenNumber", "number", count );
	if( !b )
		ee::consolePrintln( "ERROR: TrojanGreek.saveAIChars does not work." );
	return b;
}

// Loads Trojans
bool requestCitizens() {
	
	int n = ee::readFromDataCont( "citizenNumber", "number" );
	for( int i = n; i >= 0; i-- ) {
		// Logic to get all the parameter / values from each citizen

		int cHealth = ee::readFromDataCont( "citizen" + i, "cHealth" );
		int mHealth = ee::readFromDataCont( "citizen" + i, "mHealth" );
		float walkSpeed = ee::readFromDataCont( "citizen" + i, "walkSpeed" );
		float rotationSpeed = ee::readFromDataCont( "citizen" + i, "rotationSpeed" );
		bool invincibility = ee::readFromDataCont( "citizen" + i, "invincibility" );
		bool isItHostile = ee::readFromDataCont( "citizen" + i, "isItHostile" );
		int damage = ee::readFromDataCont( "citizen" + i, "damage" );

		int x = ee::readFromDataCont( "citizen" + i, "x" );
		int y = ee::readFromDataCont( "citizen" + i, "y" );
		double angle = ee::readFromDataCont( "citizen" + i, "angle" );

		AIChar aic = AIChar( "Characters", "citizen", x, y, angle, cHealth, mHealth, walkSpeed, 
				rotationSpeed, invincibility, isItHostile, damage );

		citizens.add( aic );
	}
	return true;
}


