// Name: World.as
// Author(s): Jason Wang
// version 0.1
// --------------------------------------
// These classes are used to define the 
// world the other assets will be in
import bool saveAIChars() from "TrojanGreek.as";
import bool saveCitizens() from "Citizen.as";
import bool requestSaveData() from "Aeneas.as";

#include "Movable.as"

class World
{
	private int layer;
	Checkpoint checkpoint;
	ee::StaticEntity priamAltarMap ( "PriamAltar", "priamAltarMap" );
	ee::StaticEntity priamAltarWalls ( "PriamAltar", "walls" );
	string name;

	World( string name ) {
		layer = 1000;
		setName( name );
	}

	void setName( string n ) {
		name = n;
	}

	string getName() {
		return name;
	}

	void progressSetup() {
		priamAltarWalls.setCollideable( true );
		priamAlterWalls.setVisible( false );
	}
}



