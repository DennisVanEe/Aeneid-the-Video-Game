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
        AIChar trojan3 = AIChar();
        trojan3.updatePos( 396, 1166, 0 );
        trojan3.setHostility( false );
        AIChar trojan4 = AIChar();
        trojan4.updatePos( 786, 1677, 180 );
        trojan4.setHostility( false );
        AIChar trojan5 = AIChar();
        trojan5.updatePos( 247, 1804, 45 );
        trojan5.setHostility( false );

        AIChar greek1 = AIChar();
        greek1.updatePos( 682, 870, 90 );
        AIChar greek2 = AIChar();
        greek2.updatePos( 797, 1485, 0 );
        AIChar greek3 = AIChar();
        greek3.updatePos( 425, 1166, 180 );
        AIChar greek4 = AIChar();
        greek4.updatePos( 750, 1677, 0 );
        AIChar greek5 = AIChar();
        greek5.updatePos( 423, 1771, 180 );

        AIChar trojan6 = AIChar();
        trojan6.updatePos( 2117, 2117, 315 );
        trojan6.setHostility( false );
        AIChar trojan7 = AIChar();
        trojan7.updatePos( 1958, 2381, 330 );
        trojan7.setHostility( false );
        AIChar trojan8 = AIChar();
        trojan8.updatePos( 2249, 2568, 315 );
        trojan8.setHostility( false );
        AIChar trojan9 = AIChar();
        trojan9.updatePos( 1281, 2832, 225);
        trojan9.setHostility( false );

        AIChar greek6 = AIChar();
        greek6.updatePos( 2277, 2233, 135 );
        AIChar greek7 = AIChar();
        greek6.updatePos( 2007, 2491, 150 );
        AIChar greek8 = AIChar();
        greek6.updatePos( 2370, 2651, 135 );
        AIChar greek9 = AIChar();
        greek6.updatePos( 1210, 2898, 45 );

        AIChar trojan10 = AIChar();
        trojan10.updatePos();
        trojan10.setHostility( false );
        AIChar trojan11 = AIChar();
        trojan11.updatePos();
        trojan11
        AIChar trojan12 = AIChar();
        trojan12.updatePos();
        trojan12
        AIChar trojan13 = AIChar();
        trojan13
        trojan13
        AIChar trojan14 = AIChar();
        trojan14
        trojan14
        AIChar trojan15 = AIChar();
        trojan15
        trojan15
        AIChar trojan16 = AIChar();
        trojan16
        trojan16
        AIChar trojan17 = AIChar();
        trojan17
        trojan17
        AIChar trojan18 = AIChar();
        AIChar trojan19 = AIChar();
        AIChar trojan20 = AIChar();
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


