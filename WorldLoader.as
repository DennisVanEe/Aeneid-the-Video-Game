#include "include/World.as"

World world;
int level = 1;

void initialize() {
	setUpWorld( "VillageTown", "villageTownMap" );
}

void setUpWorld( string contName, string entName ) {
	world = World( contName );

	world.add( world.getStaticEntity( contName, entName ), entName );
	world.setName( contName );

	if( contName == "VillageTown" ) )
		setUpVillageTown();
	else if( contName == "PriamAltar" ) )
		setUpPriamAltar();
}

void step( uint32 milliseconds ) {
	if( world.isCompleted() ) {
		level++;
		determineNextWorld( level );
	}
	world.step( milliseconds );
}

// Determines which world will be loaded next
void determineNextWorld( int i ) {
	if( i == 1 ) {
		setUpWorld( "VillageTown", "villageTownMap" );
	} else if( i == 2 ) {
		setUpWorld( "PriamAltar", "priamAltarMap" );
	} else if( i == 3 ) {
		setUpWorld( "VillageTown", "villageTownMap" );
	} else if( i == 4 ) {
		setUpWorld( "VillageTown", "villageTownMap" );
	} else if( i == 5 ) {
		setUpWorld( "VillageTown", "villageTownMap" );
	} else if( i == 6 ) {
		setUpWorld( "VillageTown", "villageTownMap" );
	} else if( i == 7 ) {
		setUpWorld( "VillageTown", "villageTownMap" );
	} else if( i == 8 ) {
		setUpWorld( "VillageTown", "villageTownMap" );
	} else if( i == 9 ) {
		setUpWorld( "VillageTown", "villageTownMap" );
	}
}

// Put in art assets LOL
void setUpVillageTown() {
	world.add( world.getStaticEntity( "VillageTown", "brickRoof"), "brickRoof" );
	world.add( world.getStaticEntity( "VillageTown", "clayPot" ), "clayPot" );
	world.add( world.getStaticEntity( "VillageTown", "eastCrossThatchRoof" ), "eastCrossThatchRoof" );
	world.add( world.getStaticEntity( "VillageTown", "fourHouseNE" ), "fourHouseNE" );
	world.add( world.getStaticEntity( "VillageTown", "fourHouseNW" ), "fourHouseNW" );
	world.add( world.getStaticEntity( "VillageTown", "fourHouseSE" ), "fourHouseSE" );
	world.add( world.getStaticEntity( "VillageTown", "fourHouseSW" ), "fourHouseSW" );
	world.add( world.getStaticEntity( "VillageTown", "northEastGrayPlankHouse" ), "northEastGrayPlankHouse" );
	world.add( world.getStaticEntity( "VillageTown", "northEastWall" ), "northEastWall" );
	world.add( world.getStaticEntity( "VillageTown", "northEastWoodRoofHouse" ), "northEastWoodRoofHouse" );
	world.add( world.getStaticEntity( "VillageTown", "northEastTreeBottom" ), "northEastTreeBottom" );
	world.add( world.getStaticEntity( "VillageTown", "northEastTree" ), "northEastTree" );
	world.add( world.getStaticEntity( "VillageTown", "rotundaRoof" ), "rotundaRoof" );
	world.add( world.getStaticEntity( "VillageTown", "sEWall" ), "sEWall" );
	world.add( world.getStaticEntity( "VillageTown", "sEWoodThatchRoof" ), "sEWoodThatchRoof" );
	world.add( world.getStaticEntity( "VillageTown", "southTreeCluster" ), "southTreeCluster" );
	world.add( world.getStaticEntity( "VillageTown", "strawRoof" ), "strawRoof" );
	world.add( world.getStaticEntity( "VillageTown", "strawRoofEastGrayCross" ), "strawRoofEastGrayCross" );
	world.add( world.getStaticEntity( "VillageTown", "strawRoofEastGray" ), "strawRoofEastGray" );
	world.add( world.getStaticEntity( "VillageTown", "sWThatchHouse" ), "sWThatchHouse" );
	world.add( world.getStaticEntity( "VillageTown", "sWThatchHouse" ), "sWThatchHouse" );
	world.add( world.getStaticEntity( "VillageTown", "sWWall2" ), "sWWall2" );
	world.add( world.getStaticEntity( "VillageTown", "sWWall" ), "sWWall" );
	world.add( world.getStaticEntity( "VillageTown", "thatchRoof" ), "thatchRoof" );
	world.add( world.getStaticEntity( "VillageTown", "topTreeBottom" ), "topTreeBottom" );
	world.add( world.getStaticEntity( "VillageTown", "topTree" ), "topTree" );
	world.add( world.getStaticEntity( "VillageTown", "treetops" ), "treetops" );
	world.add( world.getStaticEntity( "VillageTown", "wall" ), "wall" );
	world.add( world.getStaticEntity( "VillageTown", "westTreeCluster" ), "westTreeCluster" );
	world.add( world.getStaticEntity( "VillageTown", "westTree" ), "westTree" );

	// TODO: Set up world
}

void setUpPriamAltar() {
	world.add( world.getStaticEntity( "PriamAltar", "walls"), "walls" );
}


void setUpBoundary()
{
	world.add(world.getStaticEntity(""))
}