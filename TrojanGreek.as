// Name: Aeneas.as
// Author(s): Jason Wang, Rene Lee
// version 0.1
// --------------------------------------
// This module sets up the Trojans and Greeks

#include "include/AIChar.as"
#include "include/CharStats.as"

import ControllableChar @ getAeneas() from "Aeneas.as";

array<AIChar> trojans; // Array of Trojans
array<AIChar> greek; // Array of Greeks
ControllableChar @ aeneas;
final float BASE_WALK_SPEED = 300;

void initialize() {
    // Check savestate for previously saved stuff
    if( !( requestTrojans() && requestGreeks() ) ) {
        // Set up trojans and greeks for the first time, in the first map
        setTrojansOnMap( 1, 682, 896, 270 );
        setTrojansOnMap( 2, 984, 1287, 180 );
        setTrojansOnMap( 3, 296, 1166, 0 );
        setTrojansOnMap( 4, 786, 1677, 180 );
        setTrojansOnMap( 5, 247, 1804, 45 );
        setTrojansOnMap( 6, 2117, 2117, 315 );
        setTrojansOnMap( 7, 1958, 2381, 330 );
        setTrojansOnMap( 8, 2249, 2568, 315 );
        setTrojansOnMap( 9, 1281, 2832, 225 );
        setTrojansOnMap( 10, );
        setTrojansOnMap( 11, );
        setTrojansOnMap( 12, );
        setTrojansOnMap( 13, );
        setTrojansOnMap( 14, );
        setTrojansOnMap( 15, );
        setTrojansOnMap( 16, );
        setTrojansOnMap( 17, );
        setTrojansOnMap( );
        setTrojansOnMap( );
        setTrojansOnMap( );
        setTrojansOnMap( );

		setGreeksOnMap( 1, 682, 870, 90 );
		setGreeksOnMap( 2, 797, 1485, 0 );
		setGreeksOnMap( 3, 425, 1166, 180 );
		setGreeksOnMap( 4, 750, 1677, 0 );
		setGreeksOnMap( 5, 423, 1771, 180 );
		setGreeksOnMap( 6, 2277, 2233, 135 );
		setGreeksOnMap( 7, 2007, 2491, 150 );
		setGreeksOnMap( 8, 2370, 2651, 135 );
		setGreeksOnMap( 9, 1210, 2898, 45 );
		setGreeksOnMap( 10, );
		setGreeksOnMap( 11, );
		setGreeksOnMap( 12, );
		setGreeksOnMap( 13, );
		setGreeksOnMap( 14, );
		setGreeksOnMap( 15, );
		setGreeksOnMap( 16, );
		setGreeksOnMap( 17, );
		setGreeksOnMap( 18, );
		setGreeksOnMap( 19, );
		setGreeksOnMap( 20, );
		setGreeksOnMap( 21, );
		setGreeksOnMap( 22, );
		setGreeksOnMap( 23, );
		setGreeksOnMap( 24, );
		setGreeksOnMap( 25, );
		setGreeksOnMap( 26, );
		setGreeksOnMap( 27, );

    }
}

void step( uint32 milliseconds ) {
    for( AIChar trojan: trojans ) {
    	trojan.step( milliseconds, greeks);
    }
    for( AIChar greek: greeks ) {
    	greek.step( milliseconds, trojans);
    }
}

void retrieveAeneas() {
	aeneas = getAeneas();
}

bool saveAIChars() {
	try {
		int count = 0;
		for( AIChar trojan: trojans ) {
			trojan.requestSaveData( "trojan", count );
			count++;
		}
		ee::writeToDataCont( "trojanNumber", "number", count );
		count = 0;
		for( AIChar greek: greeks ) {
			greek.requestSaveData( "greek", count );
			count++;
		}
		ee::writeToDataCont( "greekNumber", "number", count );
		return true;
	} catch { 
		ee::consolePrintln( "ERROR: TrojanGreek.saveAIChars does not work." );
		return false;
	}
}

void setTrojansOnMap( float num, float x, float y, float degree ){
	string name = "trojan" + num;
	AIChar name = AIChar( "Character", "trojan" );
	name.updatePos( x, y, degree );
	name.setHostility( false );
}

void setGreeksOnMap( float num, float x, float y, float degree ){
	string name = "greek" + num;
	AIChar name = AIChar( "Character", "greek" );
	name.updatePos( x, y, degree );
}

// Loads Trojans
bool requestTrojans() {
	try {
		int n = ee::readFromDataCont( "trojanNumber", "number" );
		for( int i = n; i >= 0; i-- ) {
			// Logic to get all the parameter / values from each trojan

			int cHealth = ee::readFromDataCont( "trojan" + i, "cHealth" );
			int mHealth = ee::readFromDataCont( "trojan" + i, "mHealth" );
			float walkSpeed = ee::readFromDataCont( "trojan" + i, "walkSpeed" );
			float rotationSpeed = ee::readFromDataCont( "trojan" + i, "rotationSpeed" );
			bool invincibility = ee::readFromDataCont( "trojan" + i, "invincibility" );
			bool isItHostile = ee::readFromDataCont( "trojan" + i, "isItHostile" );
			int damage = ee::readFromDataCont( "trojan" + i, "damage" );

			int x = ee::readFromDataCont( "trojan" + i, "x" );
			int y = ee::readFromDataCont( "trojan" + i, "y" );
			double angle = ee::readFromDataCont( "trojan" + i, "angle" );

			AIChar aic = AIChar( "Characters", "trojan", x, y, angle, cHealth, mHealth, walkSpeed, 
					rotationSpeed, invincibility, isItHostile, damage );

			trojans.add( aic );

			return true;
		}
	} catch {
		ee::consolePrintln( "ERROR: TrojanGreek.requestTrojans does not work." );
		return false;
	}
}

// Loads Greeks
bool requestGreeks() {
	array<string> keys;
	try {
		int n = ee::readFromDataCont( "greekNumber", "number" );
		for( int i = n; i >= 0; i-- ) {
			// Logic to get all the parameter / values from each trojan

			int cHealth = ee::readFromDataCont( "greek" + i, "cHealth" );
			int mHealth = ee::readFromDataCont( "greek" + i, "mHealth" );
			float walkSpeed = ee::readFromDataCont( "greek" + i, "walkSpeed" );
			float rotationSpeed = ee::readFromDataCont( "greek" + i, "rotationSpeed" );
			bool invincibility = ee::readFromDataCont( "greek" + i, "invincibility" );
			bool isItHostile = ee::readFromDataCont( "greek" + i, "isItHostile" );
			int damage = ee::readFromDataCont( "trojan" + i, "damage" );

			int x = ee::readFromDataCont( "greek" + i, "x" );
			int y = ee::readFromDataCont( "greek" + i, "y" );
			double angle = ee::readFromDataCont( "greek" + i, "angle" );

			AIChar aic = AIChar( "Characters", "greek", x, y, angle, cHealth, mHealth, walkSpeed, 
					rotationSpeed, invincibility, isItHostile, damage );

			greeks.add( aic );
			
			return true;
		}
	} catch {
		ee::consolePrintln( "ERROR: TrojanGreek.requestGreeks does not work." );
		return false;
	}
}

array< AIChar > @ getTrojans() { return trojans; }

array< AIChar > @ getGreeks() { return greeks; }


