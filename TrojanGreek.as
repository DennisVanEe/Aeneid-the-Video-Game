// Name: Aeneas.as
// Author(s): Jason Wang, Rene Lee
// version 0.1
// --------------------------------------
// This module sets up the Trojans and Greeks

#include "include/AIChar.as"
#include "include/CharStats.as"

import ControllableChar @ getAeneas() from "Aeneas.as";

array<AIChar> trojans; // Array of Trojans
array<AIChar> greeks; // Array of Greeks
ControllableChar @ aeneas;
float BASE_WALK_SPEED = 300;

void initialize() {
    // Check savestate for previously saved stuff
    if( !( requestTrojans() && requestGreeks() ) ) {
        // Set up trojans and greeks for the first time, in the first map
        setUpTrojansAndGreeks( "VillageTown" );
    }
}

void step( uint32 milliseconds ) {
	for( int i = 0; i < trojans.length(); i++ ) {
    	trojans[i].step( milliseconds, greeks );
    }
    for( int i = 0; i < greeks.length(); i++) {
    	greeks[i].step( milliseconds, trojans);
    }
}

void retrieveAeneas() {
	aeneas = getAeneas();
}

bool saveAIChars() {

	int count = 0;
	for( int i = 0; i < trojans.length(); i++ ) {
		trojans[i].requestSaveData( "trojan", count );
		count++;
	}
	ee::writeToDataCont( "trojanNumber", "number", count );
	count = 0;
	for( int i = 0; i < greeks.length(); i++) {
		greeks[i].requestSaveData( "greek", count );
		count++;
	}
	bool b = ee::writeToDataCont( "greekNumber", "number", count );
	if( !b ) 
		ee::consolePrintln( "ERROR: TrojanGreek.saveAIChars does not work." );
	return b;
}

void setTrojansOnMap( float num, float x, float y, float degree ){
	string name = "trojan" + num;
	AIChar name = AIChar( "Character", name );
	name.updatePos( x, y, degree );
	name.setHostility( false );
}

void setGreeksOnMap( float num, float x, float y, float degree ){
	string name = "greek" + num;
	AIChar name = AIChar( "Character", name );
	name.updatePos( x, y, degree );
}

// Loads Trojans
bool requestTrojans() {
	
	int n = ee::readFromDataCont( "trojanNumber", "number" );
	for( int i = n; i >= 0; i-- ) {
		// Logic to get all the parameter / values from each trojan
		int temp = 0;
		bool invincibility = false;
		bool isItHostile = false;

		int cHealth = ee::readFromDataCont( "trojan" + i, "cHealth" );
		int mHealth = ee::readFromDataCont( "trojan" + i, "mHealth" );
		float walkSpeed = ee::readFromDataCont( "trojan" + i, "walkSpeed" );
		float rotationSpeed = ee::readFromDataCont( "trojan" + i, "rotationSpeed" );
		temp = ee::readFromDataCont( "trojan" + i, "invincibility" );
		if( temp == 1 )
			invincibility = true;
		temp = ee::readFromDataCont( "trojan" + i, "isItHostile" );
		if( temp == 1 )
			isItHostile = true;
		int damage = ee::readFromDataCont( "trojan" + i, "damage" );

		int x = ee::readFromDataCont( "trojan" + i, "x" );
		int y = ee::readFromDataCont( "trojan" + i, "y" );
		double angle = ee::readFromDataCont( "trojan" + i, "angle" );

		AIChar aic = AIChar( "Characters", "trojan", x, y, angle, cHealth, mHealth, walkSpeed, 
				rotationSpeed, invincibility, isItHostile, damage );

		trojans.add( aic );
	}
	return true;
}

// Loads Greeks
bool requestGreeks() {
	
	int n = ee::readFromDataCont( "greekNumber", "number" );
	for( int i = n; i >= 0; i-- ) {
		// Logic to get all the parameter / values from each trojan

		int cHealth = ee::readFromDataCont( "greek" + i, "cHealth" );
		int mHealth = ee::readFromDataCont( "greek" + i, "mHealth" );
		float walkSpeed = ee::readFromDataCont( "greek" + i, "walkSpeed" );
		float rotationSpeed = ee::readFromDataCont( "greek" + i, "rotationSpeed" );
		temp = ee::readFromDataCont( "greek" + i, "invincibility" );
		if( temp == 1 )
			invincibility = true;
		temp = ee::readFromDataCont( "greek" + i, "isItHostile" );
		if( temp == 1 )
			isItHostile = true;
		int damage = ee::readFromDataCont( "greek" + i, "damage" );

		int x = ee::readFromDataCont( "greek" + i, "x" );
		int y = ee::readFromDataCont( "greek" + i, "y" );
		double angle = ee::readFromDataCont( "greek" + i, "angle" );

		AIChar aic = AIChar( "Characters", "greek", x, y, angle, cHealth, mHealth, walkSpeed, 
				rotationSpeed, invincibility, isItHostile, damage );

		greeks.add( aic );
	}
	return true;
}

void setUpTrojansAndGreeks( string name ) {
	if( name == "VillageTown" ) {
		setTrojansOnMap( 1, 682, 896, 270 );
	    setTrojansOnMap( 2, 984, 1287, 180 );
	    setTrojansOnMap( 3, 296, 1166, 0 );
	    setTrojansOnMap( 4, 786, 1677, 180 );
	    setTrojansOnMap( 5, 247, 1804, 45 );
	    setTrojansOnMap( 6, 2117, 2117, 315 );
	    setTrojansOnMap( 7, 1958, 2381, 330 );
	    setTrojansOnMap( 8, 2249, 2568, 315 );
	    setTrojansOnMap( 9, 1281, 2832, 225 );
	    setTrojansOnMap( 10, 533, 93, 315 );
	    setTrojansOnMap( 11, 88, 643, 5 );
	    setTrojansOnMap( 12, 2145, 1210, 330 );
	    setTrojansOnMap( 13, 1479, 2909, 280 );
	    setTrojansOnMap( 14, 600,1000,0);
	    setTrojansOnMap( 15, 500,1500,123);
	    setTrojansOnMap( 16, 466,950,129);
	    setTrojansOnMap( 17, 817,2333,31);
	    setTrojansOnMap( 18, 500,1000,12);
	    setTrojansOnMap( 19, 600,1342,240);
	    setTrojansOnMap( 20, 120,2000,90);

		setGreeksOnMap( 1, 682, 870, 90 );
		setGreeksOnMap( 2, 797, 1485, 0 );
		setGreeksOnMap( 3, 425, 1166, 180 );
		setGreeksOnMap( 4, 750, 1677, 0 );
		setGreeksOnMap( 5, 423, 1771, 180 );
		setGreeksOnMap( 6, 2277, 2233, 135 );
		setGreeksOnMap( 7, 2007, 2491, 150 );
		setGreeksOnMap( 8, 2370, 2651, 135 );
		setGreeksOnMap( 9, 1210, 2898, 45 );
		setGreeksOnMap( 10, 100, 100,45);
		setGreeksOnMap( 11, 200,150,23);
		setGreeksOnMap( 12, 300,200,96);
		setGreeksOnMap( 13, 400,100,43);
		setGreeksOnMap( 14, 500,350,57);
		setGreeksOnMap( 15, 600,1000,63);
		setGreeksOnMap( 16, 700,345,78);
		setGreeksOnMap( 17, 800,576,68);
		setGreeksOnMap( 18, 900,1506,72);
		setGreeksOnMap( 19, 1000,2000,193);
		setGreeksOnMap( 20, 1100,2100,283);
		setGreeksOnMap( 21, 1200, 599,1);
		setGreeksOnMap( 22, 1300, 127, 24);
		setGreeksOnMap( 23, 1400, 2300, 43);
	} else if( name == "cityThree" ) {

	} else if( contName == "PriamAltar" ) {
		
	} else if( contName == "cityThree" ) {
		
	} else if( contName == "cityTwo" ) {
		
	} else if( contName == "cityOne" ) {
		
	}
}

array< AIChar > @ getTrojans() { return trojans; }

array< AIChar > @ getGreeks() { return greeks; }


