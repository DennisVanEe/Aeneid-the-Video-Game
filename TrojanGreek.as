// Name: Aeneas.as
// Author(s): Jason Wang, Rene Lee
// version 0.1
// --------------------------------------
// This module sets up the Trojans and Greeks

#include "include/AIChar.as";

array<AIChar> trojans; // Array of Trojans
array<AIChar> greek; // Array of Greeks

void initialize() {
    // Check savestate for previously saved stuff
    if( !( requestTrojans() && requestGreeks() ) ) {
        // ERROR HANDLING
    }
}

void step( uint16 milliseconds ) {
    
}

// Loads Trojans
bool requestTrojans() {
	array<string> keys;
	try {
		int n = ee::readFromDataCont( "trojanNumber", "number" );
		for( int i = n; i >= 0; i-- ) {
			// Logic to get all the parameter / values from each trojan
			keys.add( ee::readFromDataCont( "trojan" + i,  ) );
		}
	} catch {

	}
}

// Loads Greeks
bool requestGreeks() {
	array<string> keys;
	try {
		int n = ee::readFromDataCont( "greekNumber", "number" );
		for( int i = n; i >= 0; i-- ) {
			// Logic to get all the parameter / values from each trojan
			keys.add( ee::readFromDataCont( "greek" + i,  ) );
		}
	} catch {

	}
}