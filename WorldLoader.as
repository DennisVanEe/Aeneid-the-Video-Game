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


void setUpBoundary()
{
	world.add(world.getStaticEntity(""))
}