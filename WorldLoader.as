#include "include/World.as"

World world;

void initialize() {
	world = World();

	setUpWorld( "VillageTown", "villageTownMap" );
}

void setUpWorld( string contName, string entName ) {
	world.add( world.getStaticEntity( contName, entName ), entName );

	if( contName.equals( "VillageTown" ) )
		setUpVillageTown();
}

void step( uint32 milliseconds ) {

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
	world.add( world.getStaticEntity( "VillageTown", "" ), "" );
	world.add( world.getStaticEntity( "VillageTown", "" ), "" );
	
}