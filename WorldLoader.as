#include "include/World.as"
import void setUpAeneasSpawn( string name ) from "Aeneas.as"

World world;
int level = 1;
int exitX;
int exitY;

void initialize() {
	setUpWorld( "VillageTown", "villageTownMap" );
	exitX = 0;
	exitY = 0;
}

void setUpWorld( string contName, string entName ) {
	world = World( contName );

	world.add( world.getStaticEntity( contName, entName ), entName );
	world.setName( contName );

	if( contName == "VillageTown" )
		setUpVillageTown();
	else if( contName == "PriamAltar" )
		setUpPriamAltar();
	else if( contName == "cityThree" )
		setUpCityThree();
	else if( contName == "cityTwo" )
		setUpCityTwo();
	else if( contName == "cityOne" )
		setUpCityOne();
}

void step( uint32 milliseconds ) {
	if( world.isCompleted( getExitXPos(), getExitYPos() ) ) {
		level++;
		determineNextWorld( level );
	}
	world.step( milliseconds );
}

void setUpCheckPoint() {
	if( world.getName() == "VillageTown" )
		world.setUpCheckPoint( 2051, 1731 );
	else if( world.getName() == "cityThree" )
		world.setUpCheckPoint( 436, 1046 );
	else if( world.getName() == "cityTwo" )
		world.setUpCheckPoint( 40, 1831 );
	else if( world.getName() == "cityOne" )
		world.setUpCheckPoint( 23, 1830 );
	else if( world.getName() == "PriamAltar" )
		world.setUpCheckPoint( 1689, 1623 );
}

void setUpExitPoint() {
	if( world.getName() == "VillageTown" ) {
		exitX = 2497;
		exitY = 3106;
	}
	else if( world.getName() == "cityThree" ) {
		exitX = 1477;
		exitY = 815;
	}
	else if( world.getName() == "cityTwo" ) {
		exitX = 794;
		exitY = 286;
	}
	else if( world.getName() == "cityOne" ) {
		exitX = 1132;
		exitY = 1418;
	}
	else if( world.getName() == "PriamAltar" ) {
		exitX = 1695;
		exitY = 360;
	}
}

int getExitXPos() {
	return exitX;
}

int getExitYPos() {
	return exitY;
}

// Determines which world will be loaded next
void determineNextWorld( int i ) {
	string name = "";
	if( i == 1 ) {
		setUpWorld( "VillageTown", "villageTownMap" );
		name = "VillageTown";
	} else if( i == 2 ) {
		setUpWorld( "cityThree", "cityThreeMap" );
		name = "cityThree";
	} else if( i == 3 ) {
		setUpWorld( "cityTwo", "cityTwoMap" );
		name = "cityTwo";
	} else if( i == 4 ) {
		setUpWorld( "cityOne", "cityOneMap" );
		name = "cityOne";
	} else if( i == 5 ) {
		setUpWorld( "PriamAltar", "priamAltarMap" );
		name = "PriamAltar";
	}

	finishWorldSetup( name );
}

void finishWorldSetup( string name ) {
	if( name == "" )
		ee::consolePrintLine( "ERROR: WorldLoader.as/ Cannot find world name." );
	else
		setUpAeneasSpawn( name );
	setUpCheckPoint();
}

// Put in art assets LOL
void setUpVillageTown() {
	world.add( world.getStaticEntity( "VillageTown", "brickRoof"), "brickRoof" );
	world.setobj[world.setobj.length()-1].setPosition(1420,1262);
	world.add( world.getStaticEntity( "VillageTown", "clayPot" ), "clayPot" );
	world.setobj[world.setobj.length()-1].setPosition(922,2838);
	world.add( world.getStaticEntity( "VillageTown", "eastCrossThatchRoof" ), "eastCrossThatchRoof" );
	world.setobj[world.setobj.length()-1].setPosition(2422,1406);
	world.add( world.getStaticEntity( "VillageTown", "fourHouseNE" ), "fourHouseNE" );
	world.setobj[world.setobj.length()-1].setPosition(1110,76);
	world.add( world.getStaticEntity( "VillageTown", "fourHouseNW" ), "fourHouseNW" );
	world.setobj[world.setobj.length()-1].setPosition(790,132);
	world.add( world.getStaticEntity( "VillageTown", "fourHouseSE" ), "fourHouseSE" );
	world.setobj[world.setobj.length()-1].setPosition(1122,386);
	world.add( world.getStaticEntity( "VillageTown", "fourHouseSW" ), "fourHouseSW" );
	world.setobj[world.setobj.length()-1].setPosition(812,486);
	world.add( world.getStaticEntity( "VillageTown", "northEastGrayPlankHouse" ), "northEastGrayPlankHouse" );
	world.setobj[world.setobj.length()-1].setPosition(1934,256);
	world.add( world.getStaticEntity( "VillageTown", "northEastTree" ), "northEastTree" );
	world.setobj[world.setobj.length()-1].setPosition(1930,728);
	world.add( world.getStaticEntity( "VillageTown", "northEastTreeBottom" ), "northEastTreeBottom" );
	world.setobj[world.setobj.length()-1].setPosition(1956,948);
	world.add( world.getStaticEntity( "VillageTown", "northEastWall" ), "northEastWall" );
	world.setobj[world.setobj.length()-1].setPosition(1874,480);
	world.add( world.getStaticEntity( "VillageTown", "northEastWoodRoofHouse" ), "northEastWoodRoofHouse" );
	world.setobj[world.setobj.length()-1].setPosition(2210,88);
	world.add( world.getStaticEntity( "VillageTown", "rotundaRoof" ), "rotundaRoof" );
	world.setobj[world.setobj.length()-1].setPosition(1007,807);
	world.add( world.getStaticEntity( "VillageTown", "sEWall" ), "sEWall" );
	world.setobj[world.setobj.length()-1].setPosition(1846,2818);
	world.add( world.getStaticEntity( "VillageTown", "sEWoodThatchRoof" ), "sEWoodThatchRoof" );
	world.setobj[world.setobj.length()-1].setPosition(2410,2178);
	world.add( world.getStaticEntity( "VillageTown", "southTreeCluster" ), "southTreeCluster" );
	world.setobj[world.setobj.length()-1].setPosition(1004,358);
	world.add( world.getStaticEntity( "VillageTown", "strawRoof" ), "strawRoof" );
	world.setobj[world.setobj.length()-1].setPosition(1112,1986);
	world.add( world.getStaticEntity( "VillageTown", "strawRoofEastGray" ), "strawRoofEastGray" );
	world.setobj[world.setobj.length()-1].setPosition(1564,2304);
	world.add( world.getStaticEntity( "VillageTown", "strawRoofEastGrayCross" ), "strawRoofEastGrayCross" );
	world.setobj[world.setobj.length()-1].setPosition(1564,2018);
	world.add( world.getStaticEntity( "VillageTown", "sWThatchHouse" ), "sWThatchHouse" );
	world.setobj[world.setobj.length()-1].setPosition(1,1942);
	world.add( world.getStaticEntity( "VillageTown", "sWWall" ), "sWWall" );
	world.setobj[world.setobj.length()-1].setPosition(358,3030);
	world.add( world.getStaticEntity( "VillageTown", "sWWall2" ), "sWWall2" );
	world.setobj[world.setobj.length()-1].setPosition(874,2572);
	world.add( world.getStaticEntity( "VillageTown", "thatchRoof" ), "thatchRoof" );
	world.setobj[world.setobj.length()-1].setPosition(1564,590);
	world.add( world.getStaticEntity( "VillageTown", "topTree" ), "topTree" );
	world.setobj[world.setobj.length()-1].setPosition(1428,76);
	world.add( world.getStaticEntity( "VillageTown", "topTreeBottom" ), "topTreeBottom" );
	world.setobj[world.setobj.length()-1].setPosition(1372,72);
	world.add( world.getStaticEntity( "VillageTown", "treetops" ), "treetops" );
	world.setobj[world.setobj.length()-1].setPosition(796,1570);
	world.add( world.getStaticEntity( "VillageTown", "wall" ), "wall" );
	world.setobj[world.setobj.length()-1].setPosition(1,1);
	world.add( world.getStaticEntity( "VillageTown", "westTree" ), "westTree" );
	world.setobj[world.setobj.length()-1].setPosition(178,1136);
	world.add( world.getStaticEntity( "VillageTown", "westTreeCluster" ), "westTreeCluster" );
	world.setobj[world.setobj.length()-1].setPosition(24,1936);
	// TODO: Set up world
}

void setUpPriamAltar() {
	world.add( world.getStaticEntity( "PriamAltar", "walls"), "walls" );
}

void setUpCityThree() {
	world.add( world.getStaticEntity( "TrojanCity1", "leftColumn" ), "leftColumn" );
	world.add( world.getStaticEntity( "TrojanCity1", "leftWall" ), "leftWall" );
	world.add( world.getStaticEntity( "TrojanCity1", "overlapTrees" ), "overlapTrees" );
	world.add( world.getStaticEntity( "TrojanCity1", "rightColumn" ), "rightColumn" );
	world.add( world.getStaticEntity( "TrojanCity1", "southernBuilding" ), "southernBuilding" );
	world.add( world.getStaticEntity( "TrojanCity1", "Trees" ), "Trees" );

}

void setUpCityTwo() {
	world.add( world.getStaticEntity( "TrojanCity2", "leftColumn" ), "leftColumn" );
	world.add( world.getStaticEntity( "TrojanCity1", "rightColumn" ), "rightColumn" );

}

void setUpCityOne() {
	world.add( world.getStaticEntity( "TrojanCity1", "leftColumn" ), "leftColumn" );
	world.add( world.getStaticEntity( "TrojanCity1", "palaceOverlap" ), "palaceOverlap" );
	world.add( world.getStaticEntity( "TrojanCity1", "rightColumn" ), "rightColumn" );
	world.add( world.getStaticEntity( "TrojanCity1", "rightWall" ), "rightWall" );

}

void setUpBoundary() {
	world.add(world.getStaticEntity(""))
}