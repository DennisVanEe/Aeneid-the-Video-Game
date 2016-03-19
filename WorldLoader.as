#include "include/World.as"
import void setUpAeneasSpawn( string name ) from "Aeneas.as"
import void setUpPlayer2Spawn( string name ) from "Player2.as"

World world;

void initialize() {
	world = World( "PriamAltar" );
	finishWorldSetup( "PriamAltar" );
	setUpPriamAltar();
}

void step( uint32 milliseconds ) {
	// world.step( milliseconds );
}

void finishWorldSetup( string name ) {
	setUpAeneasSpawn( name );
	setUpPlayer2Spawn( name );
}

void setUpPriamAltar() {
	world.progressSetup();
}